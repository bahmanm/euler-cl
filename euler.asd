;;;; Author: Bahman Movaqar<Bahman@BahmanM.com>
;;;;
(asdf:defsystem "euler"
    :description "Project Euler using Common Lisp"
    :author "Bahman Movaqar <Bahman@BahmanM.com>"
    :license "Apache License v2.0"
    :depends-on ()
    :serial t
    :components ((:module "src"
                          :components ((:file "p1")
                                       (:file "p2")
                                       (:file "euler" :depends-on ("p1" "p2")))))
    :in-order-to ((test-op (test-op "euler-tests"))))
