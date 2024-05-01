#!/usr/bin/perl
# -*- mode: cperl; cperl-indent-level: 2; -*-
use strict ;
use warnings ;
use diagnostics ;
use utf8 ;
use feature ':5.38' ;
use Encode     qw(decode_utf8) ;
use Data::Dump qw(dump) ;
use HTML::TreeBuilder ;
use HTML::TreeBuilder::XPath ;
use constant {
  true        => 0,
  false       => 1,
  COVERED     => 1,
  NOT_COVERED => 2,
  SKIP        => 0,
  UNKNOWN     => -1
} ;

####################################################################################################

our $project_root     = "/home/bahman/workspace/euler-cl/euler-cl/" ;
our $src_dir          = "src/" ;
our $src_root         = "${project_root}${src_dir}" ;
our $raw_reports_root = "${project_root}_build/coverage/" ;
our $target_report    = "${project_root}_build/test-coverage-reports/coverage.txt" ;

####################################################################################################

sub process_html_tree ( $html_file, $subref )
{
  my $tree = HTML::TreeBuilder::XPath->new ;
  $tree->parse_file ( $html_file ) ;
  $tree->elementify () ;
  my @result = $subref->( $tree ) ;
  $tree->delete () ;
  return @result ;
}

####################################################################################################

sub processor_test_coverage_data ( $tree )
{
  my @coverage_data = () ;
  my @nobrs         = $tree->findnodes ( "//nobr" ) ;
  foreach my $nobr ( @nobrs )
  {
    my $line_no   = processor_line_no ( $nobr ) ;
    my $line_data = { line_no => $line_no } ;
    if ( $nobr->exists ( 'div[@class="source"]/code/span' ) )
    {
      if ( $nobr->exists ( 'div[@class="source"]/code/span[@class="state-2"]' ) )
      {
        $line_data->{ state } = NOT_COVERED ;
      }
      elsif ( $nobr->exists ( 'div[@class="source"]/code/span[@class="state-1"]' ) )
      {
        $line_data->{ state } = COVERED ;
      }
      elsif ( $nobr->exists ( 'div[@class="source"]/code/span[@class="state-0"]' ) )
      {
        $line_data->{ state } = SKIP ;
      }
      else
      {
        $line_data->{ state } = UNKNOWN ;
      }
      push ( @coverage_data, $line_data ) ;
    }
  }
  return @coverage_data ;
}

####################################################################################################

sub processor_line_no ( $nobr )
{
  my @nodes = $nobr->findnodes ( 'div[@class="source"]/div[@class="line-number"]/code' ) ;
  if ( @nodes )
  {
    my $line_no_tag = $nodes[ 0 ] ;
    my @contents    = $line_no_tag->content_list () ;
    if ( @contents )
    {
      return $contents[ 0 ] ;
    }
  }
}

####################################################################################################

sub get_test_target_path ( $tree )
{
  my @nodes = $tree->findnodes ( "body/h3" ) ;
  if ( @nodes )
  {
    my $h3       = $nodes[ 0 ] ;
    my @contents = $h3->content_list () ;
    if ( @contents )
    {
      my $line = $contents[ 0 ] ;
      if ( $line =~ /^\s*Coverage report:\s*${src_root}(.+)\s+$/ )
      {
        return $1 ;
      }
    }
  }
  return undef ;
}

####################################################################################################

sub compact_coverage_data ( @coverage_data )
{
  my @result = () ;

  my $is_compacting       = false ;
  my $is_compacting_state = NOT_COVERED ;
  my $compacted_data ;
  while ( my $cvgdata = shift ( @coverage_data ) )
  {
    if ( $cvgdata->{ state } == SKIP )
    {
      next ;
    }
    elsif ( $is_compacting == false )
    {
      $compacted_data =
      {
          start_line_no   => $cvgdata->{ line_no },
          start_column_no => 1,
          end_line_no     => $cvgdata->{ line_no },
          end_column_no   => 120
      } ;
      if ( $cvgdata->{ state } == COVERED )
      {
        $compacted_data->{ covered } = 1 ;
      }
      else
      {
        $compacted_data->{ covered } = 0 ;
      }
      $is_compacting_state = $cvgdata->{ state } ;
      $is_compacting       = true ;
    }
    elsif ( $is_compacting == true )
    {
      if ( $cvgdata->{ state } == $is_compacting_state )
      {
        $compacted_data->{ end_line_no }   = $cvgdata->{ line_no } ;
        $compacted_data->{ end_column_no } = 120 ;
      }
      else
      {
        $is_compacting = false ;
        push ( @result, $compacted_data ) ;
        unshift ( @coverage_data, $cvgdata ) ;
        $compacted_data = undef ;
      }
    }
    else
    {
      say "Unknown state.  Aborting..." ;
      exit ( 1 ) ;
    }
  }
  if ( $is_compacting == true )
  {
    push ( @result, $compacted_data ) ;
  }
  return @result ;
}

####################################################################################################

sub process_raw_coverage_file ( $html_file )
{
  my @src_files = process_html_tree ( $html_file, \&get_test_target_path ) ;
  if ( @src_files && $src_files[ 0 ] )
  {
    my $src_file = $src_files[ 0 ] ;
    unless ( $src_file )
    {
      say ( "undefined src_file ($html_file)" ) ;
    }
    my @raw_coverage_data = process_html_tree ( $html_file, \&processor_test_coverage_data ) ;
    my @compacted_data    = compact_coverage_data ( @raw_coverage_data ) ;
    return {
      src_file => $src_file,
      data     => \@compacted_data
    } ;
  }
  return undef ;
}

####################################################################################################

open ( my $fh, ">${target_report}" ) or die ( "open(): $!\n" ) ;

printf $fh ( "mode: set\n" ) ;

my @raw_coverage_files = glob ( "${raw_reports_root}*.html" ) ;
for my $raw_coverage_file ( @raw_coverage_files )
{
  my $coverage_data = process_raw_coverage_file ( $raw_coverage_file ) ;
  if ( $coverage_data )
  {
    my $src_file = $coverage_data->{ src_file } ;
    foreach my $entry ( @{ $coverage_data->{ data } } )
    {
      printf $fh (
        "${src_dir}${src_file}:%d.%d,%d.%d 1 %d\n",
        $entry->{ start_line_no },
        $entry->{ start_column_no },
        $entry->{ end_line_no },
        $entry->{ end_column_no },
        $entry->{ covered }
      ) ;
    }
  }
}

close ( $fh ) ;
