;;;; https://projecteuler.net/problem=35
;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/p35
  (:use :cl)
  (:export #:solution))
(in-package :euler/p35)


(defun array-rotate-and-convert-to-integer (a r)
  (let ((n-digits (length a)))
    (if (= 1 n-digits)
        (aref a 0)
        (do* ((limit (1- n-digits))
              (r (rem r n-digits))
              (counter limit
                       (1- counter))
              (power-of-10 (expt 10 counter)
                           (/ power-of-10 10))
              (raw-index (+ r (- limit counter))
                         (+ r (- limit counter)))
              (index (rem raw-index n-digits)
                     (rem raw-index n-digits))
              (digit (aref a index)
                     (aref a index))
              (result (* digit power-of-10)
                      (+ result (* digit power-of-10))))
             ((= counter 0) result)))))

(defun integer-to-list (n)
  (do* ((digit-count (1+ (floor (log n 10))))
        (result (make-array digit-count :element-type 'integer))
        (i (1- digit-count)
           (1- i))
        (n n))
       ((< i 0) result)
    (multiple-value-bind (d r)
        (floor n 10)
      (setf (aref result i)
            r)
      (setf n d))))

(defun circular-prime-p (n)
  (do* ((digits (integer-to-list n))
        (digit-count (length digits))
        (i 0 (1+ i))
        (n n
           (array-rotate-and-convert-to-integer digits i))
        (primep (euler/utils:primep n)
                (euler/utils:primep n)))
       ((or (not primep) (= i (1- digit-count))) primep)))

(defun solution (&optional (limit 1000000))
  (do* ((i 2
           (1+ i))
        (count 1
               (+ count (if (circular-prime-p i) 1 0))))
       ((= i limit) count)))
