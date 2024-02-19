;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/tests/p31
  (:use :cl :it.bese.fiveam
        :euler/p31)
  (:export #:p31-test-suite))
(in-package :euler/tests/p31)

(def-suite
    p31-test-suite
    :description "Problem 31 test suite.")
(in-suite p31-test-suite)


(test solution
  (is (= 1 (euler/p31:solution 1)))
  (is (= 2 (euler/p31:solution 2)))
  (is (= 2 (euler/p31:solution 3)))
  (is (= 3 (euler/p31:solution 4)))
  (is (= 4 (euler/p31:solution 5)))
  (is (= 5 (euler/p31:solution 6))))
