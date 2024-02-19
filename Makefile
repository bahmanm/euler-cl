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

lisp.implementation := sbcl

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

lisp : bmakelib.error-if-blank( sbcl_snippet )
lisp :
	snippet_file="$${TMPDIR:-/tmp}/$$(mktemp euler-cl-XXXXXX)" \
	&& echo "$${sbcl_snippet}" > "$${snippet_file}" \
	&& $(lisp.implementation) --load "$${snippet_file}"


####################################################################################################

.PHONY : test

test : export sbcl_snippet := $(call lisp.snippet,tests)
test : lisp

####################################################################################################

.PHONY : run

run : export sbcl_snippet := $(call lisp.snippet,solutions)
run : lisp

####################################################################################################
