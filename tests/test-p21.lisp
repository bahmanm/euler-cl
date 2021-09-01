;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p21
  (:use :cl :it.bese.fiveam
        :euler/p21)
  (:export #:p21-test-suite))
(in-package :euler/tests/p21)

(def-suite
    p21-test-suite
    :description "Problem 21 test suite.")
(in-suite p21-test-suite)


(test find-amicable
  (multiple-value-bind (n existsp) (euler/p21::find-amicable 1)
    (is-false existsp)
    (is (equal nil n)))
  (multiple-value-bind (n existsp) (euler/p21::find-amicable 2)
    (is-false existsp)
    (is (equal nil n)))
  (multiple-value-bind (n existsp) (euler/p21::find-amicable 10)
    (is-false existsp)
    (is (equal nil n)))
  (multiple-value-bind (n existsp) (euler/p21::find-amicable 220)
    (is-true existsp)
    (is (= 284 n)))
  (multiple-value-bind (n existsp) (euler/p21::find-amicable 284)
    (is-true existsp)
    (is (= 220 n))))

(test find-amicables
  (is (equal '()
             (euler/p21::find-amicables 10)))
  (is (equal '()
             (euler/p21::find-amicables 100)))
  (is (equal '(284 220)
             (sort (euler/p21::find-amicables 300)
                   #'>)))
  (is (equal '(2924 2620 1210 1184 284 220)
             (sort (euler/p21::find-amicables 3000)
                   #'>))))
(test solution
  (is (= 0 (euler/p21:solution 10)))
  (is (= 504 (euler/p21:solution 300)))
  (is (= 8442 (euler/p21:solution 3000))))
