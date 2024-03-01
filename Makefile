SHELL := /usr/bin/env bash
.DEFAULT_GOAL := test

####################################################################################################

root.dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
sources.dir := $(root.dir)src/
tests.dir := $(root.dir)tests/

####################################################################################################

.PHONY : bmakelib/bmakelib.mk
include  bmakelib/bmakelib.mk

####################################################################################################

define-enum-lisps : bmakelib.enum.define( lisps/sbcl )

include define-enum-lisps

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

define lisp.run-solutions
(asdf:load-system :euler)
(euler:solutions)
endef

define lisp.exit
(exit)
endef

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
	lisp_file="$${TMPDIR:-/tmp}/$$(mktemp euler-cl-XXXXXX)" \
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

.PHONY : test

test : export lisp_snippet := $(call lisp.snippet,tests)
test : lisp

####################################################################################################

.PHONY : run

run : export lisp_snippet := $(call lisp.snippet,solutions)
run : lisp

####################################################################################################
