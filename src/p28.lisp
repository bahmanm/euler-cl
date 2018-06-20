;;;; https://projecteuler.net/problem=28
;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/p28
  (:use :cl)
  (:export #:solution))
(in-package :euler/p28)


(defun solution1 (limit n &optional sum-and-max)
  (if (> n limit)
      sum-and-max
      (if (= n 1)
          (solution1 limit 3 '(1 1))
          (let* ((last-sum (first sum-and-max))
                 (last-max (second sum-and-max))
                 (bottom-right (+ last-max n -1))
                 (bottom-left (+ bottom-right n -1))
                 (top-left (+ bottom-left n -1))
                 (top-right (+ top-left n -1))
                 (sum (+ last-sum bottom-right bottom-left top-left top-right)))
            (solution1 limit (+ n 2) (list sum top-right))))))

(defun solution (&optional (n 1001))
  (first (solution1 n 1)))
