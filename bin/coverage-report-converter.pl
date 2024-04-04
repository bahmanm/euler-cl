#!/usr/bin/perl
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

{


  package RawCvgData ;
  use Moose ;

  has 'line_no' => ( is => 'rw', isa => 'Int' ) ;
  has 'state'   => ( is => 'rw', isa => 'Int' ) ;
}

####################################################################################################

{


  package CvgData ;
  use Moose ;

  has 'start_line_no'   => ( is => 'rw', isa => 'Int' ) ;
  has 'start_column_no' => ( is => 'rw', isa => 'Int' ) ;
  has 'end_line_no'     => ( is => 'rw', isa => 'Int' ) ;
  has 'end_column_no'   => ( is => 'rw', isa => 'Int' ) ;
  has 'covered'         => ( is => 'rw', isa => 'Boolean' ) ;
}

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

sub get_test_coverage_data ( $tree )
{
  my @coverage_data = () ;
  my @nobrs         = $tree->findnodes ( "//nobr" ) ;
  foreach my $nobr ( @nobrs )
  {
    my $line_no   = get_line_no ( $nobr ) ;
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

sub get_line_no ( $nobr )
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

my $html_file =
  "/home/bahman/workspace/euler-cl/euler-cl/_build/coverage/1c372e17b26448c333047a14618c9a17.html" ;
my @raw_coverage_data = process_html_tree ( $html_file, \&get_test_coverage_data ) ;
say "-" x 80 ;
dump ( \@raw_coverage_data ) ;
my @compacted_data = compact_coverage_data ( @raw_coverage_data ) ;
say "-" x 80 ;
dump ( \@compacted_data ) ;

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
          start_column_no => 1
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
