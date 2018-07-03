;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p34
  (:use :cl :it.bese.fiveam
        :euler/p34)
  (:export #:p34-test-suite))
(in-package :euler/tests/p34)

(def-suite
    p34-test-suite
    :description "Problem 34 test suite.")
(in-suite p34-test-suite)


(test sum-of-digit-factorials
  (is (= 1 (euler/p34::sum-of-digit-factorials 0)))
  (is (= 1 (euler/p34::sum-of-digit-factorials 1)))
  (is (= 2 (euler/p34::sum-of-digit-factorials 10)))
  (is (= 4 (euler/p34::sum-of-digit-factorials 22)))
  (is (= 4 (euler/p34::sum-of-digit-factorials 1001)))
  (is (= 122 (euler/p34::sum-of-digit-factorials 150))))
