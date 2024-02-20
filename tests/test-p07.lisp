;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p07
  (:use :cl :it.bese.fiveam)
  (:export #:p07-test-suite))
(in-package :euler/tests/p07)

(def-suite
    p07-test-suite
    :description "Problem 7 test suite.")
(in-suite p07-test-suite)


(test nth-prime
  (is (= 2 (euler/p07::nth-prime 1)))
  (is (= 3 (euler/p07::nth-prime 2)))
  (is (= 5 (euler/p07::nth-prime 3)))
  (is (= 7 (euler/p07::nth-prime 4)))
  (is (= 11 (euler/p07::nth-prime 5)))
  (is (= 13 (euler/p07::nth-prime 6))))

(test solution
  (is (= 2 (euler/p07::solution 1)))
  (is (= 3 (euler/p07::solution 2)))
  (is (= 5 (euler/p07::solution 3)))
  (is (= 7 (euler/p07::solution 4)))
  (is (= 11 (euler/p07::solution 5)))
  (is (= 13 (euler/p07::solution 6))))
