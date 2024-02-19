;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p20
  (:use :cl :it.bese.fiveam
        :euler/p20)
  (:export #:p20-test-suite))
(in-package :euler/tests/p20)

(def-suite
    p20-test-suite
    :description "Problem 20 test suite.")
(in-suite p20-test-suite)


(test factorial
  (is (= 1 (euler/p20::factorial 1)))
  (is (= 2 (euler/p20::factorial 2)))
  (is (= 6 (euler/p20::factorial 3)))
  (is (= 24 (euler/p20::factorial 4)))
  (is (= 120 (euler/p20::factorial 5))))

(test solution
  (is (= 1 (euler/p20:solution 1)))
  (is (= 2 (euler/p20:solution 2)))
  (is (= 6 (euler/p20:solution 3)))
  (is (= 6 (euler/p20:solution 4)))
  (is (= 3 (euler/p20:solution 5))))
