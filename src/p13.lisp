;;;; https://projecteuler.net/problem=13
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p13
  (:use :cl)
  (:export #:solution))
(in-package :euler/p13)

(defvar *the-numbers*
  (map 'list
       #'parse-integer
       (with-open-file (stream "./src/res/p13.txt")
         (labels ((read-lines (result)
                    (let ((line (read-line stream nil)))
                      (if line
                          (read-lines (cons line result))
                          result))))
           (read-lines nil)))))

(defun solution (&optional (numbers *the-numbers*) (n-digits 10))
  (let* ((sum (reduce #'+ numbers))
         (sum-digits (euler/utils:integer-to-list sum)))
    (reduce (lambda (acc n) (format nil "~A~A" acc n))
            (subseq sum-digits 0 n-digits)
            :initial-value "")))
