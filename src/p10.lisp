;;;; https://projecteuler.net/problem=10
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p10
  (:use :cl)
  (:export #:solution))
(in-package :euler/p10)


(defun solution (&optional (limit 2000000))
  (cond
    ((= limit 2) 2)
    ((< limit 2) 0)
    ((do* ((n 3
              (+ n 2))
           (result 2))
          ((> n limit) result)
       (when (euler/utils:primep n)
         (setf result
               (+ result n)))))))
