;;;; https://projecteuler.net/problem=14
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p14
  (:use :cl)
  (:export #:solution))
(in-package :euler/p14)


(defun count-chain-terms (n &optional (cache (make-hash-table)))
  (do* ((m n
           (if (evenp m)
               (/ m 2)
               (+ (* 3 m) 1)))
        (cached (gethash m cache)
                (gethash m cache))
        (result (or cached 1)
                (+ result (or cached 1))))
       ((or cached (= m 1)) (setf (gethash n cache)
                                   result))))

(defun solution (&optional (n 1000001))
  (let ((max-terms-count 0)
        (max-terms-number 0)
        (cache (make-hash-table)))
    (do* ((i 1 (1+ i))
          (current-terms-count (count-chain-terms i cache)
                               (count-chain-terms i cache)))
         ((> i n))
      (when (> current-terms-count max-terms-count)
        (setf max-terms-count current-terms-count)
        (setf max-terms-number i)))
    max-terms-number))
