;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage :euler
  (:use :cl)
  (:export #:solutions))
(in-package :euler)

(defvar *problems-solved*
  '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 25 26 27 28 29 30 31 32 33 34 35 36 37 38))

(defun print-header ()
  (format t "~%~%")
  (format t " ┏~v@{~A~:*~}~*┓ ~%"
          70 "━")
  (format t " ┃~70:@<~A~>~A~%" "PROJECT EULER ANSWERS" "┃")
  (format t " ┣~v@{~A~:*~}~*┳~v@{~A~:*~}~*┳~v@{~A~:*~}~*┫ ~%"
          12 "━" 34 "━" 22 "━")
  (format t " ┃ ~10:@<~A~> ┃ ~32:@<~A~> ┃ ~20:@<~A~> ┃ ~%"
          "PROBLEM #" "ANSWER" "TIME (µs)")
  (format t " ┣~v@{~A~:*~}~*╇~v@{~A~:*~}~*╇~v@{~A~:*~}~*┫ ~%"
          12 "━" 34 "━" 22 "━"))

(defun print-answer-line (n answer time)
  (cond
    ((typep answer 'number)
     (format t " ┃ ~10D │ ~32:D │ ~20:D ┃ ~%" n answer time))
    ((typep answer 'string)
     (format t " ┃ ~10D │ ~32S │ ~20:D ┃ ~%" n answer time))
    ((format t " ┃ ~10D │ ~32A │ ~20:D ┃ ~%" n answer time))))

(defun print-separator-line ()
  (format t " ┠~v@{~A~:*~}~*┼~v@{~A~:*~}~*┼~v@{~A~:*~}~*┨ ~%"
          12 "─" 34 "─" 22 "─"))

(defun print-last-line ()
  (format t " ┗~v@{~A~:*~}~*┷~v@{~A~:*~}~*┷~v@{~A~:*~}~*┛~%"
          12 "━" 34 "━" 22 "━")
  (format t "~%~%"))

(defun run-solution (n)
  (let ((exec-time 0)
        (result nil)
        (pkg (concatenate 'string "euler/p" (format nil "~2,'0d" n))))
    (labels ((timer (&key
                       user-run-time-us
                       system-run-time-us
                       real-time-ms
                       gc-run-time-ms
                       gc-real-time-ms
                       processor-cycles
                       eval-calls
                       lambdas-converted
                       page-faults
                       bytes-consed
                       aborted)
               (declare (ignore system-run-time-us
                                real-time-ms
                                gc-run-time-ms
                                gc-real-time-ms
                                processor-cycles
                                eval-calls
                                lambdas-converted
                                page-faults
                                bytes-consed
                                aborted))
               (setf exec-time user-run-time-us)))
      (setf result
            (funcall (find-symbol "CALL-WITH-TIMING")
                     #'timer
                     (find-symbol "SOLUTION" (string-upcase pkg))))
      (print-answer-line n result exec-time))))

(defun solutions ()
  (print-header)
  (do* ((problems *problems-solved* (rest problems))
        (n (first problems) (first problems)))
       ((null problems))
    (run-solution n)
    (if (rest problems)
        (print-separator-line)
        (print-last-line))))
