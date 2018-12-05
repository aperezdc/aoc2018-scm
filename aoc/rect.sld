; vim:set ft=scheme:

(define-library
  (aoc rect)
  (export rect rect?
          rect-x rect-y rect-w rect-h
          rect-l rect-t rect-r rect-b
          rect-area
          rect-intersect?
          rect-intersection)
  (import (scheme base)
          (srfi 95)
          (srfi 145))
  (include "rect.scm"))

