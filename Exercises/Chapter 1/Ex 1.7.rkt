#lang sicp
;Exercise 1.7
;The good-enough? test used in computing square roots will not be very effective
;for finding the square roots of very small numbers. Also, in real computers,
;arithmetic operations are almost always performed with limited precision. This
;makes our test inadequate for very large numbers. Explain these statements, with
;examples showing how the test fails for small and large numbers. An alternative
;strategy for implementing good-enough? is to watch how guess changes from one
;iteration to the next and to stop when the change is a very small fraction of the
;guess. Design a square-root procedure that uses this kind of end test.
;Does this work better for small and large numbers?

;The original "good_enough" will struggle with small numbers due to issues with
;our chosen tolerance. For instance, we choose a good_enough tolerance of <0.001
;in our original implementation, which is very inaccurate for small numbers.We
;could choose a smaller tolerance, but this would make compute time large

;For large numbers, the computer can struggle to handle these as OS is 32 or 64
;bit, which causes issues with our tolerance level as they are can cause fake
;positives, where we are under the tolerance but shouldn't be


(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (absmax x y)
  (if (> (abs x) (abs y))
      (abs x)
      (abs y)))

(define (relative_difference x y)
  (/ (abs (- x y)) (absmax x y)))
  

(define (div_good_enough? guess last_guess)
  (< (relative_difference guess last_guess) 0.0001))

;Yes, this version does wotrk better for very large and small numbers