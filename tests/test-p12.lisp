;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p12
  (:use :cl :it.bese.fiveam
        :euler/p12)
  (:export #:p12-test-suite))
(in-package :euler/tests/p12)

(def-suite
    p12-test-suite
    :description "Problem 12 test suite.")
(in-suite p12-test-suite)


(test count-divisors
  (is (equal 1 (euler/p12::count-divisors 1 nil)))
  (is (equal 2 (euler/p12::count-divisors 2 nil)))
  (is (equal 2 (euler/p12::count-divisors 3 nil)))
  (is (equal 4 (euler/p12::count-divisors 6 nil)))
  (is (equal 4 (euler/p12::count-divisors 15 nil)))
  (is (equal 8 (euler/p12::count-divisors 24 nil))))

(test solution
  (is (= 1 (euler/p12:solution 1)))
  (is (= 3 (euler/p12:solution 2)))
  (is (= 28 (euler/p12:solution 5))))
