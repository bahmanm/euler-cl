;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p33
  (:use :cl :it.bese.fiveam
        :euler/p33)
  (:export #:p33-test-suite))
(in-package :euler/tests/p33)

(def-suite
    p33-test-suite
    :description "Problem 33 test suite.")
(in-suite p33-test-suite)


(test curiousp
  (is-true (euler/p33::curiousp 4 8 9))
  (is-false (euler/p33::curiousp 1 1 1))
  (is-false (euler/p33::curiousp 4 8 1)))
