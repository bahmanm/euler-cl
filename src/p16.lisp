;;;; https://projecteuler.net/problem=16
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p16
  (:use :cl)
  (:export #:solution))
(in-package :euler/p16)

(defun solution (&optional (base 2) (power 1000))
  (reduce #'+ (euler/utils:integer-to-list (expt base power))))
