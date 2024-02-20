;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p09
  (:use :cl :it.bese.fiveam)
  (:export #:p09-test-suite))
(in-package :euler/tests/p09)

(def-suite
    p09-test-suite
    :description "Problem 9 test suite.")
(in-suite p09-test-suite)

(test compute-abc
  (is (equal '(3 4 5) (euler/p09::compute-abc 12 2 3)))
  (is (equal '(0 6 6) (euler/p09::compute-abc 12 1 2))))

(test find-mk
  (is (equal '(2 3) (euler/p09::find-mk 2 2 12))))

(test solution
  (is (= 60 (euler/p09:solution 12))))
