;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p9
  (:use :cl :it.bese.fiveam)
  (:export #:p9-test-suite))
(in-package :euler/tests/p9)

(def-suite
    p9-test-suite
    :description "Problem 9 test suite.")
(in-suite p9-test-suite)

(test compute-abc
  (is (equal '(3 4 5) (euler/p9::compute-abc 12 2 3)))
  (is (equal '(0 6 6) (euler/p9::compute-abc 12 1 2))))

(test find-mk
  (is (equal '(2 3) (euler/p9::find-mk 2 2 12))))

(test solution
  (is (= 60 (euler/p9:solution 12))))
