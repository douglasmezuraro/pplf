#lang racket

(require rackunit)
(require rackunit/text-ui)

;; lista(número) -> lista(número)
;; remove os primeiros "n" elementos da lista de entrada
;;
;;                    lst
;;         +-----------+-----------+
;;         |   empty   |   cons    |
;;   +-----+-----------+-----------+
;;   | < 0 |         error         |
;;   +-----+-----------+-----------+
;; n | = 0 |          lst          |
;;   +-----+-----------+-----------+
;;   | > 0 |   error   | recursion |
;;   +-----+-----------+-----------+
;;
#;(define (drop lst n) lst)

(define drop-tests
  (test-suite
   "drop testes"
   (check-equal? (drop (list 1 2) 0) '(1 2))
   (check-equal? (drop (list 1 3 5 7) 2) '(5 7))
   (check-equal? (drop (list 2 4 6 8) 4) empty)
   (check-exn exn:fail? (thunk (drop (list 1 2 3) -1)))
   (check-exn exn:fail? (thunk (drop (list 0 3 6 9))))))

(define (drop lst n)
  (cond
    [(< n 0) (error "índice inválido")]
    [(and (> n 0) (empty? lst)) (error "índice inválido")]
    [(= n 0) lst]
    [else (drop (rest lst) (sub1 n))]))

;; reste ... -> void
;; executa um conjunto de testes.
(define (execute-tests . tests)
  (run-tests (test-suite "Todos os testes" tests))
  (void))

(execute-tests drop-tests)