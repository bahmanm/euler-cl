# Project Euler in Common Lisp #

Solutions to [Project Euler](https://projecteuler.net/) problems in
[Common Lisp](https://common-lisp.net/).

*[SBCL](http://www.sbcl.org/) is the Common Lisp implementation used
for development and testing.*


# Dependencies #

* [FiveAM](https://common-lisp.net/project/fiveam/) for testing
* [cl-ppcre](http://edicl.github.io/cl-ppcre/) for pattern matching

Installing the dependencies varies according to your library/package
manager of choice. For example, using [QuickLisp](https://www.quicklisp.org/beta/)
you can do so by executing the following in the Lisp REPL:

```
(ql:quickload "fiveam")
(ql:quickload "cl-ppcre")
```

# How To Run #

Assuming the dependencies are installed:

```
$ sbcl --load run-all.lisp    # replace "sbcl" with your favourite implementation
```

# How To Test #

Assuming the dependencies are installed:

```
$ sbcl --load test-all.lisp   # replace "sbcl" with your favourite implementation
```
