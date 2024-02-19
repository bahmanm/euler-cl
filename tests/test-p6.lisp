;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p6
  (:use :cl :it.bese.fiveam)
  (:export #:p6-test-suite))
(in-package :euler/tests/p6)

(def-suite
    p6-test-suite
    :description "Problem 6 test suite.")
(in-suite p6-test-suite)


(test sum-1-to-n
  (is (= 1 (euler/p6::sum-1-to-n 1)))
  (is (= 3 (euler/p6::sum-1-to-n 2)))
  (is (= 6 (euler/p6::sum-1-to-n 3)))
  (is (= 55 (euler/p6::sum-1-to-n 10))))

(test sum-squared-1-to-n
  (is (= 1 (euler/p6::sum-squared-1-to-n 1)))
  (is (= 5 (euler/p6::sum-squared-1-to-n 2)))
  (is (= 14 (euler/p6::sum-squared-1-to-n 3)))
  (is (= 385 (euler/p6::sum-squared-1-to-n 10))))

(test solution
  (is (= 0 (euler/p6::solution 1)))
  (is (= 4 (euler/p6::solution 2)))
  (is (= 22 (euler/p6::solution 3)))
  (is (= 2640 (euler/p6::solution 10))))
