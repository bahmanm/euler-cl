;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p04
  (:use :cl :it.bese.fiveam)
  (:export #:p04-test-suite))
(in-package :euler/tests/p04)

(def-suite
    p04-test-suite
    :description "Problem 4 test suite.")
(in-suite p04-test-suite)

(test palindromic-numberp
  (is-true (euler/p04::palindromic-numberp 1))
  (is-true (euler/p04::palindromic-numberp 11))
  (is-true (euler/p04::palindromic-numberp 111))
  (is-true (euler/p04::palindromic-numberp 101))
  (is-true (euler/p04::palindromic-numberp 1221))
  (is-true (euler/p04::palindromic-numberp 12921)))

(test max-palindromic-product
  (is (= 9009 (euler/p04::max-palindromic-product 10 99)))
  (is (= 9 (euler/p04::max-palindromic-product 1 9))))

(test solution
  (is (= 9009 (euler/p04::solution 10 99)))
  (is (= 9 (euler/p04::solution 1 9))))
