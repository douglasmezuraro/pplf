#lang racket

(require rackunit)
(require rackunit/text-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Lista<número> -> Boolean
;; Retorna se a lista está ordenada
#;(define (sorted? lst) true)

(define sorted?-tests
  (test-suite
   "sorted? testes"
   (check-equal? (sorted? empty) true)
   (check-equal? (sorted? (list 1)) true)
   (check-equal? (sorted? (list 1 2 3)) true)
   (check-equal? (sorted? (list 1 3 2)) false)))

(define (sorted? lst)
  (cond
    [(empty? lst) true]
    [(empty? (rest lst)) true]
    [(> (first lst) (second lst)) false]
    [else (sorted? (rest lst))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Lista<número> -> Lista<número>
;; Retorna a lista como ela é sem as ocorrências do maior elemento
#;(define (filter-highest-element lst) lst)

(define filter-highest-element-tests
  (test-suite
   "filter-highest-element testes"
   (check-equal? (filter-highest-element empty) empty)
   (check-equal? (filter-highest-element (list 1)) empty)
   (check-equal? (filter-highest-element (list 1 2 3)) '(1 2))
   (check-equal? (filter-highest-element (list 1 1 2 2 3 5 6 6 6 5)) '(1 1 2 2 3 5 5))))

(define (filter-highest-element lst)
  (filter (λ (x) (< x (foldr max 0 lst))) lst))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Número -> Número
;; Retorna o valor do imposto baseado no salário
;;     * <= 1000 : 5% do salário
;;     * (> 1000) ^ (<= 5000) : (%5 de 1000) + (10% do que passar)
;;     * (> 5000) : (5% de 1000) + (10% de 4000) + (20% do que passar de 5000)
#;(define (calculate-tax salary) 0)

(define calculate-tax-tests
  (test-suite
   "calculate-tax-tests testes"
   (check-equal? (calculate-tax 500) 25.0)
   (check-equal? (calculate-tax 1000) 50.0)
   (check-equal? (calculate-tax 2500) 200.0)
   (check-equal? (calculate-tax 5000) 450.0)
   (check-equal? (calculate-tax 7500) 950.0)
   (check-equal? (calculate-tax 10000) 1450.0)))

(define (calculate-tax salary)
  (cond
    [(<= salary 1000) (* 0.05 salary)]
    [(<= salary 5000) (+ (* 0.05 1000) (* 0.1 (- salary 1000)))]
    [else (+ (* 0.05 1000)
             (* 0.10 4000)
             (* 0.20 (- salary 5000)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Teste ... -> Void
;; Executa um conjunto de testes.
(define (execute-tests . testes)
  (run-tests (test-suite "Todos os testes" testes))
  (void))

(execute-tests sorted?-tests
               filter-highest-element-tests
               calculate-tax-tests)
