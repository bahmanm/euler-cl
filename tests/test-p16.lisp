;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p16
  (:use :cl :it.bese.fiveam
        :euler/p16)
  (:export #:p16-test-suite))
(in-package :euler/tests/p16)

(def-suite
    p16-test-suite
    :description "Problem 16 test suite.")
(in-suite p16-test-suite)

(test solution
  (is (= 1 (euler/p16:solution 10 1)))
  (is (= 1 (euler/p16:solution 10 2)))
  (is (= 2 (euler/p16:solution 2 1)))
  (is (= 4 (euler/p16:solution 2 2)))
  (is (= 13 (euler/p16:solution 2 8)))
  (is (= 7 (euler/p16:solution 2 10))))
