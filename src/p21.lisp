;;;; https://projecteuler.net/problem=21
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p21
  (:use :cl)
  (:export #:solution))
(in-package :euler/p21)


(defun find-amicable (n &optional (known-amicables nil))
  (if (= n 1)
      (values nil nil)
      (if (and known-amicables (gethash n known-amicables))
          (values (gethash n known-amicables) t)
          (let ((dn (- (euler/utils::sum-of-divisors n) n)))
            (if (and (not (= n dn))
                     (= n (- (euler/utils::sum-of-divisors dn) dn)))
                (values dn t)
                (values nil nil))))))

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
