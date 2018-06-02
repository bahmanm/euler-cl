;;;; https://projecteuler.net/problem=18
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p18
  (:use :cl)
  (:export #:solution))
(in-package :euler/p18)

(defvar *triangle*
  (with-open-file (stream "./src/res/p18.txt")
    (labels ((process-line (line)
               (map 'list #'parse-integer
                    (cl-ppcre:split "\\s+" line)))
             (read-lines (result)
               (let ((line (read-line stream nil)))
                 (if line
                     (read-lines (nconc result (list (process-line line))))
                     result))))
      (read-lines nil))))

(defun max-of-pairs (ll)
  (labels ((max-of-pairs (ll result)
             (if (null (rest ll))
                 result
                 (let* ((m (max (first ll) (second ll)))
                        (result (append result (list m))))
                   (max-of-pairs (rest ll) result)))))
    (if (or (null ll) (null (rest ll)))
        ll
        (max-of-pairs ll '()))))

(defun sum (list1 list2)
  (map 'list #'+ list1 list2))

(defun reduce-to-max-sum (lists)
  (if (null (rest lists))
      (first (first lists))
      (let* ((maxed-pairs (max-of-pairs (first lists)))
             (summed (sum maxed-pairs (second lists)))
             (lists (cons summed (rest (rest lists)) )))
        (reduce-to-max-sum lists))))

(defun solution (&optional (triangle *triangle*))
  (reduce-to-max-sum (reverse triangle)))
