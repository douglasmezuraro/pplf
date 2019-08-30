;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rackunit)
(require rackunit/text-ui)

;; lista -> lista
;; retorna uma lista onde cada elemento da lista "lst" é acrescentado de "num"
#;(define (lista-add-num num lst) lst)

(define lista-add-num-testes
  (test-suite
   "lista-add-num testes"
   (check-equal? (lista-add-num 1 empty) empty)
   (check-equal? (lista-add-num 0 (list 0)) (list 0))
   (check-equal? (lista-add-num 2 (list -1 0 1)) (list 1 2 3))
   (check-equal? (lista-add-num -2 (list -4 -2 0 2 4)) (list -6 -4 -2 0 2))))

(define (lista-add-num num lst)
  (cond
    [(empty? lst) empty]
    [else (cons (+ num (first lst)) (lista-add-num num (rest lst)))]))

(define (executar-testes testes)
  (run-tests (test-suite "todos os testes" testes)))

(executar-testes lista-add-num-testes)