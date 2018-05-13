;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage :euler
  (:use :cl :euler/p1)
  (:export #:solutions))
(in-package :euler)

(defun solutions ()
  (format t "~%Solutions to select problems from Euler project.~%~%")
  (format t "  ~20a ~a~%" "Problem #1:" (euler/p1:solution)))
