;;;; https://projecteuler.net/problem=32
;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/p32
  (:use :cl)
  (:export #:solution))
(in-package :euler/p32)


(defun pandigitalp (&rest numbers)
  (labels ((concat (acc val) (concatenate 'list acc val)))
    (let* ((numbers-as-digits (mapcar #'euler/utils:integer-to-list numbers))
           (all-digits (reduce #'concat numbers-as-digits))
           (digits-sorted (sort all-digits #'<)))
      (equalp '(1 2 3 4 5 6 7 8 9) digits-sorted))))

(defun pandigital-identity-p (n)
  (if (or (zerop (rem n 10)) (euler/utils:primep n))
      nil
      (let ((start (if (evenp n) 2 3))
            (incr (if (evenp n) 1 2))
            (limit (ceiling n 4)))
        (do ((d start (+ d incr)))
            ((> d limit) nil)
             (multiple-value-bind (k r)
                 (floor n d)
               (when (and (zerop r) (pandigitalp d k n))
                 (return t)))))))

(defun solution ()
  (do* ((n 999
           (1+ n))
        (result 0
                (if (pandigital-identity-p n)
                    (+ n result)
                    result)))
       ((> n 9999) result)))
