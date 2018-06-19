;;;; https://projecteuler.net/problem=26
;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/p26
  (:use :cl)
  (:export #:solution))
(in-package :euler/p26)


(defun shortest-cycle (a)
  (let ((end (length a)))
    (labels ((shortest-cycle (start)
               (if (>= start (1- end))
                  #()
                  (let ((mid (+ start (floor (/ (- end start) 2)))))
                    (if (<= mid start)
                        #()
                        (let ((left (subseq a start mid))
                              (right (subseq a mid end)))
                          (if (not (equalp left right))
                              (shortest-cycle mid)
                              (let ((shorter-cycle (shortest-cycle mid)))
                                (if (equalp shorter-cycle #())
                                    right
                                    shorter-cycle)))))))))
      (cond
        ((< (length a) 2) #())
        ((oddp end) (shortest-cycle 1))
        ((shortest-cycle 0))))))

(defun unit-fraction-decimal (n)
  (do* ((result (make-array 0
                            :element-type 'integer
                            :adjustable t
                            :fill-pointer 0))
        (dividend 10 (* remainder 10))
        (quotient (floor (/ dividend n)) (floor (/ dividend n)))
        (remainder (rem dividend n) (rem dividend n))
        (i 1 (1+ i)))
       (nil)
    (vector-push-extend quotient result)
    (when (or (= i (* 2 (1- n))) (zerop remainder))
      (return result))))

(defun solution (&optional (n 1000))
  (do* ((i 2 (1+ i))
        (d (unit-fraction-decimal i)
           (unit-fraction-decimal i))
        (cycle (shortest-cycle d)
               (shortest-cycle d))
        (cycle-length (length cycle)
                      (length cycle))
        (max-cycle '(0 2)
                   (if (>= cycle-length (first max-cycle))
                       (list cycle-length i)
                       max-cycle)))
       ((> i (1- n)) (second max-cycle))))
