;;;; https://projecteuler.net/problem=37
;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/p37
  (:use :cl)
  (:export #:solution))
(in-package :euler/p37)


(defun right-truncatable-prime-p (n)
  (do* ((m (floor n 10)
           (floor m 10))
        (primep (euler/utils:primep m)
                (euler/utils:primep m)))
       ((not primep) (zerop m))))

(defun left-truncatable-prime-p (n)
  (do* ((p10 (expt 10 (floor (log n 10)))
             (floor p10 10))
        (p10-1 (floor p10 10)
               (floor p10 10))
        (m (rem n p10)
           (rem m p10)))
       (nil)
    (cond
      ((< m p10-1) (return nil))
      ((not (euler/utils:primep m)) (return (zerop m)))
      ((= p10 1) t))))

(defun solution ()
  (do* ((i 23
           (+ i 2))
        (result 0)
        (count 0))
       ((= count 11) result)
    (when (and (euler/utils:primep i)
               (right-truncatable-prime-p i)
               (left-truncatable-prime-p i))
      (setf count
            (1+ count))
      (setf result
            (+ result i)))))
