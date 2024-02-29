;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:defsystem "euler"
  :description "Project Euler using Common Lisp"
  :author "Bahman Movaqar <Bahman@BahmanM.com>"
  :license "Apache License v2.0"
  :depends-on ("cl-ppcre")
  :serial t
  :components ((:module "solutions"
                :pathname "src"
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
                             (:file "p37" :depends-on ("utils"))))
               (:module "runner"
                :pathname "src"
                :depends-on ("solutions")
                :components ((:file "euler"))))
  :in-order-to ((test-op (test-op "euler-tests"))))
