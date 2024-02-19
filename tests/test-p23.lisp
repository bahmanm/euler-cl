;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(defpackage euler/tests/p23
  (:use :cl :it.bese.fiveam
        :euler/p23)
  (:export #:p23-test-suite))
(in-package :euler/tests/p23)

(def-suite
    p23-test-suite
    :description "Problem 23 test suite.")
(in-suite p23-test-suite)


(test abundantp
  (is-true (euler/p23::abundantp 12))
  (is-true (euler/p23::abundantp 18))
  (is-true (euler/p23::abundantp 20))
  (is-false (euler/p23::abundantp 2))
  (is-false (euler/p23::abundantp 3))
  (is-false (euler/p23::abundantp 6)))

(test find-abundants
  (is (equalp #() (euler/p23::find-abundants 1)))
  (is (equalp #() (euler/p23::find-abundants 2)))
  (is (equalp #() (euler/p23::find-abundants 10)))
  (is (equalp #(12) (euler/p23::find-abundants 12)))
  (is (equalp #(12 18 20) (euler/p23::find-abundants 20))))


(test sum-of-two-elements-p
  (is-true (euler/p23::sum-of-two-elements-p
            1 #(1 0) (euler/utils::vector-to-hash-table #(1 0))))
  (is-true (euler/p23::sum-of-two-elements-p
            3 #(1 0 2 3) (euler/utils::vector-to-hash-table #(1 0 2 3))))
  (is-true (euler/p23::sum-of-two-elements-p
            3 #(-1 0 2 3) (euler/utils::vector-to-hash-table #(-1 0 2 3))))
  (is-true (euler/p23::sum-of-two-elements-p
            4 #(-1 0 1 3) (euler/utils::vector-to-hash-table #(-1 0 1 3))))
  (is-false (euler/p23::sum-of-two-elements-p
             3 #(-1 0 2 5) (euler/utils::vector-to-hash-table #(-1 0 2 5))))
  (is-false (euler/p23::sum-of-two-elements-p
             1 #(1 5 8) (euler/utils::vector-to-hash-table #(1 5 8)))))

(test solution
  (is (= 1 (euler/p23:solution 1)))
  (is (= 3 (euler/p23:solution 2)))
  (is (= 6 (euler/p23:solution 3)))
  (is (= 276 (euler/p23:solution 23)))
  (is (= 276 (euler/p23:solution 24))))
