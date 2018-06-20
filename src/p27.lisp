;;;; https://projecteuler.net/problem=27
;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/p27
  (:use :cl :euler/utils)
  (:export #:solution))
(in-package :euler/p27)


(defun quadratic (a b)
  (lambda (n)
    (+ b (* a n) (* n n))))

(defun count-primes (a b)
  (do* ((quadratic-fn (quadratic a b))
        (n 0
           (1+ n))
        (quadratic-value (funcall quadratic-fn n)
                         (funcall quadratic-fn n)))
       ((not (euler/utils:primep quadratic-value)) n)))

(defun solution (&optional (limit-a 1000) (limit-b 1000))
  (let ((max-ab '())
        (max-primes-count 0))
    (do ((a (if (zerop limit-a) 0 (- (1- limit-a)))
            (1+ a)))
        ((= a limit-a))
      (do* ((b (- limit-b)
               (1+ b))
            (primes-count (count-primes a b)
                          (count-primes a b)))
           ((> b limit-b))
        (when (> primes-count max-primes-count)
          (setf max-primes-count primes-count)
          (setf max-ab (list a b)))))
    (if (null max-ab)
        0
        (reduce #'* max-ab))))
