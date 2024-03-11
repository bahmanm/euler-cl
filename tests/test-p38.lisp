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
