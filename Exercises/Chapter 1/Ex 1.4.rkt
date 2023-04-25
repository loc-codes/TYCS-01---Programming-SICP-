#lang sicp
;Exercise 1.4.
;Observe that our model of evaluation allows for combinations whose operators are
;compound expressions. Use this observation to describe the behavior of the
;following procedure:
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;This function starts with the special conditional form if. If b is > 0, the
;operator is +. If b is <0, the operator is -. Once we have this operator,
;the problem reduces to (+ a b) or (- a b). Due to the conditional (> b 0),
;we always get the sum of a and (abs b)