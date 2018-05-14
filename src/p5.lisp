;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p5
  (:use :cl :euler/utils)
  (:export #:solution))
(in-package :euler/p5)


(defun prime-factors (n)
  (let ((result (make-hash-table)))
    (labels ((prime-factors (n factor)
               (cond
                 ((and (>= n factor) (zerop (mod n factor)))
                  (setf (gethash factor result)
                        (1+ (gethash factor result 0)))
                  (prime-factors (/ n factor) factor))
                 ((and (>= n factor) (not (zerop (mod n factor))))
                  (prime-factors n (1+ factor))))))
    (prime-factors n 2)
    result)))

(defun lcd (n result)
  (if (= n 1)
      result
      (let* ((n-factors (prime-factors n))
             (merger (lambda (v1 v2) (max (or v1 0) (or v2 0))))
             (result (hash-table-merge result n-factors merger)))
        (lcd (1- n) result))))

(defun solution (&optional (limit 20))
  (let ((factors (lcd limit (make-hash-table)))
        (result 1))
    (maphash #'(lambda (f p) (setf result (* result (expt f p)))) factors)
    result))
