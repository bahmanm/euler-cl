;;;; https://projecteuler.net/problem=38
;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/p38
  (:use :cl)
  (:export #:solution))
(in-package :euler/p38)

(defun pandigitalp (n)
  (let* ((digits (make-hash-table :size 9)))
    (do* ((x n
             (floor (/ x 10)))
          (digit (mod x 10)
                 (mod x 10))
          (seen-digit-p (gethash digit digits nil)
                        (gethash digit digits nil)))
         (nil)
      (cond
        ((zerop x) (return t))
        ((zerop digit) (return nil))
        (seen-digit-p (return nil))
        (t (setf (gethash digit digits)
                 t))))
    (do* ((i 1 (1+ i)))
         ((= i 10) t)
      (unless (gethash i digits)
        (return nil)))))

(defun solution ()
  nil)
