;;;; https://projecteuler.net/problem=33
;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/p33
  (:use :cl)
  (:export #:solution))
(in-package :euler/p33)


(defun curiousp (n d x)
  (if (= n d)
      nil
      (let ((nn (+ (* n 10) x))
            (dd (+ (* x 10) d)))
        (= (/ n d) (/ nn dd)))))

(defun solution ()
  (let ((result 1))
    (do ((digit 1 (1+ digit)))
        ((> digit 9) (denominator result))
      (do ((n 1 (1+ n)))
          ((> n 9) nil)
        (do ((d 1 (1+ d)))
            ((> d 9) nil)
          (when (curiousp n d digit)
            (setf result
                  (* result (/ n d)))))))))
