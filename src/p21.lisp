;;;; https://projecteuler.net/problem=21
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p21
  (:use :cl)
  (:export #:solution))
(in-package :euler/p21)


(defun sum-divisors (n)
  (if (= n 1)
      1
      (do* ((d (1+ (floor (/ n 2))) (1- d))
            (result 0 (+ result (if (zerop (mod n d)) d 0))))
           (nil)
        (when (= d 1)
          (return result)))))

(defun find-amicable (n &optional (known-amicables nil))
  (if (and known-amicables (gethash n known-amicables))
      (values (gethash n known-amicables) t)
      (let ((dn (sum-divisors n)))
        (if (and (not (= n dn))
                 (= n (sum-divisors dn)))
            (values dn t)
            (values nil nil)))))

(defun find-amicables (limit)
  (do ((result (make-hash-table))
       (n 1 (1+ n)))
      (nil)
    (when (> n limit)
      (return (alexandria:hash-table-keys result)))
    (multiple-value-bind (m existsp) (find-amicable n result)
      (when existsp
        (setf (gethash n result) m
              (gethash m result) n)))))

(defun solution (&optional (n 10000))
  (reduce #'+ (find-amicables n)))
