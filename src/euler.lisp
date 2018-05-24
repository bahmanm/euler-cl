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
  (format t "  ~20a ~a~%" "Problem #4:" (euler/p4:solution))
  (format t "  ~20a ~a~%" "Problem #5:" (euler/p5:solution))
  (format t "  ~20a ~a~%" "Problem #6:" (euler/p6:solution))
  (format t "  ~20a ~a~%" "Problem #7:" (euler/p7:solution))
  (format t "  ~20a ~a~%" "Problem #8:" (euler/p8:solution))
  (format t "  ~20a ~a~%" "Problem #9:" (euler/p9:solution))
  (format t "  ~20a ~a~%" "Problem #10:" (euler/p10:solution)))
