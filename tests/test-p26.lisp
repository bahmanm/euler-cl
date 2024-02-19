;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/tests/p26
  (:use :cl :it.bese.fiveam
        :euler/p26)
  (:export #:p26-test-suite))
(in-package :euler/tests/p26)

(def-suite
    p26-test-suite
    :description "Problem 26 test suite.")
(in-suite p26-test-suite)

(test unit-fraction-decimal
  (is (equalp #(5)
              (euler/p26::unit-fraction-decimal 2)))
  (is (equalp #(3 3 3 3)
              (euler/p26::unit-fraction-decimal 3)))
  (is (equalp #(2 5)
              (euler/p26::unit-fraction-decimal 4)))
  (is (equalp #(2)
              (euler/p26::unit-fraction-decimal 5)))
  (is (equalp #(1 6 6 6 6 6 6 6 6 6)
              (euler/p26::unit-fraction-decimal 6)))
  (is (equalp #(1 4 2 8 5 7 1 4 2 8 5 7)
              (euler/p26::unit-fraction-decimal 7)))
  (is (equalp #(1 2 5)
              (euler/p26::unit-fraction-decimal 8)))
  (is (equalp #(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)
              (euler/p26::unit-fraction-decimal 9)))
  (is (equalp #(1)
              (euler/p26::unit-fraction-decimal 10))))

(test shortest-cycle
  (is (equalp #() (euler/p26::shortest-cycle #())))
  (is (equalp #() (euler/p26::shortest-cycle #(1))))
  (is (equalp #() (euler/p26::shortest-cycle #(1 2))))
  (is (equalp #() (euler/p26::shortest-cycle #(1 2 3 4))))
  (is (equalp #(1) (euler/p26::shortest-cycle #(2 1 1 1))))
  (is (equalp #() (euler/p26::shortest-cycle #(1 1 1 2))))
  (is (equalp #(1 2 1) (euler/p26::shortest-cycle #(3 1 2 1 1 2 1)))))

(test solution
  (is (= 3 (euler/p26:solution 3)))
  (is (= 3 (euler/p26:solution 4)))
  (is (= 3 (euler/p26:solution 5)))
  (is (= 6 (euler/p26:solution 6)))
  (is (= 7 (euler/p26:solution 7)))
  (is (= 7 (euler/p26:solution 8)))
  (is (= 7 (euler/p26:solution 9)))
  (is (= 7 (euler/p26:solution 10))))
