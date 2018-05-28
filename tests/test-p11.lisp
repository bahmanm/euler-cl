;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:oos 'asdf:load-op :FiveAM)
(defpackage euler/tests/p11
  (:use :cl :it.bese.fiveam
        :euler/p11)
  (:export #:p11-test-suite))
(in-package :euler/tests/p11)

(def-suite
    p11-test-suite
    :description "Problem 11 test suite.")
(in-suite p11-test-suite)

(defparameter *a* (make-array '(3 3)
                              :initial-contents '((9 8 7)
                                                  (6 5 4)
                                                  (3 2 1))))
(test n-elements-vertical
  (is (equal '(9 6 3) (euler/p11::n-elements-vertical *a* 3 :row 0 :col 0)))
  (is (equal '(1) (euler/p11::n-elements-vertical *a* 1 :row 2 :col 2)))
  (is (equal '() (euler/p11::n-elements-vertical *a* 0 :row 0 :col 0)))
  (is (equal '() (euler/p11::n-elements-vertical *a* 4 :row 0 :col 0))))

(test n-elements-horizontal
  (is (equal '(9 8 7) (euler/p11::n-elements-horizontal *a* 3 :row 0 :col 0)))
  (is (equal '(1) (euler/p11::n-elements-horizontal *a* 1 :row 2 :col 2)))
  (is (equal '() (euler/p11::n-elements-horizontal *a* 0 :row 0 :col 0)))
  (is (equal '() (euler/p11::n-elements-horizontal *a* 4 :row 0 :col 0))))

(test n-elements-diagonal-up
  (is (equal '(3 5 7) (euler/p11::n-elements-diagonal-up *a* 3 :row 2 :col 0)))
  (is (equal '(1) (euler/p11::n-elements-diagonal-up *a* 1 :row 2 :col 2)))
  (is (equal '(9) (euler/p11::n-elements-diagonal-up *a* 1 :row 0 :col 0)))
  (is (equal '() (euler/p11::n-elements-diagonal-up *a* 4 :row 0 :col 2))))

(test n-elements-diagonal-down
  (is (equal '(9 5 1) (euler/p11::n-elements-diagonal-down *a* 3 :row 0 :col 0)))
  (is (equal '(9) (euler/p11::n-elements-diagonal-down *a* 1 :row 0 :col 0)))
  (is (equal '() (euler/p11::n-elements-diagonal-down *a* 0 :row 2 :col 2)))
  (is (equal '() (euler/p11::n-elements-diagonal-down *a* 4 :row 0 :col 0))))

(test n-max-product-elements
  (let ((a1 *a*)
        (a2 (make-array '(3 3)
                        :initial-contents '((1 5 1)
                                            (6 3 4)
                                            (0 1 1))))
        (a3 (make-array '(3 3)
                        :initial-contents '((1 3 1)
                                            (2 1 2)
                                            (0 4 1)))))
    (is (equal '(9 8 7) (euler/p11::n-max-product-elements a1 3)))
    (is (equal '(6 5) (euler/p11::n-max-product-elements a2 2)))
    (is (equal '(4 2) (euler/p11::n-max-product-elements a3 2)))))
