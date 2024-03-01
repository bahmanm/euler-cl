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
                             (:file "p05")
                             (:file "p06")
                             (:file "p07")
                             (:file "p08")
                             (:file "p09")
                             (:file "p10")
                             (:file "p11")
                             (:file "p12")
                             (:file "p13")
                             (:file "p14")
                             (:file "p15")
                             (:file "p16")
                             (:file "p17")
                             (:file "p18")
                             (:file "p19")
                             (:file "p20")
                             (:file "p21")
                             (:file "p22")
                             (:file "p23")
                             (:file "p25")
                             (:file "p26")
                             (:file "p27")
                             (:file "p28")
                             (:file "p29")
                             (:file "p30")
                             (:file "p31")
                             (:file "p32")
                             (:file "p33")
                             (:file "p34")
                             (:file "p35")
                             (:file "p36")
                             (:file "p37")
                             (:file "p38")))
               (:module "runner"
                :pathname "src"
                :depends-on ("solutions")
                :components ((:file "euler"))))
  :in-order-to ((test-op (test-op "euler-tests"))))
