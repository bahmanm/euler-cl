 ;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p25
  (:use :cl :it.bese.fiveam
        :euler/p25)
  (:export #:p25-test-suite))
(in-package :euler/tests/p25)

(def-suite
    p25-test-suite
    :description "Problem 25 test suite.")
(in-suite p25-test-suite)


(test fibo-generator
  (let ((get-next-fibo-term (euler/p25::fibo-generator)))
    (is (equal '(1 1) (funcall get-next-fibo-term)))
    (is (equal '(1 2) (funcall get-next-fibo-term)))
    (is (equal '(2 3) (funcall get-next-fibo-term)))
    (is (equal '(3 4) (funcall get-next-fibo-term)))
    (is (equal '(5 5) (funcall get-next-fibo-term)))
    (is (equal '(8 6) (funcall get-next-fibo-term)))
    (is (equal '(13 7) (funcall get-next-fibo-term)))
    (is (equal '(21 8) (funcall get-next-fibo-term))))
  (let ((get-next-fibo-term (euler/p25::fibo-generator)))
    (is (equal '(1 1) (funcall get-next-fibo-term)))
    (is (equal '(1 2) (funcall get-next-fibo-term)))
    (is (equal '(2 3) (funcall get-next-fibo-term)))))

(test solution
  (is (= 1 (euler/p25:solution 0)))
  (is (= 4 (euler/p25:solution 3)))
  (is (= 7 (euler/p25:solution 10))))
