;;;; https://projecteuler.net/problem=11
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p11
  (:use :cl)
  (:export #:solution))
(in-package :euler/p11)


(defun read-matrix (path)
  (labels ((string-to-list (s)
             (list (map 'list #'parse-integer (cl-ppcre:split #\Space s))))
           (reader (stream result)
             (let ((line (read-line stream nil)))
               (if (null line)
                   result
                   (reader stream (append result (string-to-list line)))))))
    (with-open-file (s path)
      (reader s nil))))

(defun n-elements-horizontal (a n &key row col)
  (labels ((collect (result n)
             (if (< n 0)
                 result
                 (collect (cons (aref a row (+ col n)) result) (1- n)))))
    (if (or (zerop n) (> (+ col n) (array-dimension a 1)))
        nil
        (collect nil (1- n)))))

(defun n-elements-vertical (a n &key row col)
  (labels ((collect (result n)
             (if (< n 0)
                 result
                 (collect (cons (aref a (+ row n) col) result) (1- n)))))
    (if (or (zerop n) (> (+ row n) (array-dimension a 0)))
        nil
        (collect nil (1- n)))))

(defun n-elements-diagonal-down (a n &key row col)
  (labels ((collect (result n)
             (if (< n 0)
                 result
                 (collect (cons (aref a (+ row n) (+ col n)) result) (1- n)))))
    (if (or (zerop n)
            (> (+ row n) (array-dimension a 0))
            (> (+ col n) (array-dimension a 1)))
        nil
        (collect nil (1- n)))))

(defun n-elements-diagonal-up (a n &key row col)
  (labels ((collect (result n)
             (if (< n 0)
                 result
                 (collect (cons (aref a (- row n) (+ col n)) result) (1- n)))))
    (if (or (zerop n)
            (< (+ row (- n) 1) 0)
            (> (+ col n) (array-dimension a 1)))
        nil
        (collect nil (1- n)))))

(defun n-elements (a n &key row col)
  (list (n-elements-horizontal a n :row row :col col)
        (n-elements-vertical a n :row row :col col)
        (n-elements-diagonal-up a n :row row :col col)
        (n-elements-diagonal-down a n :row row :col col)))

(defun n-max-product-elements (a n)
  (let ((row-limit (array-dimension a 0))
        (col-limit (array-dimension a 1))
        (to-product (lambda (ll) (reduce #'* ll))))
    (labels ((n-max-product-elements (row col result)
               (cond
                 ((= row row-limit)
                  result)
                 ((= col col-limit)
                  (n-max-product-elements (1+ row) 0 result))
                 ((let* ((elements (n-elements a n :row row :col col))
                         (elements (cons result elements))
                         (elements (remove nil elements))
                         (result (euler/utils:mapmax to-product elements)))
                    (n-max-product-elements row (1+ col) result))))))
      (n-max-product-elements 0 0 nil))))

(defun solution (&optional (path "./src/res/p11.txt") (n 4))
  (let* ((matrix-as-list (read-matrix path))
         (nrows (length matrix-as-list))
         (ncols (length (car matrix-as-list)))
         (matrix (make-array (list nrows ncols) :initial-contents matrix-as-list)))
    (reduce #'* (n-max-product-elements matrix n))))
