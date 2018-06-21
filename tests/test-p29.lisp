;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p29
  (:use :cl :it.bese.fiveam
        :euler/p29)
  (:export #:p29-test-suite))
(in-package :euler/tests/p29)

(def-suite
    p29-test-suite
    :description "Problem 29 test suite.")
(in-suite p29-test-suite)


(test distinct-combos
  (is (equalp '(4)
              (euler/p29::distinct-combos 2 2)))
  (is (equalp '(27 9 8 4)
              (euler/p29::distinct-combos 2 3)))
  (is (equalp '(256 64 81 27 9 16 8 4)
              (euler/p29::distinct-combos 2 4)))
  (is (equalp '(3125 625 125 25 1024 256 64 243 81 27 9 32 16 8 4)
              (euler/p29::distinct-combos 2 5))))

(test solution
  (is (= 1 (euler/p29:solution 2 2)))
  (is (= 4 (euler/p29:solution 2 3)))
  (is (= 8 (euler/p29:solution 2 4)))
  (is (= 15 (euler/p29:solution 2 5))))
