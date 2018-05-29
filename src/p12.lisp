;;;; https://projecteuler.net/problem=12
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
;;;; The implementation is just a translation of the algorithm described
;;;; in http://code.jasonbhill.com/sage/project-euler-problem-12/
;;;;
(defpackage euler/p12
  (:use :cl)
  (:export #:solution))
(in-package :euler/p12)


(defun count-divisors (n &optional (discard-first-divison-by-2 t))
  (let* ((n n)
         (total-count 1)
         (current-divisor 2)
         (current-divisor-power 0))
    (when (and (zerop (mod n 2)) discard-first-divison-by-2)
      (setf n (/ n 2)))
    (do () (nil)
      (if (< n current-divisor)
          (progn
            (if (zerop current-divisor-power)
              (return total-count)
              (return (* total-count (1+ current-divisor-power)))))
          (if (zerop (mod n current-divisor))
              (progn
                (setf n (/ n current-divisor))
                (setf current-divisor-power (1+ current-divisor-power)))
              (progn
                (setf total-count (* total-count (1+ current-divisor-power)))
                (setf current-divisor (1+ current-divisor))
                (setf current-divisor-power 0)))))))

(defun solution (&optional (n 500))
  (do* ((i 1 (1+ i))
        (m 1 k)
        (k 2 (count-divisors (1+ i))))
       (nil)
    (when (< n (* k m))
      (return (/ (* i (1+ i)) 2)))))
