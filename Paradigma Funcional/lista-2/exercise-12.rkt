#lang racket

(require rackunit)
(require rackunit/text-ui)

;; lista -> lista
;; retorna uma lista com os elementos da lista "lst" porém com apenas uma ocorrência de elementos duplicados
#;(define (remove-duplicados lst) empty)

(define remove-duplicados-testes
  (test-suite
   "remove-duplicados testes"
   (check-equal? (remove-duplicados empty) empty)
   (check-equal? (remove-duplicados (list 1 2 3)) '(1 2 3))
   (check-equal? (remove-duplicados (list 1 2 2 3 3 3 4 4 4 4 5)) '(1 2 3 4 5))))

(define (executar-testes testes)
  (run-tests (test-suite "todos os testes" testes)))

(define (remove-duplicados lst)
  (cond
    [(empty? lst) empty]
    [(empty? (rest lst)) (first lst)]
    [(false? (= (first lst) (first (rest lst)))) (cons (first lst) (remove-duplicados (rest lst)))]
    [else (remove-duplicados (rest lst))]))

(executar-testes remove-duplicados-testes)