;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:defsystem "euler"
    :description "Project Euler using Common Lisp"
    :author "Bahman Movaqar <Bahman@BahmanM.com>"
    :license "Apache License v2.0"
    :depends-on ()
    :serial t
    :components ((:module "src"
                          :components ((:file "utils")
                                       (:file "p1")
                                       (:file "p2")
                                       (:file "p3")
                                       (:file "p4")
                                       (:file "p5" :depends-on ("utils"))
                                       (:file "euler"
                                              :depends-on ("p1" "p2" "p3"
                                                                "p4" "p5")))))
    :in-order-to ((test-op (test-op "euler-tests"))))
