;;;; https://projecteuler.net/problem=14
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p14
  (:use :cl)
  (:export #:solution))
(in-package :euler/p14)


(defun count-chain-terms (n)
  (do ((n n (if (evenp n) (/ n 2) (+ (* 3 n) 1)))
       (result 1 (1+ result)))
      (nil)
    (when (= n 1) (return result))))


(defun solution (&optional (n 1000001))
  (let ((max-terms-count 0)
        (max-terms-number 0))
    (do* ((i 1 (1+ i))
          (current-terms-count (count-chain-terms i) (count-chain-terms i)))
         ((> i n))
      (when (> current-terms-count max-terms-count)
        (setf max-terms-count current-terms-count)
        (setf max-terms-number i)))
    max-terms-number))
