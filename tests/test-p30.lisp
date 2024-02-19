;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/tests/p30
  (:use :cl :it.bese.fiveam
        :euler/p30)
  (:export #:p30-test-suite))
(in-package :euler/tests/p30)

(def-suite
    p30-test-suite
    :description "Problem 30 test suite.")
(in-suite p30-test-suite)


(test search-limit
  (is (= 2917 (euler/p30::search-limit 3)))
  (is (= 32806 (euler/p30::search-limit 4)))
  (is (= 354295 (euler/p30::search-limit 5))))

(test sum-of-digits
  (is (= 5 (euler/p30::sum-of-digits 12 2)))
  (is (= 1 (euler/p30::sum-of-digits 10 2)))
  (is (= 10 (euler/p30::sum-of-digits 112 3)))
  (is (= 1 (euler/p30::sum-of-digits 100 5)))
  (is (= 28 (euler/p30::sum-of-digits 103 3))))

(test solution1
  (is (equalp '(407 371 370 153) (euler/p30::solution1 3)))
  (is (equalp '(9474 8208 1634) (euler/p30::solution1 4))))

(test solution
  (is (= 1301 (euler/p30:solution 3)))
  (is (= 19316 (euler/p30:solution 4))))
