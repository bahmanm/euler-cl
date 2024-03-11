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

(defun number-to-digits (number)
  (do* ((result '())
        (number number
                (floor (/ number 10)))
        (digit (mod number 10)
               (mod number 10)))
       ((zerop number) result)
    (setf result
          (rplacd (list digit) result))))

(defun concat-numbers (&rest numbers)
  (let* ((digits '())
         (result 0))
    (do* ((numbers numbers
                   (cdr numbers))
          (number (car numbers)
                  (car numbers)))
         ((null numbers) t)
      (setf digits
            (concatenate 'list
                         digits
                         (number-to-digits number))))
    (do* ((digits digits
                  (cdr digits))
          (digit (car digits)
                 (car digits)))
         ((null digits) t)
      (setf result
            (+ (* result 10) digit)))
    result))

(defun solution ()
  nil)
