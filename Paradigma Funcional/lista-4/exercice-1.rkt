#lang racket

(require rackunit)
(require rackunit/text-ui)

;; lista(número), número -> lista(número)
;; retorna uma lista sem a ocorrências do valor "value"
#;(define (remove-todos lst value) empty)

(define remove-todos-testes
  (test-suite
   "remove-todos teste"
   (check-equal? (remove-todos empty 0) empty)
   (check-equal? (remove-todos (list 0 1 2 3) 4) (list 0 1 2 3))
   (check-equal? (remove-todos (list 0 2 4 6 8) 2) (list 0 4 6 8))
   (check-equal? (remove-todos (list 3 2 3 5 8 3) 3) (list 2 5 8))))

(define (remove-todos lst value)
  (filter (λ (x) (not (equal? value x))) lst))

;; teste ... -> void
;; executa um conjunto de testes.
(define (execute-tests . tests)
  (run-tests (test-suite "Todos os testes" tests))
  (void))

(execute-tests remove-todos-testes)