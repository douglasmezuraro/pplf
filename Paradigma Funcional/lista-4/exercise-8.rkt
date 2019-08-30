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

(define (ultimo-elemento lst msg)
  (define (ultimo lst)
    (cond
      [(empty? (rest lst)) (first lst)]
      [else (ultimo (rest lst))]))
  (if (empty? lst) (error msg) (first(filter (λ (x) (equal? x (ultimo lst))) lst))))

;; teste ... -> void
;; executa um conjunto de testes.
(define (execute-tests . tests)
  (run-tests (test-suite "Todos os testes" tests))
  (void))

(execute-tests ultimo-elemento-testes)