;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p04
  (:use :cl)
  (:export #:solution))
(in-package :euler/p04)


(defun palindromic-numberp (n)
  (let ((n-string (write-to-string n)))
    (string-equal n-string (reverse n-string))))

(defun max-palindromic-product (nmin nmax)
  (labels ((max-palindromic-product (result n1 n2)
             (cond
               ((< n2 nmin)
                (max-palindromic-product result (1- n1) nmax))
               ((< n1 nmin)
                result)
               (t
                (let* ((product (* n1 n2))
                       (result (if (and (palindromic-numberp product) (> product result))
                                   product
                                   result)))
                  (max-palindromic-product result n1 (1- n2)))))))
    (max-palindromic-product 0 nmax nmax)))

(defun solution (&optional (min-factor 100) (max-factor 999))
  (max-palindromic-product min-factor max-factor))
