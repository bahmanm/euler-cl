;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p1
  (:use :cl :it.bese.fiveam
        :euler/p1)
  (:export #:p1-test-suite))
(in-package :euler/tests/p1)

(def-suite
    p1-test-suite
    :description "Problem 1 test suite.")
(in-suite p1-test-suite)

(test multiple-of-3-or-5p
  (is-true (euler/p1::multiple-of-3-or-5p 3))
  (is-true (euler/p1::multiple-of-3-or-5p 5))
  (is-true (euler/p1::multiple-of-3-or-5p 15))
  (is-false (euler/p1::multiple-of-3-or-5p 7)))

(test solution*
  (is (= 0 (euler/p1::solution* 1 0)))
  (is (= 23 (euler/p1::solution* 9 0)))
  (is (= 33 (euler/p1::solution* 10 0)))
  (is (= 53 (euler/p1::solution* 11 20))))

(test solution
  (is (= 0 (euler/p1:solution 2)))
  (is (= 23 (euler/p1:solution 10)))
  (is (= 33 (euler/p1:solution 11)))
  (is (= 33 (euler/p1:solution 12))))
