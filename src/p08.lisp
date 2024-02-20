;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p08
  (:use :cl)
  (:export #:solution))
(in-package :euler/p08)

(defvar *the-number*
  (with-open-file (stream "./src/res/p8.txt")
    (read stream)))

(defun product-of-first-n (n digits &optional (result 1))
  (if (zerop n)
      result
      (if (null digits)
          -1
          (product-of-first-n (1- n)
                              (cdr digits)
                              (* result (car digits))))))

(defun max-product-of-first-n (n digits &optional (result -1))
  (if (null digits)
      result
      (let* ((current-product (product-of-first-n n digits))
             (result (max result current-product)))
        (max-product-of-first-n n (cdr digits) result))))

(defun solution (&optional (n 13) (the-number *the-number*))
  (max-product-of-first-n n (euler/utils:integer-to-list the-number)))
