;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p06
  (:use :cl :it.bese.fiveam)
  (:export #:p06-test-suite))
(in-package :euler/tests/p06)

(def-suite
    p06-test-suite
    :description "Problem 6 test suite.")
(in-suite p06-test-suite)


(test sum-1-to-n
  (is (= 1 (euler/p06::sum-1-to-n 1)))
  (is (= 3 (euler/p06::sum-1-to-n 2)))
  (is (= 6 (euler/p06::sum-1-to-n 3)))
  (is (= 55 (euler/p06::sum-1-to-n 10))))

(test sum-squared-1-to-n
  (is (= 1 (euler/p06::sum-squared-1-to-n 1)))
  (is (= 5 (euler/p06::sum-squared-1-to-n 2)))
  (is (= 14 (euler/p06::sum-squared-1-to-n 3)))
  (is (= 385 (euler/p06::sum-squared-1-to-n 10))))

(test solution
  (is (= 0 (euler/p06::solution 1)))
  (is (= 4 (euler/p06::solution 2)))
  (is (= 22 (euler/p06::solution 3)))
  (is (= 2640 (euler/p06::solution 10))))
