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
