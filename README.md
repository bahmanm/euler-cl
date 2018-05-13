# Project Euler in Common Lisp #
Solutions to [Project Euler](https://projecteuler.net/) problems in [Common Lisp](https://common-lisp.net/):

* [SBCL](http://www.sbcl.org/) as the Common Lisp implementation
* [FiveAM](https://common-lisp.net/project/fiveam/) for testing

*NOTE: This is a work in progress --obviously.*

# How To Run #

Piece of cake:

```
$ sbcl --load run-all.lisp  # replace "sbcl" with your favourite implementation
```

# How To Test #

To test, you need to install [FiveAM](https://common-lisp.net/project/fiveam/) first.

*If you're using [QuickLisp](https://www.quicklisp.org/beta/), run your Lisp and `(ql:quickload "fiveam")`.*

Assuming FiveAM is installed, simply:
```
$ sbcl --load test-all.lisp  # replace "sbcl" with your favourite implementation
```
