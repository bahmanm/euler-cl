(setf asdf:*central-registry*
      (list* '*default-pathname-defaults*
             (car (directory #p"."))
             asdf:*central-registry*))
(asdf:load-system :euler)
(euler:solutions)
(exit)
