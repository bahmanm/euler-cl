;;;; https://projecteuler.net/problem=38
;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/p38
  (:use :cl)
  (:export #:solution))
(in-package :euler/p38)

(defun pandigitalp (n)
  "Checks if N is 1 to 9 pandigital."
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

(defun number-to-digits (n)
  "Converts N to the list of its digits.
   The most significant digit will be the CAR of the list."
  (do* ((result '())
        (number n
                (floor (/ number 10)))
        (digit (mod number 10)
               (mod number 10)))
       ((zerop number) result)
    (setf result
          (rplacd (list digit) result))))

(defun concat-numbers (&rest numbers)
  "Concatenates a list of integers (NUMBERS) to a single integer.
   It assumes the most significant number is the CAR of NUMBERS."
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

(defun digit-count (n)
  "Count the digits of N.
   N is assumed to be a positive integer."
  (cond
    ((< n 10) 1)
    ((< n 100) 2)
    ((< n 1000) 3)
    ((< n 10000) 4)
    ((< n 100000) 5)
    ((< n 1000000) 6)
    ((< n 10000000) 7)
    ((< n 100000000) 8)
    ((< n 1000000000) 9)
    (t 10)))

(defun products (n)
  "Produces the products of N * M where M >= 1.
  The result is a list whose CAR is N*1."
  (do* ((answer '())
        (i 1 (1+ i))
        (p (* n i)
           (* n i))
        (digit-count-so-far (digit-count p)
                            (+ digit-count-so-far (digit-count p))))
       ((< 9 digit-count-so-far) answer)
    (setf answer (concatenate 'list answer (list p)))))

(defun solution ()
  (do ((answer 0)
       (x 1 (1+ x)))
      ((= x 100000) answer)
    (let* ((products (products x))
           (products-number (apply #'concat-numbers products)))
      (when (and (> products-number answer)
               (pandigitalp products-number))
          (setf answer products-number)))))
