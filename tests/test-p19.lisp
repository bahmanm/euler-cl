;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p19
  (:use :cl :it.bese.fiveam
        :euler/p19)
  (:export #:p19-test-suite))
(in-package :euler/tests/p19)

(def-suite
    p19-test-suite
    :description "Problem 19 test suite.")
(in-suite p19-test-suite)


(test leap-year-p
  (is-false (euler/p19::leap-year-p 1901))
  (is-false (euler/p19::leap-year-p 1902))
  (is-false (euler/p19::leap-year-p 1903))
  (is-true (euler/p19::leap-year-p 1904))
  (is-false (euler/p19::leap-year-p 1905))
  (is-true (euler/p19::leap-year-p 1908))
  (is-true (euler/p19::leap-year-p 2000)))

(test date-sundayp
  (is-false (euler/p19::date-sundayp
             (euler/p19::make-date :year 1910 :month 1 :weekday 0)))
  (is-false (euler/p19::date-sundayp
             (euler/p19::make-date :year 1910 :month 2 :weekday 0)))
  (is-false (euler/p19::date-sundayp
             (euler/p19::make-date :year 1911 :month 1 :weekday 0)))
  (is-true (euler/p19::date-sundayp
            (euler/p19::make-date :year 1910 :month 1 :weekday 6)))
  (is-true (euler/p19::date-sundayp
            (euler/p19::make-date :year 1910 :month 1 :weekday 6))))

(test month-length-leap-year
  (let ((y 2000))
    (is (= 31 (euler/p19::month-length y 1)))
    (is (= 29 (euler/p19::month-length y 2)))
    (is (= 31 (euler/p19::month-length y 3)))
    (is (= 30 (euler/p19::month-length y 4)))
    (is (= 31 (euler/p19::month-length y 5)))
    (is (= 30 (euler/p19::month-length y 6)))
    (is (= 31 (euler/p19::month-length y 7)))
    (is (= 31 (euler/p19::month-length y 8)))
    (is (= 30 (euler/p19::month-length y 9)))
    (is (= 31 (euler/p19::month-length y 10)))
    (is (= 30 (euler/p19::month-length y 11)))
    (is (= 31 (euler/p19::month-length y 12)))))

(test month-length-non-leap-year
  (let ((y 1901))
    (is (= 31 (euler/p19::month-length y 1)))
    (is (= 28 (euler/p19::month-length y 2)))
    (is (= 31 (euler/p19::month-length y 3)))
    (is (= 30 (euler/p19::month-length y 4)))
    (is (= 31 (euler/p19::month-length y 5)))
    (is (= 30 (euler/p19::month-length y 6)))
    (is (= 31 (euler/p19::month-length y 7)))
    (is (= 31 (euler/p19::month-length y 8)))
    (is (= 30 (euler/p19::month-length y 9)))
    (is (= 31 (euler/p19::month-length y 10)))
    (is (= 30 (euler/p19::month-length y 11)))
    (is (= 31 (euler/p19::month-length y 12)))))

(test date-equal
  (is-true
   (euler/p19::date-equal
    (euler/p19::make-date :year 1901 :month 1 :weekday 0)
    (euler/p19::make-date :year 1901 :month 1 :weekday 0)))
                                        ;
  (is-true
   (euler/p19::date-equal
    (euler/p19::make-date :year 1931 :month 4 :weekday 3)
    (euler/p19::make-date :year 1931 :month 4 :weekday 3)))
                                        ;
  (is-false
   (euler/p19::date-equal
    (euler/p19::make-date :year 1901 :month 1 :weekday 0)
    (euler/p19::make-date :year 1901 :month 2 :weekday 0)))
                                        ;
  (is-false
   (euler/p19::date-equal
    (euler/p19::make-date :year 1901 :month 1 :weekday 0)
    (euler/p19::make-date :year 1901 :month 1 :weekday 1)))
                                        ;
  (is-false
   (euler/p19::date-equal
    (euler/p19::make-date :year 1902 :month 1 :weekday 0)
    (euler/p19::make-date :year 1901 :month 1 :weekday 0))))


(test date-month-inc
  (is (euler/p19::date-equal
       (euler/p19::date-month-inc
        (euler/p19::make-date :year 1901 :month 1 :weekday 0))
       (euler/p19::make-date :year 1901 :month 2 :weekday 3)))
                                        ;
  (is (euler/p19::date-equal
       (euler/p19::date-month-inc
        (euler/p19::make-date :year 1901 :month 2 :weekday 3))
       (euler/p19::make-date :year 1901 :month 3 :weekday 3)))
                                        ;
  (is (euler/p19::date-equal
       (euler/p19::date-month-inc
        (euler/p19::make-date :year 1901 :month 3 :weekday 3))
       (euler/p19::make-date :year 1901 :month 4 :weekday 6)))
                                        ;
  (is (euler/p19::date-equal
       (euler/p19::date-month-inc
        (euler/p19::make-date :year 1901 :month 12 :weekday 2))
       (euler/p19::make-date :year 1902 :month 1 :weekday 5)))
                                        ;
  (is (euler/p19::date-equal
       (euler/p19::date-month-inc
        (euler/p19::make-date :year 1903 :month 12 :weekday 6))
       (euler/p19::make-date :year 1904 :month 1 :weekday 2))))

(test count-sundays
  (is (= 1 (euler/p19::count-sundays
            :from-date (euler/p19::make-date :year 1901 :month 3 :weekday 3)
            :to-year 1901 :to-month 4)))
                                        ;
  (is (= 1 (euler/p19::count-sundays
            :from-date (euler/p19::make-date :year 1901 :month 3 :weekday 3)
            :to-year 1901 :to-month 5)))
                                        ;
  (is (= 0 (euler/p19::count-sundays
            :from-date (euler/p19::make-date :year 1901 :month 1 :weekday 1)
            :to-year 1901 :to-month 3))))

(test solution
  (is (= 1 (euler/p19:solution 1901 3 3 1901 4)))
  (is (= 1 (euler/p19:solution 1901 3 3 1901 5)))
  (is (= 0 (euler/p19:solution 1901 1 1 1901 3))))
