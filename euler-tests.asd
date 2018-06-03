;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:defsystem "euler-tests"
  :author "Bahman Movaqar <Bahman@BahmanM.com>"
  :license "Apache License v2.0"
  :defsystem-depends-on ("fiveam")
  :depends-on ("euler" "fiveam")
  :serial t
  :components ((:module "tests"
                        :components ((:file "test-utils")
                                     (:file "test-p1")
                                     (:file "test-p2")
                                     (:file "test-p3")
                                     (:file "test-p4")
                                     (:file "test-p5")
                                     (:file "test-p6")
                                     (:file "test-p7")
                                     (:file "test-p8")
                                     (:file "test-p9")
                                     (:file "test-p10")
                                     (:file "test-p11")
                                     (:file "test-p12")
                                     (:file "test-p13")
                                     (:file "test-p14")
                                     (:file "test-p15")
                                     (:file "test-p16")
                                     (:file "test-p17")
                                     (:file "test-p18")
                                     (:file "test-p19")
                                     (:file "test-p20")
                                     (:file "test-p21")
                                     (:file "test-p22"))))
  :perform
  (asdf:test-op (op c)
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:utils-test-suite :euler/tests/utils))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p1-test-suite :euler/tests/p1))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p2-test-suite :euler/tests/p2))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p3-test-suite :euler/tests/p3))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p4-test-suite :euler/tests/p4))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p5-test-suite :euler/tests/p5))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p6-test-suite :euler/tests/p6))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p7-test-suite :euler/tests/p7))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p8-test-suite :euler/tests/p8))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p9-test-suite :euler/tests/p9))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p10-test-suite :euler/tests/p10))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p11-test-suite :euler/tests/p11))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p12-test-suite :euler/tests/p12))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p13-test-suite :euler/tests/p13))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p14-test-suite :euler/tests/p14))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p15-test-suite :euler/tests/p15))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p16-test-suite :euler/tests/p16))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p17-test-suite :euler/tests/p17))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p18-test-suite :euler/tests/p18))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p19-test-suite :euler/tests/p19))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p20-test-suite :euler/tests/p20))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p21-test-suite :euler/tests/p21))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p22-test-suite :euler/tests/p22))))
