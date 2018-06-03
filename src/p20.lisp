;;;; https://projecteuler.net/problem=20
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p20
  (:use :cl)
  (:export #:solution))
(in-package :euler/p20)


(defun factorial (n)
  (if (= n 1) 1
      (do ((n n (1- n))
           (result 1 (* result n)))
          (nil)
        (when (= n 1)
          (return result)))))

(defun solution (&optional (n 100))
  (reduce #'+ (euler/utils:integer-to-list (factorial n))))
