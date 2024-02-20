;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p03
  (:use :cl :it.bese.fiveam
        :euler/p03)
  (:export #:p03-test-suite))
(in-package :euler/tests/p03)

(def-suite
    p03-test-suite
    :description "Problem 3 test suite.")
(in-suite p03-test-suite)

(test solution*
  (is (= 5 (euler/p03::solution* 10 2 1)))
  (is (= 10 (euler/p03::solution* 10 10 1)))
  (is (= 13 (euler/p03::solution* 13 2 1))))

(test solution
  (is (= 5 (euler/p03:solution 10)))
  (is (= 7 (euler/p03:solution 14)))
  (is (= 13 (euler/p03:solution 13))))
