;;;; https://projecteuler.net/problem=2
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p02
  (:use :cl)
  (:export #:solution))
(in-package :euler/p02)

(defun sum-even-terms (term1 term2 term-limit sum)
  (let ((term3 (+ term1 term2)))
    (if (> term3 term-limit)
        sum
        (sum-even-terms term2 term3 term-limit
                   (if (evenp term3) (+ sum term3) sum)))))

(defun solution (&optional (limit 4000000))
  (sum-even-terms 1 2 limit 2))
