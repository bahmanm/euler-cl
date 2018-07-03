;;;; https://projecteuler.net/problem=34
;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/p34
  (:use :cl)
  (:export #:solution))
(in-package :euler/p34)


(defvar *fact-cache*
  (do* ((cache (make-array 10 :element-type 'integer))
        (i 0 (1+ i))
        (factorial 1 (* i factorial)))
       ((= i 10) cache)
    (setf (aref cache i)
          factorial)))

(defun sum-of-digit-factorials (n)
  (if (zerop n)
      1
      (do* ((result 0))
           ((= n 0) result)
        (multiple-value-bind (d r)
            (floor n 10)
          (setf result
                (+ result (aref *fact-cache* r)))
          (setf n d)))))

(defun solution ()
  (do* ((n 10
           (1+ n))
        (sum-n (sum-of-digit-factorials n)
               (sum-of-digit-factorials n))
        (result 0
                (if (= n sum-n) (+ result n) result)))
       ((= n 2540161) result)))
