SHELL := /usr/bin/env bash
.DEFAULT_GOAL := test

####################################################################################################

root.dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
sources.dir := $(root.dir)src/
tests.dir := $(root.dir)tests/
build.dir := $(root.dir)_build/

tests.coverage-report.dir := $(build.dir)test-coverage-reports/
tests.coverage-report.processor := $(root.dir)bin/coverage-report-converter.pl

####################################################################################################

.PHONY : bmakelib/bmakelib.mk
include  bmakelib/bmakelib.mk

####################################################################################################

define-enum-lisps : bmakelib.enum.define( lisps/sbcl )

include define-enum-lisps

####################################################################################################

$(build.dir) :
	mkdir -p $(@) $(test.coverage-report.dir)

####################################################################################################

.PHONY : clean

clean :
	-rm -rf $(build.dir)

####################################################################################################

define lisp.modify-path
(setf asdf:*central-registry*
      (list* '*default-pathname-defaults*
             (car (directory #p"$(root.dir)"))
             asdf:*central-registry*))
endef

define lisp.run-tests
(asdf:load-system :euler)
(asdf:load-system :euler-tests)
(asdf:test-system :euler)
endef

# 1: coverage report directory
define lisp.run-tests-with-coverage
(require :sb-cover)
(declaim (optimize sb-cover:store-coverage-data))
$(call lisp.run-tests)
(sb-cover:report "$(tests.coverage-report.dir)")
(declaim (optimize (sb-cover:store-coverage-data 0)))
endef

define lisp.run-solutions
(asdf:load-system :euler)
(euler:solutions)
endef

define lisp.exit
(exit)
endef

# 1: snippet to run
define lisp.snippet
$(lisp.modify-path)
$(lisp.run-$(1))
$(lisp.exit)
endef

####################################################################################################

.PHONY : lisp

lisp : bmakelib.error-if-blank( lisp_snippet )
lisp : bmakelib.default-if-blank( lisp,sbcl ) \
       bmakelib.enum.error-unless-member( lisps,lisp )
lisp :
	lisp_file="$$(mktemp --tmpdir euler-cl-XXXXXX)" \
	&& echo "$${lisp_snippet}" > "$${lisp_file}" \
	&& $(lisp) \
		--non-interactive \
		--eval "(ql:quickload :asdf)" \
		--eval "(asdf:load-system :asdf)" \
		--eval "(ql:quickload :alexandria)" \
		--eval "(ql:quickload :fiveam)" \
		--eval "(ql:quickload :cl-ppcre)" \
		--load "$${lisp_file}"


####################################################################################################

.PHONY : test.run

test.run : export lisp_snippet := $(call lisp.snippet,tests$(if $(filter yes,$(test.produce-coverage-report)),-with-coverage,))
test.run : $(if $(filter yes,$(test.produce-coverage-report)),clean,)
test.run : lisp

####################################################################################################

.PHONY : test.codecov-report

test.codecov-report :
	$(tests.coverage-report.processor) \
		$(root.dir) \
		src \
		$(tests.coverage-report.dir) \
		$(build.dir)coverage.txt

####################################################################################################

.PHONY : test

test : | $(build.dir)
test : bmakelib.default-if-blank( test.produce-coverage-report,no )
test : test.run
test : $(if $(filter yes,$(test.produce-coverage-report)),test.codecov-report,)

####################################################################################################

.PHONY : run

run : export lisp_snippet := $(call lisp.snippet,solutions)
run : lisp

####################################################################################################
