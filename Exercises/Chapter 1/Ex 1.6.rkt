#lang sicp
;Exercise 1.6.
;Alyssa P. Hacker doesn't see why if needs to be provided as a special form.
;`Why can't I just define it as an ordinary procedure in terms of cond?' she asks.
;Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a
;new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)
5

(new-if (= 1 1) 0 5)
0

;Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (improve guess num)
  (average guess (/ num guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good_enough? guess num)
  (< (abs (- (square guess) num)) 0.001))

(define (sqrt x) (sqrt-iter 1.0 x 0))
;What happens when Alyssa attempts to use this to compute square roots? Explain.

;ANSWER:
;The new_if function will cause an infinite loop. This is for 2 reasons
;1. Cond statement is an eager evaluator. It will allow every predicate to eval
;before the cond statement evaluates the predicate as true or false.
;2. The interpreter uses applicative order evaluation. This means good_enough
;will not be called until numerically required, causing sqrt-iter to recursively
;call itself forever.

;However, "If" is a lazy evaluator, meaning it will evaluate the predicate first, 
;and sqrt-iter is evaluated only if the predicate is false. This means
;good_enough is numerically checked in every iteration, preventing an infinite loop.