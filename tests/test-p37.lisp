;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/tests/p37
  (:use :cl :it.bese.fiveam
        :euler/p37)
  (:export #:p37-test-suite))
(in-package :euler/tests/p37)

(def-suite
    p37-test-suite
    :description "Problem 37 test suite.")
(in-suite p37-test-suite)


(test right-truncatable-prime-p
  (is-true (euler/p37::right-truncatable-prime-p 37))
  (is-true (euler/p37::right-truncatable-prime-p 23))
  (is-true (euler/p37::right-truncatable-prime-p 379))
  (is-false (euler/p37::right-truncatable-prime-p 11))
  (is-false (euler/p37::right-truncatable-prime-p 113))
  (is-false (euler/p37::right-truncatable-prime-p 13)))

(test left-truncatable-prime-p
  (is-true (euler/p37::right-truncatable-prime-p 37))
  (is-true (euler/p37::right-truncatable-prime-p 23))
  (is-true (euler/p37::right-truncatable-prime-p 379))
  (is-false (euler/p37::right-truncatable-prime-p 11))
  (is-false (euler/p37::right-truncatable-prime-p 13)))
