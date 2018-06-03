;;;; https://projecteuler.net/problem=19
;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/p19
  (:use :cl)
  (:export #:solution))
(in-package :euler/p19)


(defun leap-year-p (y)
  (if (zerop (mod y 100))
      (zerop (mod y 4))
      (zerop (mod y 4))))

(defun month-length (y m)
  (case m
    (1 31)
    (2 (if (leap-year-p y) 29 28))
    (3 31)
    (4 30)
    (5 31)
    (6 30)
    (7 31)
    (8 31)
    (9 30)
    (10 31)
    (11 30)
    (12 31)))

(defstruct (date)
  (year 1901 :type integer :read-only t)
  (month 1 :type integer :read-only t)
  (weekday 0 :type integer :read-only t))

(defgeneric date-equal (date1 date2))
(defgeneric date-sundayp (date))
(defgeneric date-month-inc (date))

(defmethod date-equal ((d1 date) (d2 date))
  (and
   (equal (date-year d1) (date-year d2))
   (equal (date-month d1) (date-month d2))
   (equal (date-weekday d1) (date-weekday d2))))

(defmethod date-sundayp ((d date))
  (= (date-weekday d) 6))

(defmethod date-month-inc ((d date))
  (let* ((day-count (month-length (date-year d) (date-month d)))
         (weekday (mod (+ day-count (date-weekday d))
                       7))
         (month (if (= (date-month d) 12)
                    1
                    (1+ (date-month d))))
         (year (if (= month 1)
                   (1+ (date-year d))
                   (date-year d))))
    (make-date :year year :month month :weekday weekday)))

(defun count-sundays (&key from-date to-year to-month)
  (do* ((current-date from-date next-date)
        (next-date (date-month-inc current-date) (date-month-inc current-date))
        (count (if (date-sundayp current-date) 1 0)
               (if (date-sundayp current-date)
                   (1+ count)
                   count)))
       (nil)
    (when (or (< to-year (date-year current-date))
              (and (= to-year (date-year current-date))
                   (< to-month (date-month current-date))))
      (return count))))

(defun solution (&optional
                   (from-year 1901) (from-month 1) (from-weekday 1)
                   (to-year 2000) (to-month 12))
  (count-sundays :from-date (make-date :year from-year
                                       :month from-month
                                       :weekday from-weekday)
                 :to-year to-year
                 :to-month to-month))
