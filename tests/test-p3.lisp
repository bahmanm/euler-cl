;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p3
  (:use :cl :it.bese.fiveam
        :euler/p3)
  (:export #:p3-test-suite))
(in-package :euler/tests/p3)

(def-suite
    p3-test-suite
    :description "Problem 3 test suite.")
(in-suite p3-test-suite)

(test solution*
  (is (= 5 (euler/p3::solution* 10 2 1)))
  (is (= 10 (euler/p3::solution* 10 10 1)))
  (is (= 13 (euler/p3::solution* 13 2 1))))

(test solution
  (is (= 5 (euler/p3:solution 10)))
  (is (= 7 (euler/p3:solution 14)))
  (is (= 13 (euler/p3:solution 13))))
