;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p6
  (:use :cl)
  (:export #:solution))
(in-package :euler/p6)


(defun sum-1-to-n (n)
  (/ (* n (1+ n)) 2))

(defun sum-squared-1-to-n (n)
  (labels ((sum-squared-1-to-n (result n)
             (if (zerop n)
                 result
                 (let ((result (+ (expt n 2) result)))
                   (sum-squared-1-to-n result (1- n))))))
  (sum-squared-1-to-n 0 n)))

(defun solution (&optional (n 100))
  (- (expt (sum-1-to-n n) 2)
     (sum-squared-1-to-n n)))
