#lang racket



(equal?
 ((rf (λ (x) (- -4 x)) (λ (x) (* x -2))) (range 1 11) (λ (x) (* x 3)))
 (list 15 18 21 24 27 30)
 ) ; only 5, 6, 7, 8, 9 and 10 satisfy the condition        
