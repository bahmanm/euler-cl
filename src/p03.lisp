;;;; https://projecteuler.net/problem=3
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p03
  (:use :cl)
  (:export #:solution))
(in-package :euler/p03)

(defun solution* (n current-factor max-factor)
  (if (> current-factor n)
      max-factor
      (if (zerop (mod n current-factor))
          (solution* (/ n current-factor) current-factor current-factor)
          (solution* n (1+ current-factor) max-factor))))

(defun solution (&optional (n 600851475143))
  (solution* n 2 1))
