;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:defsystem "euler-tests"
  :author "Bahman Movaqar <Bahman@BahmanM.com>"
  :license "Apache License v2.0"
  :depends-on ("euler" "fiveam")
  :serial t
  :components ((:module "tests"
                :components ((:file "test-utils")
                             (:file "test-p1"))))
  :perform (asdf:test-op (op system)
                         (progn
                           (fiveam:run (uiop:find-symbol* :utils-test-suite
                                                          :euler/tests/utils))
                           (fiveam:run (uiop:find-symbol* :p1-test-suite
                                                          :euler/tests/p1)))))
