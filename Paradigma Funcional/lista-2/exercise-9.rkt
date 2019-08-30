#lang racket

(require rackunit)
(require rackunit/text-ui)

;; lista -> número
;; retorna o maior número da lista "lst"
#;(define (maximo lst) 0)

(define maximo-testes
  (test-suite
   "maximo-testes testes"
   (check-exn exn:fail? (thunk (maximo empty (error "Lista vazia"))))
   (check-equal? (maximo (list 0)) 0)
   (check-equal? (maximo (list 0 1 3 2)) 3)
   (check-equal? (maximo (list 4 -2 -1)) 4)
   (check-equal? (maximo (list 2 2 2)) 2)
   (check-equal? (maximo (list 1 2 0)) 2)))

(define (executar-testes testes)
  (run-tests (test-suite "todos os testes" testes)))

(define (maximo lst)
  (cond
    [(empty? lst) (error "Lista vazia")]
    [(empty? (rest lst)) (first lst)]
    [(max (first lst)
          (maximo (rest lst)))]))

(executar-testes maximo-testes)