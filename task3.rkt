#lang racket



(equal? (hardest-subject (list '("Maths" . 5) '("English" . 2) '("Programming" . 4) '("Programming" . 6) '("Maths" . 4) '("English" . 2))) "English")
(equal? (hardest-subject (list '("Maths" . 5) '("English" . 5) '("Programming" . 4) '("Programming" . 6) '("Maths" . 4) '("English" . 5))) "Maths")
