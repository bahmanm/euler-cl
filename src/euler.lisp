;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage :euler
  (:use :cl)
  (:export #:solutions))
(in-package :euler)

(defvar *problems-solved*
  '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18))

(defun print-header ()
  (format t " ┏~v@{~A~:*~}~*┓ ~%"
          70 "━")
  (format t " ┃~70:@<~A~>~A~%" "PROJECT EULER PROBLEMS AND ANSWERS" "┃")
  (format t " ┣~v@{~A~:*~}~*┳~v@{~A~:*~}~*┳~v@{~A~:*~}~*┫ ~%"
          12 "━" 34 "━" 22 "━")
  (format t " ┃ ~10a ┃ ~32a ┃ ~20a ┃ ~%" "PROBLEM #" "ANSWER" "TIME (µs)")
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
  (format t " ┣~v@{~A~:*~}~*┼~v@{~A~:*~}~*┼~v@{~A~:*~}~*┨ ~%"
          12 "─" 34 "─" 22 "─"))

(defun print-last-line ()
  (format t " ┗~v@{~A~:*~}~*┷~v@{~A~:*~}~*┷~v@{~A~:*~}~*┛ ~% █~%~%"
          12 "━" 34 "━" 22 "━"))

(defmacro run-solution (n)
  (declare (ignore n))
  (let ((exec-time-name (gensym))
        (result-name (gensym))
        (timer-name (gensym))
        (pkg-name (gensym)))
    `(let ((,exec-time-name 0)
           (,result-name nil)
           (,pkg-name (concatenate 'string "euler/p" (format nil "~A" ,n))))
       (labels ((,timer-name (&key real-time-ms user-run-time-us system-run-time-us
                                   gc-run-time-ms processor-cycles eval-calls
                                   lambdas-converted page-faults bytes-consed aborted)
                  (declare (ignore real-time-ms system-run-time-us gc-run-time-ms
                                   processor-cycles eval-calls lambdas-converted
                                   page-faults bytes-consed aborted))
                  (setf ,exec-time-name user-run-time-us)))
         (setf ,result-name (funcall (find-symbol "CALL-WITH-TIMING")
                                     #',timer-name
                                     (find-symbol "SOLUTION" (string-upcase ,pkg-name)))))
       (print-answer-line ,n ,result-name ,exec-time-name))))

(defun solutions ()
  (print-header)
  (do* ((problems *problems-solved* (rest problems))
        (n (first problems) (first problems)))
       ((null problems))
    (run-solution n)
    (if (rest problems)
        (print-separator-line)
        (print-last-line))))
