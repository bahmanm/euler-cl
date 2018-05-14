;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:defsystem "euler-tests"
                :author "Bahman Movaqar <Bahman@BahmanM.com>"
                :license "Apache License v2.0"
                :defsystem-depends-on ("fiveam")
                :depends-on ("euler" "fiveam")
                :serial t
                :components ((:module "tests"
                                      :components ((:file "test-p1")
                                                   (:file "test-p2"))))
                :perform (asdf:test-op (op c)
                                       (uiop:symbol-call :fiveam '#:run!
                                                         (uiop:find-symbol* '#:p1-test-suite :euler/tests/p1))
                                       (uiop:symbol-call :fiveam '#:run!
                                                         (uiop:find-symbol* '#:p2-test-suite :euler/tests/p2))))
