;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:defsystem "euler"
  :description "Project Euler using Common Lisp"
  :author "Bahman Movaqar <Bahman@BahmanM.com>"
  :license "Apache License v2.0"
  :depends-on ("cl-ppcre")
  :serial t
  :components ((:module "src"
                        :components ((:file "utils")
                                     (:file "p1")
                                     (:file "p2")
                                     (:file "p3")
                                     (:file "p4")
                                     (:file "p5" :depends-on ("utils"))
                                     (:file "p6")
                                     (:file "p7")
                                     (:file "p8")
                                     (:file "p9")
                                     (:file "p10" :depends-on ("utils"))
                                     (:file "p11" :depends-on ("utils"))
                                     (:file "p12")
                                     (:file "p13" :depends-on ("utils"))
                                     (:file "p14")
                                     (:file "p15")
                                     (:file "p16" :depends-on ("utils"))
                                     (:file "p17")
                                     (:file "p18")
                                     (:file "p19")
                                     (:file "p20" :depends-on ("utils"))
                                     (:file "p21" :depends-on ("utils"))
                                     (:file "p22")
                                     (:file "p23" :depends-on ("utils"))
                                     (:file "p25")
                                     (:file "p26")
                                     (:file "p27" :depends-on ("utils"))
                                     (:file "p28")
                                     (:file "p29" :depends-on ("utils"))
                                     (:file "p30" :depends-on ("utils"))
                                     (:file "p31")
                                     (:file "p32" :depends-on ("utils"))
                                     (:file "p33")
                                     (:file "p34")
                                     (:file "p35" :depends-on ("utils"))
                                     (:file "euler"
                                            :depends-on
                                            ("p1" "p2" "p3" "p4" "p5"
                                                  "p6" "p7" "p8" "p9"
                                                  "p10" "p11" "p12" "p13"
                                                  "p14" "p15" "p16" "p17"
                                                  "p18" "p19" "p20" "p21"
                                                  "p22" "p23" "p25" "p26"
                                                  "p27" "p28" "p29" "p30"
                                                  "p31" "p32" "p33" "p34"
                                                  "p35")))))
  :in-order-to ((test-op (test-op "euler-tests"))))
