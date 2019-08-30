#lang racket

(require rackunit)
(require rackunit/text-ui)

;; lista(número), número -> lista(número)
;; insere o elemento "value" na posição "pos" da lista "lst"
;;
;;                      lst
;;           +-----------+-----------+
;;           |   empty   |   cons    |
;;     +-----+-----------+-----------+
;;     | < 0 |         error         |
;;     +-----+-----------+-----------+
;; pos | = 0 |   (cons value lst)    |
;;     +-----+-----------+-----------+
;;     | > 0 |   error   | recursion |
;;     +-----+-----------+-----------+
;;
#;(define (insert-at lst value pos) lst)

(define insert-at-tests
  (test-suite
   "insert-at testes"
   (check-equal? (insert-at empty 10 0) '(10))
   (check-equal? (insert-at (list 3 6 1 2) 5 2) '(3 6 5 1 2))
   (check-equal? (insert-at (list 3 6 1 2) 5 0) '(5 3 6 1 2))
   (check-exn exn:fail? (thunk (insert-at (list 3 6 1 2) 5 -2)))
   (check-exn exn:fail? (thunk (insert-at (list 3 6 1 2) 5 7)))
   (check-equal? (insert-at (list 3 6 1 2) 5 4) '(3 6 1 2 5))))

(define (insert-at lst value pos)
  (cond
    [(< pos 0) (error "posição inválida")]
    [(and (empty? lst) (> pos 0)) (error "posição inválida")]
    [(zero? pos) (cons value lst)]
    [else (cons (first lst) (insert-at (rest lst) value (sub1 pos)))]))

;; teste ... -> void
;; executa um conjunto de testes.
(define (execute-tests . tests)
  (run-tests (test-suite "Todos os testes" tests))
  (void))

(execute-tests insert-at-tests)