;;;; https://projecteuler.net/problem=29
;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/p29
  (:use :cl)
  (:export #:solution))
(in-package :euler/p29)


(defun distinct-combos (from to)
  (do* ((result '())
        (a from (1+ a)))
       ((> a to) result)
    (do* ((b from (1+ b))
          (combo (* a a) (* a combo)))
         ((> b to))
      (unless (member combo result)
        (setf result
              (cons combo result))))))

(defun solution (&optional (low 2) (high 100))
  (length (distinct-combos low high)))
