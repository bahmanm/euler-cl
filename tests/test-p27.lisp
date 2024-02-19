;;;; Author: Bahman Movaqar<Bahman.com>
;;;;
(defpackage euler/tests/p27
  (:use :cl :it.bese.fiveam
        :euler/p27)
  (:export #:p27-test-suite))
(in-package :euler/tests/p27)

(def-suite
    p27-test-suite
    :description "Problem 27 test suite.")
(in-suite p27-test-suite)


(test quadratic
  (is (= 0 (funcall (euler/p27::quadratic 0 0) 0)))
  (is (= 1 (funcall (euler/p27::quadratic 0 0) 1)))
  (is (= 4 (funcall (euler/p27::quadratic 0 0) 2)))
  (is (= 5 (funcall (euler/p27::quadratic 0 1) 2)))
  (is (= 3 (funcall (euler/p27::quadratic 0 -1) 2)))
  (is (= 2 (funcall (euler/p27::quadratic 1 0) 1)))
  (is (= 13 (funcall (euler/p27::quadratic 1 1) 3)))
  (is (= 5 (funcall (euler/p27::quadratic -1 -1) 3)))
  (is (= 40 (funcall (euler/p27::quadratic -3 12) 7))))

(test count-primes
  (is (= 0 (euler/p27::count-primes 0 0)))
  (is (= 0 (euler/p27::count-primes 1 0)))
  (is (= 0 (euler/p27::count-primes 0 1)))
  (is (= 2 (euler/p27::count-primes 0 2)))
  (is (= 1 (euler/p27::count-primes 2 3)))
  (is (= 1 (euler/p27::count-primes 3 5))))

(test solution
  (is (= 0 (euler/p27:solution 1 0)))
  (is (= 0 (euler/p27:solution 2 0)))
  (is (= 0 (euler/p27:solution 1 1)))
  (is (= 0 (euler/p27:solution 1 2)))
  (is (= -5 (euler/p27:solution 4 5))))
