;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p35
  (:use :cl :it.bese.fiveam
        :euler/p35)
  (:export #:p35-test-suite))
(in-package :euler/tests/p35)

(def-suite
    p35-test-suite
    :description "Problem 35 test suite.")
(in-suite p35-test-suite)


(test array-rotate-and-convert-to-integer
  (is (= 1 (euler/p35::array-rotate-and-convert-to-integer #(1) 1)))
  (is (= 1 (euler/p35::array-rotate-and-convert-to-integer #(1) 2)))
  (is (= 1 (euler/p35::array-rotate-and-convert-to-integer #(1 0) 1)))
  (is (= 10 (euler/p35::array-rotate-and-convert-to-integer #(1 0) 2)))
  (is (= 231 (euler/p35::array-rotate-and-convert-to-integer #(1 2 3) 1)))
  (is (= 312 (euler/p35::array-rotate-and-convert-to-integer #(1 2 3) 2)))
  (is (= 21 (euler/p35::array-rotate-and-convert-to-integer #(1 0 2) 1)))
  (is (= 210 (euler/p35::array-rotate-and-convert-to-integer #(1 0 2) 2)))
  (is (= 102 (euler/p35::array-rotate-and-convert-to-integer #(1 0 2) 3))))

(test integer-to-list
  (is (equalp #(1) (euler/p35::integer-to-list 1)))
  (is (equalp #(1 2) (euler/p35::integer-to-list 12)))
  (is (equalp #(1 2 0) (euler/p35::integer-to-list 120)))
  (is (equalp #(1 3 4 5) (euler/p35::integer-to-list 1345))))

(test circular-prime-p
  (is-true (euler/p35::circular-prime-p 2))
  (is-true (euler/p35::circular-prime-p 7))
  (is-true (euler/p35::circular-prime-p 11))
  (is-true (euler/p35::circular-prime-p 79))
  (is-true (euler/p35::circular-prime-p 197))
  (is-false (euler/p35::circular-prime-p 6))
  (is-false (euler/p35::circular-prime-p 8))
  (is-false (euler/p35::circular-prime-p 23))
  (is-false (euler/p35::circular-prime-p 24))
  (is-false (euler/p35::circular-prime-p 12)))

(test solution
  (is (= 1 (euler/p35:solution 2)))
  (is (= 2 (euler/p35:solution 3)))
  (is (= 4 (euler/p35:solution 10)))
  (is (= 13 (euler/p35:solution 100))))
