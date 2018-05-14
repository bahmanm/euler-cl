;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p2
  (:use :cl :it.bese.fiveam
        :euler/p2)
  (:export #:p2-test-suite))
(in-package :euler/tests/p2)

(def-suite
    p2-test-suite
    :description "Problem 2 test suite.")
(in-suite p2-test-suite)

(test solution
      (is (= 2 (euler/p2::solution 2)))
      (is (= 2 (euler/p2::solution 3)))
      (is (= 2 (euler/p2::solution 5)))
      (is (= 2 (euler/p2::solution 6)))
      (is (= 10 (euler/p2::solution 14))))
