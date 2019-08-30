;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rackunit)
(require rackunit/text-ui)

;; número -> número
;; retorna o novo salário a partir do salário passado como parâmero baseado na faixa salarial
#;(define (recalculo-salario salario) 0)

(define recalculo-salario-testes
  (test-suite
   "recalculo-salario testes"
   (check-equal? (recalculo-salario 700.00) 770.00)
   (check-equal? (recalculo-salario 1200.00) 1320.00)
   (check-equal? (recalculo-salario 1201.00) 1285.07)
   (check-equal? (recalculo-salario 2500) 2675.00)
   (check-equal? (recalculo-salario 3000) 3210.00)
   (check-equal? (recalculo-salario 3001) 3091.03)
   (check-equal? (recalculo-salario 5000) 5150.00)
   (check-equal? (recalculo-salario 8000) 8240.00)
   (check-equal? (recalculo-salario 8001) 8001.00)))

(define (executar-testes testes)
  (run-tests (test-suite "todos os testes" testes)))

(define (recalculo-salario salario)
  (cond
    [(<= salario 1200) (+ salario (* .10 salario))]
    [(<= salario 3000) (+ salario (* .07 salario))]
    [(<= salario 8000) (+ salario (* .03 salario))]
    [else salario]))

(executar-testes recalculo-salario-testes)