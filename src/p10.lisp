;;;; https://projecteuler.net/problem=10
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p10
  (:use :cl)
  (:export #:solution))
(in-package :euler/p10)


(defun sum-all-primes (from to &optional (sum 0) (current-number from))
  (if (> current-number to)
      sum
      (let ((sum (+ sum (if (euler/utils:primep current-number)
                            current-number
                            0))))
          (sum-all-primes from to sum (1+ current-number)))))

(defun solution (&optional (limit 2000000))
  (sum-all-primes 0 limit))
