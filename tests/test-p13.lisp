;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p13
  (:use :cl :it.bese.fiveam
        :euler/p13)
  (:export #:p13-test-suite))
(in-package :euler/tests/p13)

(def-suite
    p13-test-suite
    :description "Problem 13 test suite.")
(in-suite p13-test-suite)


(test solution
  (is (equal "8" (euler/p13:solution '(10 20 50) 1)))
  (is (equal "550" (euler/p13:solution '(222 300 11 17) 3))))
