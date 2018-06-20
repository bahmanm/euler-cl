;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/utils
  (:use :cl)
  (:export #:hash-table-merge #:string-to-list #:string-to-integer-list
           #:integer-to-list #:primep #:mapmax #:sum-of-divisors
           #:vector-to-hash-table #:hash-table-equal-p))
(in-package :euler/utils)

;;; Returns a new hashtable containing keys from `ht1 and `ht2` along with
;;; respective values. If a key exists in both, `merge-func` will be called
;;; with `ht1` value as first arg and `ht2` as the second arg.
;;;
(defun hash-table-merge (ht1 ht2 merge-func)
  (let* ((result (make-hash-table))
         (map-func #'(lambda (k v)
                       (setf (gethash k result)
                             (funcall merge-func (gethash k result) v)))))
    (maphash map-func ht1)
    (maphash map-func ht2)
    result))

;;; Converts S to a list of strings where each element (which is a string)
;;; represents a character of S.
;;;
(defun string-to-list (s)
  (map 'list #'string s))


;;; Converts S to a list of integers where each character is parsed into
;;; its integer value.
;;; Example: (STRING-TO-INTEGER-LIST "123") -> (1 2 3)
(defun string-to-integer-list (s)
  (mapcar #'parse-integer (string-to-list s)))

;;; Converts a given number to a list of digits preserving the order.
;;; Example: (INTEGER-TO-LIST 123) -> (1 2 3)
;;;
(defun integer-to-list (n)
  (if (zerop n) '(0)
      (labels ((number-to-list (n result)
                 (if (zerop n)
                     result
                     (multiple-value-bind (divisor remainder)
                         (floor n 10)
                       (number-to-list divisor (cons remainder result))))))
        (number-to-list n '()))))

;;; Determines whether a natural number is prime.
;;; Example: (PRIMEP 7) -> T  ; (PRIMEP 24) -> NIL
;;;
(defun primep (n)
  (cond
    ((< n 2) nil)
    ((member n '(2 3 5)) t)
    ((zerop (mod n 2)) nil)
    ((zerop (mod n 3)) nil)
    ((let ((max-factor (ffloor (sqrt n))))
       (labels ((primep (current-factor)
                  (cond
                    ((> current-factor max-factor) t)
                    ((zerop (mod n current-factor)) nil)
                    ((zerop (mod n (+ current-factor 2))) nil)
                    ((primep (+ current-factor 6))))))
         (primep 5))))))

;;; Maps all the elements of LL using MAP-FUNC and finds the maximum mapped
;;; element using COMPARE-FUNC. Returns only the original element.
;;; Example: (MAPMAX (LAMBDA (X) (* X X X)) '(-6 1 2)) -> 2
;;;          (MAPMAX (LAMBDA (X) (* X X X)) '(-6 1 2) #'<) -> -6
;;;
(defun mapmax (map-func ll &optional (compare-func #'>))
  (labels ((map-func* (x) (list (funcall map-func x) x))
           (maxcar (x y) (if (funcall compare-func (car x) (car y)) x y)))
    (let ((ll (mapcar #'map-func* ll)))
      (car (cdr (reduce #'maxcar ll))))))

;;; Computes the sum of the all the divisors of N.
;;; Example: (SUM-OF-DIVISORS 10) -> 8 = 1+2+5
;;;          (SUM-OF-DIVISORS 14) -> 10 = 1+2+7
(defun sum-of-divisors (n)
  (labels ((div (n d) (floor (/ n d))))
    (let ((sum 1)
          (n n))
      (do ((p 2 (if (= p 2) 3 (+ p 2))))
          ((or (< n 1)
               (< n (* p p))))
        (when (zerop (mod n p))
          (do ((j (* p p) (* j p)))
              (nil)
            (setf n (div n p))
            (when (not (zerop (mod n p)))
              (setf sum (div (* sum (1- j))
                             (1- p)))
              (return)))))
      (if (> n 1)
          (* sum (1+ n))
          sum))))

;;; Converts VECTOR into a HASH-TABLE. Each element of VECTOR is a key in
;;; the result associated with T.
;;; Example: (VECTOR-TO-HASH-TABLE #(1 2)) -> HASH-TABLE(1 -> T, 2 -> T)
;;;
(defun vector-to-hash-table (vector)
  (do* ((i-max (length vector))
        (i 0 (1+ i))
        (result (make-hash-table)))
       ((= i i-max) result)
    (setf (gethash (elt vector i) result)
          t)))

;;; HT1 and HT2 are equal if and only if they have the same set of keys
;;; associated with the same set of values.
;;;
(defun hash-table-equal-p (ht1 ht2)
  (if (= (hash-table-count ht1) (hash-table-count ht2))
      (let ((equal-p t))
        (maphash (lambda (k v)
                   (unless (equal v (gethash k ht2))
                     (setf equal-p nil)))
                 ht1)
        equal-p)
      nil))
