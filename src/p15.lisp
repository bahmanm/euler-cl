;;;; https://projecteuler.net/problem=15
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p15
  (:use :cl)
  (:export #:solution))
(in-package :euler/p15)


(defun factorial (n &optional (result 1))
  (if (= n 1)
      result
      (factorial (1- n) (* n result))))

(defun solution (&optional (grid-size 20))
  (let ((n (factorial (* grid-size 2)))
        (d (expt (factorial grid-size) 2)))
    (/ n d)))
