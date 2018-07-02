;;;; https://projecteuler.net/problem=31
;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
;;;; All credits for the solution go to
;;;; https://www.mathblog.dk/project-euler-31-combinations-english-currency-denominations/
;;;;
(defpackage euler/p31
  (:use :cl)
  (:export #:solution))
(in-package :euler/p31)

(defvar *coins*
  (make-array 7
              :element-type 'integer
              :initial-contents '(200 100 50 20 10 5 2)))

(defun solution (&optional (n 200))
  (let ((ways (make-array (1+ n) :element-type 'integer)))
    (setf (aref ways 0) 1)
    (do ((i 0 (1+ i)))
        ((= i (length *coins*))
         (reduce #'+ ways))
      (do ((j (aref *coins* i) (1+ j)))
          ((> j n) nil)
        (setf (aref ways j)
              (+ (aref ways j)
                 (aref ways (- j (aref *coins* i)))))))))
