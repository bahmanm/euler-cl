;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p02
  (:use :cl :it.bese.fiveam
        :euler/p02)
  (:export #:p02-test-suite))
(in-package :euler/tests/p02)

(def-suite
    p02-test-suite
    :description "Problem 2 test suite.")
(in-suite p02-test-suite)

(test solution
  (is (= 2 (euler/p02::solution 2)))
  (is (= 2 (euler/p02::solution 3)))
  (is (= 2 (euler/p02::solution 5)))
  (is (= 2 (euler/p02::solution 6)))
  (is (= 10 (euler/p02::solution 14))))
