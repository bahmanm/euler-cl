;;;; https://projecteuler.net/problem=17
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p17
  (:use :cl)
  (:export #:solution))
(in-package :euler/p17)

(defun number-to-alphabets (n)
  (cl-ppcre:regex-replace-all "[\\s+|-]" (format nil "~R" n) ""))

(defparameter *count-letters-1-99*
  (let* ((numbers-in-alphabet
           (map 'list #'number-to-alphabets (alexandria:iota 99 :start 1)))
         (words-length (map 'list #'length numbers-in-alphabet)))
    (reduce #'+ words-length)))

(defun count-letters-n-hundreds (n)
  (let* ((length-of-n (length (number-to-alphabets (* n 100))))
         (length-of-and (length "and"))
         (prefix-length (+ length-of-n length-of-and)))
    (+ *count-letters-1-99* (* prefix-length 99) length-of-n)))

(defparameter *count-letters-1-999*
  (let* ((hundreds-lengths
           (map 'list #'count-letters-n-hundreds '(1 2 3 4 5 6 7 8 9)))
         (count-letters-100-999 (reduce #'+ hundreds-lengths)))
    (+ *count-letters-1-99* count-letters-100-999)))

(defun solution ()
  (+ *count-letters-1-999*
     (length (number-to-alphabets 1000))))
