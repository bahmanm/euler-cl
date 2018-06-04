;;;; https://projecteuler.net/problem=23
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p23
  (:use :cl)
  (:export #:solution))
(in-package :euler/p23)


(defun abundantp (n)
  (< n (- (euler/utils::sum-of-divisors n) n)))

(defun find-abundants (limit)
  (do* ((n 1 (1+ n))
        (n-abundant-p (abundantp n) (abundantp n))
        (result (make-array 1 :element-type 'integer
                            :adjustable t :fill-pointer 0)))
       ((> n limit) result)
    (when n-abundant-p
      (vector-push-extend n result))))

(defun sum-of-two-elements-p (n elements elements-hashtbl)
  (if (zerop (length elements))
      nil
      (do* ((elements-length (1- (length elements)))
            (i 0 (1+ i))
            (a (elt elements i) (elt elements i))
            (b (- n a) (- n a))
            (foundp (gethash b elements-hashtbl) (gethash b elements-hashtbl)))
           ((or foundp (= i elements-length)) foundp))))



(defun solution (&optional (limit 28123))
  (do* ((abundants (find-abundants limit))
        (abudants-hashtbl (euler/utils:vector-to-hash-table abundants))
        (n 1 (1+ n))
        (result 1
                (+ result
                   (if (sum-of-two-elements-p n abundants abudants-hashtbl) 0 n))))
       ((= n limit) result)))
