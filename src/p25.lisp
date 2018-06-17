;;;; https://projecteuler.net/problem=25
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p25
  (:use :cl)
  (:export #:solution))
(in-package :euler/p25)


(defun fibo-generator ()
  (let ((index 1)
        (term1 1)
        (term2 1))
    (labels ((next-fibo ()
               (if (or (= index 1) (= index 2))
                   (let ((result (list term1 index)))
                     (setf index (1+ index))
                     result)
                   (let* ((term3 (+ term2 term1))
                          (result (list term3 index)))
                     (setf index (1+ index))
                     (setf term1 term2)
                     (setf term2 term3)
                     result))))
      #'next-fibo)))

(defun solution (&optional (n (1+ (expt 10 999))))
  (let ((get-next-fibo-term (fibo-generator)))
    (do ((term (funcall get-next-fibo-term) (funcall get-next-fibo-term)))
        ((>= (first term) n) (second term)))))
