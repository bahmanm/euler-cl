;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p22
  (:use :cl :it.bese.fiveam
        :euler/p22)
  (:export #:p22-test-suite))
(in-package :euler/tests/p22)

(def-suite
    p22-test-suite
    :description "Problem 22 test suite.")
(in-suite p22-test-suite)


(test name-to-alphabetical-value
  (is (= 1 (euler/p22::name-to-alphabetical-value "A")))
  (is (= 3 (euler/p22::name-to-alphabetical-value "AB")))
  (is (= 5 (euler/p22::name-to-alphabetical-value "BC")))
  (is (= 5 (euler/p22::name-to-alphabetical-value "CB")))
  (is (= 6 (euler/p22::name-to-alphabetical-value "ABC")))
  (is (= 53 (euler/p22::name-to-alphabetical-value "COLIN"))))

(test process-names
  (is (= 1 (euler/p22::process-names '("A"))))
  (is (= 7 (euler/p22::process-names '("A" "AB"))))
  (is (= 25 (euler/p22::process-names '("A" "AB" "ABC"))))
  (is (= 237 (euler/p22::process-names '("A" "AB" "ABC" "COLIN")))))

(test solution
  (is (= 1 (euler/p22:solution '("A"))))
  (is (= 7 (euler/p22:solution '("A" "AB"))))
  (is (= 25 (euler/p22:solution '("A" "AB" "ABC"))))
  (is (= 237 (euler/p22:solution '("A" "AB" "ABC" "COLIN")))))
