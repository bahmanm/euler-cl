;;;; https://projecteuler.net/problem=1
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p01
  (:use :cl)
  (:export #:solution))
(in-package :euler/p01)


(defun multiple-of-3-or-5p (n)
  (or (zerop (mod n 3)) (zerop (mod n 5))))

(defun solution* (current sum)
  (if (> current 0)
      (if (multiple-of-3-or-5p current)
          (solution* (1- current) (+ sum current))
          (solution* (1- current) sum))
      sum))

(defun solution (&optional (n 1000))
  (solution* (1- n) 0))
