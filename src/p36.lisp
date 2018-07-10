;;;; https://projecteuler.net/problem=36
;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/p36
  (:use :cl)
  (:export #:solution))
(in-package :euler/p36)


(defun palindromep (s)
  (do* ((left 0
              (1+ left))
        (right (1- (length s))
               (1- right)))
       ((> left right) t)
    (unless (eql (aref s left) (aref s right))
      (return nil))))

(defun solution (&optional (limit 1000000))
  (do* ((n 3 (+ n 2))
        (result 1))
       ((> n limit) result)
    (let ((nb10 (format nil "~D" n))
          (nb2 (format nil "~B" n)))
      (when (and (palindromep nb10)
                 (palindromep nb2))
        (setf result
              (+ result n))))))
