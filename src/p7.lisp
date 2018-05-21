;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p7
  (:use :cl)
  (:export #:solution))
(in-package :euler/p7)


(defun primep (n)
  (cond
    ((member n '(2 3 5 7)) t)
    ((zerop (mod n 2)) nil)
    ((zerop (mod n 3)) nil)
    ((let ((max-factor (ffloor (sqrt n))))
       (labels ((primep (current-factor)
                  (cond
                    ((> current-factor max-factor) t)
                    ((zerop (mod n current-factor)) nil)
                    ((zerop (mod n (+ current-factor 2))) nil)
                    ((primep (+ current-factor 6))))))
         (primep 5))))))

(defun nth-prime (n)
  (cond
    ((= n 1) 2)
    ((= n 2) 3)
    ((= n 3) 5)
    ((= n 4) 7)
    ((labels ((nth-prime (remainder current-number)
                (if (primep current-number)
                    (if (= remainder 1)
                        current-number
                        (nth-prime (1- remainder) (+ current-number 2)))
                    (nth-prime remainder (+ current-number 2)))))
       (nth-prime n 1)))))

(defun solution (&optional (n 10001))
  (nth-prime n))
