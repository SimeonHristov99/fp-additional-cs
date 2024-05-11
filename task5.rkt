#lang racket

(define (alphabet) (map
   (λ (code) (string (integer->char code)))
   (range (char->integer #\a) (add1 (char->integer #\z)))
   ))

(define (count-occurrences str)
  (filter (λ (char-cnt) (positive? (cdr char-cnt)))
   (map (λ (letter) (cons letter (length
                                 (filter (λ (c-letter) (equal? c-letter letter))
                                         (map string (string->list (string-downcase str)))))))
       (alphabet)))
  )

(equal? (count-occurrences "Test") (list '("e" . 1) '("s" . 1) '("t" . 2)))
(equal? (count-occurrences "ThisIsAReallyLongWordContaingAlmostEveryCharacter") (list '("a" . 6) '("c" . 3) '("d" . 1) '("e" . 4) '("g" . 2) '("h" . 2) '("i" . 3) '("l" . 4) '("m" . 1) '("n" . 3) '("o" . 4) '("r" . 5) '("s" . 3) '("t" . 4) '("v" . 1) '("w" . 1) '("y" . 2)))
