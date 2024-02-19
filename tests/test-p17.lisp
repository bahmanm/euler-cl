;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p17
  (:use :cl :it.bese.fiveam
        :euler/p17)
  (:export #:p17-test-suite))
(in-package :euler/tests/p17)

(def-suite
    p17-test-suite
    :description "Problem 17 test suite.")
(in-suite p17-test-suite)


(test *count-letters-1-99*
  (is (= 854 euler/p17::*count-letters-1-99*)))

(test *count-letters-1-999*
  (is (= 21113 euler/p17::*count-letters-1-999*)))

(test solution
  (is (= 21124 (euler/p17:solution))))
