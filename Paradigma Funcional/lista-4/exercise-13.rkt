#lang racket

(require rackunit)
(require rackunit/text-ui)

;; Exemplo de chamada: (cons 2 3)
(define (cons x y)
  (λ (m) (m x y)))

;; Exemplo de chamada: (first (cons 2 3)) -> 2
(define (first z)
  (z (λ (p q) p)))

;; par(qualquer coisa) -> qualquer coisa
;; retorna o segundo elemento do pair "z"
#;(define (rest z) z)

(define last-tests
  (test-suite
   "last testes"
   (check-equal? (rest (cons 2 3)) 3)
   (check-equal? (rest (cons 3 empty)) empty)
   (check-equal? (first (rest (cons 1 (cons 2 3)))) 2)
   (check-equal? (rest (rest (cons 1 (cons 2 3)))) 3))) 

(define (rest z)
  (z (λ (p q) q)))

;; teste ... -> void
;; executa um conjunto de testes.
(define (execute-tests . tests)
  (run-tests (test-suite "Todos os testes" tests))
  (void))

(execute-tests last-tests)