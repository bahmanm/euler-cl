;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p05
  (:use :cl :it.bese.fiveam)
  (:export #:p05-test-suite))
(in-package :euler/tests/p05)

(def-suite
    p05-test-suite
    :description "Problem 5 test suite.")
(in-suite p05-test-suite)


(test prime-factors
  (let ((pf-2 (euler/p05::prime-factors 2))
        (pf-4 (euler/p05::prime-factors 4))
        (pf-36 (euler/p05::prime-factors 36)))
    (is (= 1 (hash-table-count pf-2)))
    (is (= 1 (gethash 2 pf-2)))
    ;;
    (is (= 1 (hash-table-count pf-4)))
    (is (= 2 (gethash 2 pf-4)))
    ;;
    (is (= 2 (hash-table-count pf-36)))
    (is (= 2 (gethash 2 pf-36)))
    (is (= 2 (gethash 3 pf-36)))))

(test lcd
  (let ((lcd-3 (euler/p05::lcd 3 (make-hash-table)))
        (lcd-4 (euler/p05::lcd 4 (make-hash-table)))
        (lcd-5 (euler/p05::lcd 5 (make-hash-table))))
    (is (= 2 (hash-table-count lcd-3)))
    (is (= 1 (gethash 2 lcd-3)))
    (is (= 1 (gethash 3 lcd-3)))
    ;;
    (is (= 2 (hash-table-count lcd-4)))
    (is (= 2 (gethash 2 lcd-4)))
    (is (= 1 (gethash 3 lcd-4)))
    ;;
    (is (= 3 (hash-table-count lcd-5)))
    (is (= 2 (gethash 2 lcd-5)))
    (is (= 1 (gethash 3 lcd-5)))
    (is (= 1 (gethash 5 lcd-5)))))


(test solution
  (is (= 6 (euler/p05:solution 3)))
  (is (= 12 (euler/p05:solution 4)))
  (is (= 60 (euler/p05:solution 5)))
  (is (= 2520 (euler/p05:solution 10))))
