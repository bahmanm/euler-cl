# Project Euler in Common Lisp [![CircleCI](https://dl.circleci.com/status-badge/img/circleci/UMKeFZ8ns9T9vi5aquTfVT/CiytfQ2nzMkeYAKL8i7End/tree/master.svg?style=shield&circle-token=fb5d2555b905c322e658371ecb83f9250ed222d6)](https://dl.circleci.com/status-badge/redirect/circleci/UMKeFZ8ns9T9vi5aquTfVT/CiytfQ2nzMkeYAKL8i7End/tree/master)

Solutions to [Project Euler](https://projecteuler.net/) problems in Common Lisp - currently only tested against SBCL.

## Organisation

The sources (solutions) can be found in the [`src`](https://github.com/bahmanm/euler-cl/tree/master/src) directory.

Naturally each solution is paired with a test suite with the same name under the [`tests`](https://github.com/bahmanm/euler-cl/tree/master/tests) directory.

## How To Run and Test

euler-cl's build is facilitated by GNU Make.

#### To Run

Simply run `make run` to execute all the solutions and view the answers in a nicely tabulated format.

For example:

```text
 ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ 
 ┃                        PROJECT EULER ANSWERS                         ┃
 ┣━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━┫ 
 ┃ PROBLEM #  ┃              ANSWER              ┃      TIME (µs)       ┃ 
 ┣━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━┫ 
 ┃          1 │                          233,168 │                   63 ┃ 
 ┠────────────┼──────────────────────────────────┼──────────────────────┨ 
 ┃          2 │                        4,613,732 │                    2 ┃ 
 ┠────────────┼──────────────────────────────────┼──────────────────────┨ 
 ┃          3 │                            6,857 │                  212 ┃ 
 ┠────────────┼──────────────────────────────────┼──────────────────────┨ 
 ┃          4 │                          906,609 │              205,373 ┃ 
 ┠────────────┼──────────────────────────────────┼──────────────────────┨ 
 ┃          5 │                      232,792,560 │                   50 ┃ 
 ┠────────────┼──────────────────────────────────┼──────────────────────┨ 
 ┃          6 │                       25,164,150 │                    2 ┃ 
 ┠────────────┼──────────────────────────────────┼──────────────────────┨ 
 ┃          7 │                          104,743 │               24,250 ┃ 
 ┠────────────┼──────────────────────────────────┼──────────────────────┨ 
 ┃          8 │                   23,514,624,000 │                  992 ┃ 
 ┠────────────┼──────────────────────────────────┼──────────────────────┨ 
 ┃          9 │                       31,875,000 │                    5 ┃ 
 ┠────────────┼──────────────────────────────────┼──────────────────────┨ 
...
```

#### To Test

Simply run `make test` to launch all test suites.

For example:

```text
Running test suite UTILS-TEST-SUITE
 Running test HASH-TABLE-MERGE ......
 Running test STRING-TO-LIST ....
 Running test STRING-TO-INTEGER-LIST ....
 Running test INTEGER-TO-LIST ...
 Running test INTEGER-TO-ARRAY .....
 Running test PRIMEP ..........
 Running test MAPMAX ....
 Running test SUM-OF-DIVISORS .........
 Running test HASH-TABLE-EQUAL-P ......
 Running test VECTOR-TO-HASH-TABLE ....
Running test suite P1-TEST-SUITE
 Running test MULTIPLE-OF-3-OR-5P ....
 Running test SOLUTION* ....
 Running test SOLUTION ....
Running test suite P2-TEST-SUITE
 Running test SOLUTION .....
Running test suite P3-TEST-SUITE
 Running test SOLUTION* ...
 Running test SOLUTION ...
Running test suite P4-TEST-SUITE
 Running test PALINDROMIC-NUMBERP ......
 Running test MAX-PALINDROMIC-PRODUCT ..
 Running test SOLUTION ..
Running test suite P5-TEST-SUITE
 Running test PRIME-FACTORS .......
 Running test LCD ..........
 Running test SOLUTION ....
Running test suite P6-TEST-SUITE
 Running test SUM-1-TO-N ....
 Running test SUM-SQUARED-1-TO-N ....
 Running test SOLUTION ....
Running test suite P7-TEST-SUITE
 Running test NTH-PRIME ......
 Running test SOLUTION ......
...
```

## Dependencies 

The makefile is designed in a way that whenever you run one of the targets (eg `run` or `test`), it ensures the dependencies are/get installed.

The only thing you'd need to install is [Quicklisp](https://www.quicklisp.org/beta/).

