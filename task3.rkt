#lang racket

(define (average xs)
  (/ (apply + xs) (length xs))
  )

(define (hardest-subject grades)
  (define (get-avg-grade subject)
    (average (map cdr (filter (λ (subj-gr) (equal? subject (car subj-gr))) grades)))
    )
  (let
      ([subjects (remove-duplicates (map car grades))])
    (foldl (λ (subject result)
             (if (< (get-avg-grade subject) (get-avg-grade result))
                 subject
                 result
                 )
             )
           (car subjects) (cdr subjects))
      )
  )

(equal? (hardest-subject (list '("Maths" . 5) '("English" . 2) '("Programming" . 4) '("Programming" . 6) '("Maths" . 4) '("English" . 2))) "English")
(equal? (hardest-subject (list '("Maths" . 5) '("English" . 5) '("Programming" . 4) '("Programming" . 6) '("Maths" . 4) '("English" . 5))) "Maths")
