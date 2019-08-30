#lang racket

(require rackunit)
(require rackunit/text-ui)

;; lista, string -> qualquer coisa
;; retorna o último elemento da lista "lst", caso a lista esteja vazia levanta uma
;; exceção com o texto "msg"
#;(define (ultimo-elemento lst msg) 0)

(define ultimo-elemento-testes
  (test-suite
   "ultimo-elemento testes"
   (check-exn exn:fail? (thunk (ultimo-elemento empty "Lista vazia" (error "Lista vazia"))))
   (check-equal? (ultimo-elemento (list 0) "Lista vazia") 0)
   (check-equal? (ultimo-elemento (list 0 1 2 3 4) "Lista vazia") 4)))

(define (executar-testes testes)
  (run-tests (test-suite "todos os testes" testes)))

(define (ultimo-elemento lst msg)
  (cond
    [(empty? lst) (error msg)]
    [(empty? (rest lst)) (first lst)]
    [else (ultimo-elemento (rest lst) msg)]))

(executar-testes ultimo-elemento-testes)