#lang racket

(define (my-min-if x y)
  (if (< x y) x y)
  )

(define (my-min-guard x y)
  (cond
    [(< x y) x]
    [else y]
    )
  )

(define (my-min-built-in x y)
  (min x y)
  )

(define (last-digit n)
  (remainder n 10)
  )

(define (quotient-whole n d)
  (quotient n d)
  )

(define (div-whole n d)
  (/ n d)
  )

(define (remove-last-digit n)
  (quotient n 10)
  )

(define (average-whole x y)
  (/ (+ x y) 2)
  )

(define (round-two-dig n)
  (/ (round (* 100 n)) 100)
  )

(= (my-min-if 15 -60) -60)
(= (my-min-if 15 60) 15)
(= (my-min-if 60 15) 15)
(= (my-min-guard 15 60) 15)
(= (my-min-guard 60 15) 15)
(= (my-min-built-in 5 6) 5)

(= (last-digit 154) 4)

(= (quotient-whole 64 2) 32)
(div-whole 154 17) ; 9 1/17

(= (remove-last-digit 154) 15)

(= (average-whole 5 1542) 773.5)

(= (round-two-dig pi) 3.14)
