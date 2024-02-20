;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p07
  (:use :cl)
  (:export #:solution))
(in-package :euler/p07)


(defun nth-prime (n)
  (cond
    ((= n 1) 2)
    ((= n 2) 3)
    ((= n 3) 5)
    ((= n 4) 7)
    ((labels ((nth-prime (remainder current-number)
                (if (euler/utils::primep current-number)
                    (if (= remainder 1)
                        current-number
                        (nth-prime (1- remainder) (+ current-number 2)))
                    (nth-prime remainder (+ current-number 2)))))
       (nth-prime (- n 4) 9))))) ; start from next odd number after 7

(defun solution (&optional (n 10001))
  (nth-prime n))
