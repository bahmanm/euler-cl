;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:defsystem "euler-tests"
  :author "Bahman Movaqar <Bahman@BahmanM.com>"
  :license "Apache License v2.0"
  :depends-on ("euler" "fiveam")
  :serial t
  :components ((:module "tests"
                :components ((:file "test-utils")
                             (:file "test-p01")
                             (:file "test-p02")
                             (:file "test-p03")
                             (:file "test-p04")
                             (:file "test-p05")
                             (:file "test-p06")
                             (:file "test-p07")
                             (:file "test-p08")
                             (:file "test-p09")
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
                             (:file "test-p36")
                             (:file "test-p37")
                             )))
  :perform (asdf:test-op (op system)
                         (progn
                           (fiveam:run (uiop:find-symbol* :utils-test-suite
                                                          :euler/tests/utils))
                           (fiveam:run (uiop:find-symbol* :p01-test-suite
                                                          :euler/tests/p01))
                           (fiveam:run (uiop:find-symbol* :p02-test-suite
                                                          :euler/tests/p02))
                           (fiveam:run (uiop:find-symbol* :p03-test-suite
                                                          :euler/tests/p03))
                           (fiveam:run (uiop:find-symbol* :p04-test-suite
                                                          :euler/tests/p04))
                           (fiveam:run (uiop:find-symbol* :p05-test-suite
                                                          :euler/tests/p05))
                           (fiveam:run (uiop:find-symbol* :p06-test-suite
                                                          :euler/tests/p06))
                           (fiveam:run (uiop:find-symbol* :p07-test-suite
                                                          :euler/tests/p07))
                           (fiveam:run (uiop:find-symbol* :p08-test-suite
                                                          :euler/tests/p08))
                           (fiveam:run (uiop:find-symbol* :p09-test-suite
                                                          :euler/tests/p09))
                           (fiveam:run (uiop:find-symbol* :p10-test-suite
                                                          :euler/tests/p10))
                           (fiveam:run (uiop:find-symbol* :p11-test-suite
                                                          :euler/tests/p11))
                           (fiveam:run (uiop:find-symbol* :p12-test-suite
                                                          :euler/tests/p12))
                           (fiveam:run (uiop:find-symbol* :p13-test-suite
                                                          :euler/tests/p13))
                           (fiveam:run (uiop:find-symbol* :p14-test-suite
                                                          :euler/tests/p14))
                           (fiveam:run (uiop:find-symbol* :p15-test-suite
                                                          :euler/tests/p15))
                           (fiveam:run (uiop:find-symbol* :p16-test-suite
                                                          :euler/tests/p16))
                           (fiveam:run (uiop:find-symbol* :p17-test-suite
                                                          :euler/tests/p17))
                           (fiveam:run (uiop:find-symbol* :p18-test-suite
                                                          :euler/tests/p18))
                           (fiveam:run (uiop:find-symbol* :p19-test-suite
                                                          :euler/tests/p19))
                           (fiveam:run (uiop:find-symbol* :p20-test-suite
                                                          :euler/tests/p20))
                           (fiveam:run (uiop:find-symbol* :p21-test-suite
                                                          :euler/tests/p21))
                           (fiveam:run (uiop:find-symbol* :p22-test-suite
                                                          :euler/tests/p22))
                           (fiveam:run (uiop:find-symbol* :p23-test-suite
                                                          :euler/tests/p23))
                           (fiveam:run (uiop:find-symbol* :p25-test-suite
                                                          :euler/tests/p25))
                           (fiveam:run (uiop:find-symbol* :p26-test-suite
                                                          :euler/tests/p26))
                           (fiveam:run (uiop:find-symbol* :p27-test-suite
                                                          :euler/tests/p27))
                           (fiveam:run (uiop:find-symbol* :p28-test-suite
                                                          :euler/tests/p28))
                           (fiveam:run (uiop:find-symbol* :p29-test-suite
                                                          :euler/tests/p29))
                           (fiveam:run (uiop:find-symbol* :p30-test-suite
                                                          :euler/tests/p30))
                           (fiveam:run (uiop:find-symbol* :p31-test-suite
                                                          :euler/tests/p31))
                           (fiveam:run (uiop:find-symbol* :p32-test-suite
                                                          :euler/tests/p32))
                           (fiveam:run (uiop:find-symbol* :p33-test-suite
                                                          :euler/tests/p33))
                           (fiveam:run (uiop:find-symbol* :p34-test-suite
                                                          :euler/tests/p34))
                           (fiveam:run (uiop:find-symbol* :p35-test-suite
                                                          :euler/tests/p35))
                           (fiveam:run (uiop:find-symbol* :p36-test-suite
                                                          :euler/tests/p36))
                           (fiveam:run (uiop:find-symbol* :p37-test-suite
                                                          :euler/tests/p37))
                           )))
