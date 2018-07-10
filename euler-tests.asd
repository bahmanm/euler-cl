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
                                     (:file "test-p22")
                                     (:file "test-p23")
                                     (:file "test-p25")
                                     (:file "test-p26")
                                     (:file "test-p27")
                                     (:file "test-p28")
                                     (:file "test-p29")
                                     (:file "test-p30")
                                     (:file "test-p31")
                                     (:file "test-p32")
                                     (:file "test-p33")
                                     (:file "test-p34")
                                     (:file "test-p35")
                                     (:file "test-p36"))))
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
                                  (uiop:find-symbol* '#:p22-test-suite :euler/tests/p22))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p23-test-suite :euler/tests/p23))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p25-test-suite :euler/tests/p25))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p26-test-suite :euler/tests/p26))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p27-test-suite :euler/tests/p27))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p28-test-suite :euler/tests/p28))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p29-test-suite :euler/tests/p29))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p30-test-suite :euler/tests/p30))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p31-test-suite :euler/tests/p31))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p32-test-suite :euler/tests/p32))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p33-test-suite :euler/tests/p33))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p34-test-suite :euler/tests/p34))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p35-test-suite :euler/tests/p35))
                (uiop:symbol-call :fiveam '#:run!
                                  (uiop:find-symbol* '#:p36-test-suite :euler/tests/p36))))
