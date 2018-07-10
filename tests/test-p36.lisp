;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p36
  (:use :cl :it.bese.fiveam
        :euler/p36)
  (:export #:p36-test-suite))
(in-package :euler/tests/p36)

(def-suite
    p36-test-suite
    :description "Problem 36 test suite.")
(in-suite p36-test-suite)


(test palindromep
  (is-true (euler/p36::palindromep "0"))
  (is-true (euler/p36::palindromep "161"))
  (is-true (euler/p36::palindromep "11"))
  (is-true (euler/p36::palindromep "1661"))
  (is-true (euler/p36::palindromep "16061"))
  (is-true (euler/p36::palindromep "166661"))
  (is-false (euler/p36::palindromep "1611"))
  (is-false (euler/p36::palindromep "166"))
  (is-false (euler/p36::palindromep "2211")))

(test solution
  (is (= 1 (euler/p36:solution 1)))
  (is (= 25 (euler/p36:solution 10))))
