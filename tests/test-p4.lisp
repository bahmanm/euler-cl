;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p4
  (:use :cl :it.bese.fiveam)
  (:export #:p4-test-suite))
(in-package :euler/tests/p4)

(def-suite
    p4-test-suite
    :description "Problem 4 test suite.")
(in-suite p4-test-suite)

(test palindromic-numberp
  (is-true (euler/p4::palindromic-numberp 1))
  (is-true (euler/p4::palindromic-numberp 11))
  (is-true (euler/p4::palindromic-numberp 111))
  (is-true (euler/p4::palindromic-numberp 101))
  (is-true (euler/p4::palindromic-numberp 1221))
  (is-true (euler/p4::palindromic-numberp 12921)))

(test max-palindromic-product
  (is (= 9009 (euler/p4::max-palindromic-product 10 99)))
  (is (= 9 (euler/p4::max-palindromic-product 1 9))))

(test solution
  (is (= 9009 (euler/p4::solution 10 99)))
  (is (= 9 (euler/p4::solution 1 9))))
