;;;; https://projecteuler.net/problem=30
;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/p30
  (:use :cl)
  (:export #:solution))
(in-package :euler/p30)


(defun search-limit (power)
  (do* ((max-digit-value (expt 9 power))
        (n-digits 3
                  (1+ n-digits))
        (min-number (expt 10 (1- n-digits))
                    (* min-number 10))
        (max-number (* max-digit-value n-digits)
                    (* max-digit-value n-digits))
        (result 0))
       (nil)
    (if (< max-number min-number)
        (return (1+ result))
        (setf result max-number))))

(defun sum-of-digits (n power)
  (do* ((digits (euler/utils:integer-to-list n)
                (rest digits))
        (d (first digits)
           (first digits))
        (d-power (expt d power)
                 (expt d power))
        (sum d-power
             (+ sum d-power)))
       ((null (rest digits)) sum)))

(defun solution1 (power)
  (do* ((limit (search-limit power))
        (n 9
           (1+ n))
        (digits-sum (sum-of-digits n power)
                    (sum-of-digits n power))
        (result '()
                (if (= n digits-sum)
                    (cons n result)
                    result)))
       ((= n limit) result)))

(defun solution (&optional (power 5))
  (reduce #'+ (solution1 power)))
