;;;; https://projecteuler.net/problem=22
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p22
  (:use :cl)
  (:export #:solution))
(in-package :euler/p22)

(defvar *char-code-A* (char-code #\A))

(defparameter *names*
  (with-open-file (stream "./src/res/p22.txt")
    (cl-ppcre:split ","
                    (cl-ppcre:regex-replace-all "\""
                                                (read-line stream nil)
                                                ""))))

(defun name-to-alphabetical-value (name)
  (reduce #'+
          (map 'list
               (lambda (c)
                 (1+ (- (char-code c) *char-code-A*)))
               name)))

(defun process-names (names &optional (result 0) (n 1))
  (if (null names)
      result
      (let* ((name (first names))
             (names (rest names))
             (name-value (* (name-to-alphabetical-value name) n))
             (result (+ result name-value)))
        (process-names names result (1+ n)))))

(defun solution (&optional (names *names*))
  (process-names (sort names #'string-lessp)))
