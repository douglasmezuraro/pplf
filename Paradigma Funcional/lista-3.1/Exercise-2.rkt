#lang racket

(require rackunit)
(require rackunit/text-ui)

(define (executar-testes . testes)
  (run-tests (test-suite "Todos os testes" testes))
  (void))

;; natural, natural -> natural
;; retorna a soma de "a" e "b"
#;(define (soma a b) 0)

(define soma-testes
  (test-suite
   "soma testes"
   (check-equal? (soma 0 0) 0)
   (check-equal? (soma 0 1) 1)
   (check-equal? (soma 2 0) 2)
   (check-equal? (soma 1 2) 3)
   (check-equal? (soma 2 1) 3)
   (check-equal? (soma 3 1) 4)))

(define (soma a b)
  (cond
    [(zero? b) a]
    [else (soma (add1 a) (sub1 b))]))

;; natural, natural -> inteiro
;; retorna a subtracao de "a" e "b"
#;(define (subtracao a b) 0)

(define subtracao-testes
  (test-suite
   "subtracao testes"
   (check-equal? (subtracao 0 0) 0)
   (check-equal? (subtracao 0 2) -2)
   (check-equal? (subtracao 3 0) 3)
   (check-equal? (subtracao 5 5) 0)
   (check-equal? (subtracao 4 1) 3)))

(define (subtracao a b)
  (cond
    [(zero? b) a]
    [else (subtracao (sub1 a) (sub1 b))]))

;; natural, natural -> natural
;; retorna a multiplicação entre "a" e "b"
#;(define (multiplicacao a b) 0)

(define multiplicacao-testes
  (test-suite
   "multiplicação testes"
   (check-equal? (multiplicacao 0 0) 0)
   (check-equal? (multiplicacao 0 2) 0)
   (check-equal? (multiplicacao 3 0) 0)
   (check-equal? (multiplicacao 4 1) 4)
   (check-equal? (multiplicacao 1 99) 99)
   (check-equal? (multiplicacao 5 5) 25)
   (check-equal? (multiplicacao 4 2) 8)
   (check-equal? (multiplicacao 3 5) 15)))

(define (multiplicacao a b)
  (cond
    [(zero? b) b]
    [else (soma a (multiplicacao a (sub1 b)))]))
    
(executar-testes soma-testes
                 subtracao-testes
                 multiplicacao-testes)