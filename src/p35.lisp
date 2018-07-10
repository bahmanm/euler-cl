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

(defun circular-prime-p (n)
  (if (= n 2)
      t
      (do* ((digits (euler/utils:integer-to-array n))
            (digit-count (length digits))
            (i 0
               (1+ i))
            (n n
               (array-rotate-and-convert-to-integer digits i))
            (primep (and (every #'oddp digits) (euler/utils:primep n))
                    (euler/utils:primep n)))
           ((or (not primep) (= i (1- digit-count))) primep))))

(defun solution (&optional (limit 1000000))
  (if (= limit 2)
      1
      (do* ((i 3
               (+ i 2))
            (count 1))
           ((> i limit) count)
        (when (circular-prime-p i)
          (setf count
                (+ count 1))))))
