#lang sicp
;Exercise 1.5
;Ben Bitdiddle has invented a test to determine whether the interpreter he is
;faced with is using applicative-order evaluation or normal-order evaluation.
;He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;Then he evaluates the expression

(test 0 (p))

;What behavior will Ben observe with an interpreter that uses applicative-order
;evaluation? What behavior will he observe with an interpreter that uses
;normal-order evaluation? Explain your answer.



;We can find the answer of normal-order evaluation by substituion:
;(test 0 (p))
;(if (= 0 0) 0 (p))
;Therefore, the evaluation is zero.
;
;In applicative order evaluation, we will get an infinite loop. This is because
;there are infinite procedure calls to (p). If we could see what the interpreter
;is doing, it would look like
;(if (= x 0) 0 y)
;(if (= 0 0) 0 (p))
;(if (= 0 0) 0 (p))
;(if (= 0 0) 0 (p))
;...