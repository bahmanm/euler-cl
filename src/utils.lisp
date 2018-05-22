;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/utils
  (:use :cl)
  (:export #:hash-table-merge #:string-to-list #:string-to-integer-list))
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
