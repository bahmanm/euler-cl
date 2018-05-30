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
                                     (:file "euler"
                                            :depends-on
                                            ("p1" "p2" "p3" "p4" "p5"
                                                  "p6" "p7" "p8" "p9"
                                                  "p10" "p11" "p12" "p13"
                                                  "p14")))))
  :in-order-to ((test-op (test-op "euler-tests"))))
