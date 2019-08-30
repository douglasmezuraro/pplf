#lang racket

(require rackunit)
(require rackunit/text-ui)

;; lista(número), lista(número) -> lista(número)
;; retorna uma nova lista cs elementos da "lsta" seguido dos elementos da "lstb"
;;
;;                               lstb
;;              +-----------------+-----------------+
;;              |      empty      |       cons      |
;;      +-------+-----------------+-----------------+
;;      | empty |      empty      | recursion(lstb) |
;; lsta +-------+-----------------+-----------------+
;;      | cons  |          recursion(lsta)          |
;;      +-------+-----------------------------------+
;;
#;(define (append lsta lstb) empty);
  
(define append-tests
  (test-suite
   "append testes"
   (check-equal? (append empty empty) empty)
   (check-equal? (append (list 0 1 2) empty) '(0 1 2))
   (check-equal? (append empty (list 0 3 6)) '(0 3 6))
   (check-equal? (append (list 0 1 2 3) (list 4 5 6)) '(0 1 2 3 4 5 6))))

(define (append lsta lstb)
  (cond
    [(and (empty? lsta) (empty? lstb)) empty]
    [(empty? lsta) (cons (first lstb) (append empty (rest lstb)))]
    [else (cons (first lsta) (append (rest lsta) lstb))]))

;; teste ... -> void
;; executa um conjunto de testes.
(define (execute-tests . tests)
  (run-tests (test-suite "Todos os testes" tests))
  (void))

(execute-tests append-tests)