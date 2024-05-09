#lang racket



(= (my-min-if 15 60) 15)
(= (my-min-if 60 15) 15)
(= (my-min-guard 15 60) 15)
(= (my-min-guard 60 15) 15)
(= (my-min-built-in-p 5 6) 5)

(= (last-digit 154) 4)

(= (quotient-whole 64 2) 32)
(div-whole 154 17) ; 9 1/17

(= (remove-last-digit 154) 15)

(= (average-whole 5 1542) 773.5)

(= (round-two-dig pi) 3.14)
