;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p15
  (:use :cl :it.bese.fiveam
        :euler/p15)
  (:export #:p15-test-suite))
(in-package :euler/tests/p15)

(def-suite
    p15-test-suite
    :description "Problem 15 test suite.")
(in-suite p15-test-suite)


(test factorial
      (is (= 1 (euler/p15::factorial 1)))
      (is (= 2 (euler/p15::factorial 2)))
      (is (= 6 (euler/p15::factorial 3)))
      (is (= 24 (euler/p15::factorial 4)))
      (is (= 120 (euler/p15::factorial 5)))
      (is (= 720 (euler/p15::factorial 6))))

(test solution
      (is (= 2 (euler/p15:solution 1)))
      (is (= 6 (euler/p15:solution 2)))
      (is (= 20 (euler/p15:solution 3))))
