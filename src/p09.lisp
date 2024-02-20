;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
;;;; The implementation is just a translation of the algorithm described
;;;; in https://www.mathblog.dk/pythagorean-triplets/
;;;;
(defpackage euler/p09
  (:use :cl)
  (:export #:solution))
(in-package :euler/p09)


(defun find-k (m s k)
  (if (or (>= k (* m 2)) (> k (/ s (* m 2))))
      -1
      (if (and (zerop (mod (/ s (* m 2)) k)) (= (gcd k m) 1))
          k
          (find-k m s (+ k 2)))))

(defun find-mk (m mlimit s)
  (if (> m mlimit)
      nil
      (if (zerop (mod (/ s 2) m))
          (let* ((startk (if (zerop (mod m 2)) (+ m 1) (+ m 2)))
                 (k (find-k m s startk)))
            (if (= k -1)
                (find-mk (1+ m) mlimit s)
                (list m k)))
          (find-mk (1+ m) mlimit s))))

(defun compute-abc (s m k)
  (let* ((d (/ (/ s 2) (* k m)))
         (n (- k m))
         (a (* d (- (* m m) (* n n))))
         (b (* 2 d n m))
         (c (* d (+ (* m m) (* n n)))))
    (list a b c)))

(defun solution (&optional (s 1000))
  (let* ((mlimit (sqrt (/ s 2)))
         (mk (find-mk 2 mlimit s))
         (result (if mk (compute-abc s (car mk) (car (cdr mk))) nil)))
    (reduce #'* result :initial-value 1)))
