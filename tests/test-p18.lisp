;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p18
  (:use :cl :it.bese.fiveam
        :euler/p18)
  (:export #:p18-test-suite))
(in-package :euler/tests/p18)

(def-suite
    p18-test-suite
    :description "Problem 18 test suite.")
(in-suite p18-test-suite)


(test max-of-pairs
  (is (equal '(1) (euler/p18::max-of-pairs '(1))))
  (is (equal '(2) (euler/p18::max-of-pairs '(1 2))))
  (is (equal '(2 3) (euler/p18::max-of-pairs '(1 2 3))))
  (is (equal '(2 2) (euler/p18::max-of-pairs '(1 2 2))))
  (is (equal '(2 3 3) (euler/p18::max-of-pairs '(1 2 3 1))))
  (is (equal '(5 5 3 1) (euler/p18::max-of-pairs '(4 5 3 0 1)))))

(test sum
  (is (equal '(2) (euler/p18::sum '(1) '(1))))
  (is (equal '(1 2) (euler/p18::sum '(1 2) '(0 0))))
  (is (equal '(101 202 303) (euler/p18::sum '(1 2 3) '(100 200 300)))))

(test reduce-to-max-sum
  (is (= 1 (euler/p18::reduce-to-max-sum '((1)))))
  (is (= 2 (euler/p18::reduce-to-max-sum '((1 1) (1)))))
  (is (= 3 (euler/p18::reduce-to-max-sum '((2 1) (1)))))
  (is (= 12 (euler/p18::reduce-to-max-sum '((1 2 10) (4 1) (1))))))

(test solution
  (is (= 1 (euler/p18:solution '((1)))))
  (is (= 2 (euler/p18:solution '((1) (1 1)))))
  (is (= 3 (euler/p18:solution '((1) (2 1)))))
  (is (= 12 (euler/p18:solution '((1) (4 1) (1 2 10)))))
  (is (= 23 (euler/p18:solution '((3) (7 4) (2 4 6) (8 5 9 3))))))
