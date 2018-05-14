;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage :euler
  (:use :cl)
  (:export #:solutions))
(in-package :euler)

(defun solutions ()
  (format t "~%Solutions to select problems from Euler project.~%~%")
  (format t "  ~20a ~a~%" "Problem #1:" (euler/p1:solution))
  (format t "  ~20a ~a~%" "Problem #2:" (euler/p2:solution))
  (format t "  ~20a ~a~%" "Problem #3:" (euler/p3:solution))
  (format t "  ~20a ~a~%" "Problem #4:" (euler/p4:solution)))
