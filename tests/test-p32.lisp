;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/tests/p32
  (:use :cl :it.bese.fiveam
        :euler/p32)
  (:export #:p32-test-suite))
(in-package :euler/tests/p32)

(def-suite
    p32-test-suite
    :description "Problem 32 test suite.")
(in-suite p32-test-suite)


(test pandigitalp
  (is-true (euler/p32::pandigitalp 12 34 56789))
  (is-true (euler/p32::pandigitalp 213 49768 5))
  (is-true (euler/p32::pandigitalp 961 82 7534))
  (is-false (euler/p32::pandigitalp 10 234 56789))
  (is-false (euler/p32::pandigitalp 11 2345 6789))
  (is-false (euler/p32::pandigitalp 0 12345678 9)))

(test pandigital-identity-p
  (is-true (euler/p32::pandigital-identity-p 7254))
  (is-false (euler/p32::pandigital-identity-p 72))
  (is-false (euler/p32::pandigital-identity-p 7255)))
