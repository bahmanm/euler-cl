;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p08
  (:use :cl :it.bese.fiveam)
  (:export #:p08-test-suite))
(in-package :euler/tests/p08)

(def-suite
    p08-test-suite
    :description "Problem 8 test suite.")
(in-suite p08-test-suite)


(test product-of-first-n
  (is (= 0 (euler/p08::product-of-first-n 3 '(1 0 4))))
  (is (= 6 (euler/p08::product-of-first-n 3 '(1 2 3 4))))
  (is (= -1 (euler/p08::product-of-first-n 3 '(1 1)))))

(test max-product-of-first-n
  (is (= 4 (euler/p08::max-product-of-first-n 1 '(1 0 1 4 1))))
  (is (= 4 (euler/p08::max-product-of-first-n 2 '(1 0 1 4 1))))
  (is (= 4 (euler/p08::max-product-of-first-n 3 '(1 0 1 4 1))))
  (is (= 0 (euler/p08::max-product-of-first-n 4 '(1 0 1 4 1))))
  (is (= 0 (euler/p08::max-product-of-first-n 5 '(1 0 1 4 1))))
  (is (= -1 (euler/p08::max-product-of-first-n 6 '(1 0 1 4 1)))))

(test solution
  (is (= 4 (euler/p08:solution 1 10141)))
  (is (= 4 (euler/p08:solution 2 10141)))
  (is (= 4 (euler/p08:solution 3 10141)))
  (is (= 0 (euler/p08:solution 4 10141)))
  (is (= 0 (euler/p08:solution 5 10141)))
  (is (= -1 (euler/p08:solution 6 10141))))
