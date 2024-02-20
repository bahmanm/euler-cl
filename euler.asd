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
                             (:file "p01")
                             (:file "p02")
                             (:file "p03")
                             (:file "p04")
                             (:file "p05" :depends-on ("utils"))
                             (:file "p06")
                             (:file "p07")
                             (:file "p08")
                             (:file "p09")
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
                             (:file "p36" :depends-on ("utils"))
                             (:file "p37" :depends-on ("utils"))
                             (:file "euler"
                              :depends-on
                              ("p01" "p02" "p03" "p04" "p05"
                                     "p06" "p07" "p08" "p09"
                                     "p10" "p11" "p12" "p13"
                                     "p14" "p15" "p16" "p17"
                                     "p18" "p19" "p20" "p21"
                                     "p22" "p23" "p25" "p26"
                                     "p27" "p28" "p29" "p30"
                                     "p31" "p32" "p33" "p34"
                                     "p35" "p36" "p37")))))
  :in-order-to ((test-op (test-op "euler-tests"))))
