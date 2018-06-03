;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/utils
  (:use :cl :it.bese.fiveam)
  (:export #:utils-test-suite))
(in-package :euler/tests/utils)

(def-suite
    utils-test-suite
    :description "Utils test suite.")
(in-suite utils-test-suite)

(test hash-table-merge
  (let ((ht1 (make-hash-table))
        (ht2 (make-hash-table))
        (merger #'(lambda (old new) new)))
    (setf (gethash 'a ht1) 10
          (gethash 'b ht1) 20
          (gethash 'c ht1) 30
          (gethash 'a ht2) 100
          (gethash 'b ht2) 20
          (gethash 'd ht2) 300
          (gethash 'e ht2) 400)
    (let ((result (euler/utils:hash-table-merge ht1 ht2 merger)))
      (is (= 5 (hash-table-count result)))
      (is (= 100 (gethash 'a result)))
      (is (= 20 (gethash 'b result)))
      (is (= 30 (gethash 'c result)))
      (is (= 300 (gethash 'd result)))
      (is (= 400 (gethash 'e result))))))

(test string-to-list
  (is (equal '() (euler/utils:string-to-list nil)))
  (is (equal '() (euler/utils:string-to-list "")))
  (is (equal '("a") (euler/utils:string-to-list "a")))
  (is (equal '("a" "2" "b") (euler/utils:string-to-list "a2b"))))

(test string-to-integer-list
  (is (equal '() (euler/utils:string-to-integer-list nil)))
  (is (equal '() (euler/utils:string-to-integer-list "")))
  (is (equal '(1) (euler/utils:string-to-integer-list "1")))
  (is (equal '(1 2 3) (euler/utils:string-to-integer-list "123"))))

(test number-to-list
  (is (equal '(0) (euler/utils:integer-to-list 0)))
  (is (equal '(1 2 3) (euler/utils:integer-to-list 123)))
  (is (equal '(1 2 3 4 5 6 7 8 9 0) (euler/utils:integer-to-list 1234567890))))

(test primep
  (is-false (euler/utils::primep 1))
  (is-true (euler/utils::primep 2))
  (is-true (euler/utils::primep 3))
  (is-true (euler/utils::primep 17))
  (is-false (euler/utils::primep 15)))

(test mapmax
  (is (= 2 (euler/utils::mapmax (lambda (x) (* x x x)) '(-6 1 2))))
  (is (= -6 (euler/utils::mapmax (lambda (x) (* x x x)) '(-6 1 2) #'<)))
  (is (equal '(1 2 3) (euler/utils::mapmax #'length '((1 2 3) (1) (1 2)) #'>)))
  (is (equal '(1) (euler/utils::mapmax #'length '((1 2 3) (1) (1 2)) #'<))))

(test sum-of-divisors
  (is (= 1 (euler/utils::sum-of-divisors 1)))
  (is (= 3 (euler/utils::sum-of-divisors 2)))
  (is (= 4 (euler/utils::sum-of-divisors 3)))
  (is (= 12 (euler/utils::sum-of-divisors 6)))
  (is (= 15 (euler/utils::sum-of-divisors 8)))
  (is (= 18 (euler/utils::sum-of-divisors 10)))
  (is (= 24 (euler/utils::sum-of-divisors 14)))
  (is (= 504 (euler/utils::sum-of-divisors 220)))
  (is (= 504 (euler/utils::sum-of-divisors 284))))
