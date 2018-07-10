;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p10
  (:use :cl :it.bese.fiveam)
  (:export #:p10-test-suite))
(in-package :euler/tests/p10)

(def-suite
    p10-test-suite
    :description "Problem 10 test suite.")
(in-suite p10-test-suite)


(test solution
  (is (= 0 (euler/p10::solution 1)))
  (is (= 2 (euler/p10::solution 2)))
  (is (= 5 (euler/p10::solution 3)))
  (is (= 5 (euler/p10::solution 4)))
  (is (= 10 (euler/p10::solution 5)))
  (is (= 41 (euler/p10::solution 14))))
