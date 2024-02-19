;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p14
  (:use :cl :it.bese.fiveam
        :euler/p14)
  (:export #:p14-test-suite))
(in-package :euler/tests/p14)

(def-suite
    p14-test-suite
    :description "Problem 14 test suite.")
(in-suite p14-test-suite)


(test count-chain-terms
  (is (= 10 (euler/p14::count-chain-terms 13)))
  (is (= 1 (euler/p14::count-chain-terms 1)))
  (is (= 2 (euler/p14::count-chain-terms 2)))
  (is (= 8 (euler/p14::count-chain-terms 3)))
  (is (= 3 (euler/p14::count-chain-terms 4)))
  (is (= 6 (euler/p14::count-chain-terms 5)))
  (is (= 9 (euler/p14::count-chain-terms 6)))
  (is (= 17 (euler/p14::count-chain-terms 7)))
  (is (= 4 (euler/p14::count-chain-terms 8)))
  (is (= 20 (euler/p14::count-chain-terms 9)))
  (is (= 7 (euler/p14::count-chain-terms 10))))

(test solution
  (is (= 1 (euler/p14:solution 1)))
  (is (= 2 (euler/p14:solution 2)))
  (is (= 3 (euler/p14:solution 3)))
  (is (= 3 (euler/p14:solution 4)))
  (is (= 3 (euler/p14:solution 5)))
  (is (= 6 (euler/p14:solution 6)))
  (is (= 7 (euler/p14:solution 7)))
  (is (= 7 (euler/p14:solution 8)))
  (is (= 9 (euler/p14:solution 9)))
  (is (= 9 (euler/p14:solution 10))))
