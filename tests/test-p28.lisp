;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/tests/p28
  (:use :cl :it.bese.fiveam
        :euler/p28)
  (:export #:p28-test-suite))
(in-package :euler/tests/p28)

(def-suite
    p28-test-suite
    :description "Problem 28 test suite.")
(in-suite p28-test-suite)


(test solution1
  (is (equalp '(1 1) (euler/p28::solution1 1 1))
  (is (equalp '(25 9) (euler/p28::solution1 3 1)))
  (is (equalp '(101 25) 24 (euler/p28::solution1 5 1)))
  (is (equalp '(261 49) (euler/p28::solution1 7 1)))))

(test solution
  (is (= 1 (euler/p28:solution 1)))
  (is (= 25 (euler/p28:solution 3)))
  (is (= 101 (euler/p28:solution 5)))
  (is (= 261 (euler/p28:solution 7))))
