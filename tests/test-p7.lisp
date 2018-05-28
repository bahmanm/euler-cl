;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p7
  (:use :cl :it.bese.fiveam)
  (:export #:p7-test-suite))
(in-package :euler/tests/p7)

(def-suite
    p7-test-suite
    :description "Problem 7 test suite.")
(in-suite p7-test-suite)


(test nth-prime
  (is (= 2 (euler/p7::nth-prime 1)))
  (is (= 3 (euler/p7::nth-prime 2)))
  (is (= 5 (euler/p7::nth-prime 3)))
  (is (= 7 (euler/p7::nth-prime 4)))
  (is (= 11 (euler/p7::nth-prime 5)))
  (is (= 13 (euler/p7::nth-prime 6))))

(test solution
  (is (= 2 (euler/p7::solution 1)))
  (is (= 3 (euler/p7::solution 2)))
  (is (= 5 (euler/p7::solution 3)))
  (is (= 7 (euler/p7::solution 4)))
  (is (= 11 (euler/p7::solution 5)))
  (is (= 13 (euler/p7::solution 6))))
