;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/tests/p38
  (:use :cl :it.bese.fiveam
        :euler/p38)
  (:export #:p38-test-suite))
(in-package :euler/tests/p38)

(def-suite
    p38-test-suite
  :description "Problem 38 test suite.")
(in-suite p38-test-suite)

(test pandigitalp
  (is-true (euler/p38::pandigitalp 123456789))
  (is-true (euler/p38::pandigitalp 987123456))
  (is-true (euler/p38::pandigitalp 192837465))
  (is-false (euler/p38::pandigitalp 111222333))
  (is-false (euler/p38::pandigitalp 123456780))
  (is-false (euler/p38::pandigitalp 10)))

(test number-to-digits
  (is-true (equal (euler/p38::number-to-digits 1)
                  '(1)))
  (is-true (equal (euler/p38::number-to-digits 123)
                  '(1 2 3)))
  (is-true (equal (euler/p38::number-to-digits 1230)
                  '(1 2 3 0))))

(test concat-numbers
  (is-true (equal (euler/p38::concat-numbers 1)
                  1))
  (is-true (equal (euler/p38::concat-numbers 1 2 3)
                  123))
  (is-true (equal (euler/p38::concat-numbers 10 20 309)
                  1020309)))

(test digit-count
  (is-true (equal (euler/p38::digit-count 9)
                  1))
  (is-true (equal (euler/p38::digit-count 99)
                  2))
  (is-true (equal (euler/p38::digit-count 999)
                  3))
  (is-true (equal (euler/p38::digit-count 9999)
                  4))
  (is-true (equal (euler/p38::digit-count 99999)
                  5))
  (is-true (equal (euler/p38::digit-count 999999)
                  6))
  (is-true (equal (euler/p38::digit-count 9999999)
                  7))
  (is-true (equal (euler/p38::digit-count 99999999)
                  8))
  (is-true (equal (euler/p38::digit-count 999999999)
                  9))
  (is-true (equal (euler/p38::digit-count 9999999999)
                  10)))

(test products
  (is-true (equal (euler/p38::products 1)
                  '(1 2 3 4 5 6 7 8 9)))
  (is-true (equal (euler/p38::products 5)
                  '(5 10 15 20 25)))
  (is-true (equal (euler/p38::products 9)
                  '(9 18 27 36 45)))
  (is-true (equal (euler/p38::products 192)
                  '(192 384 576)))  )
