;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rackunit)
(require rackunit/text-ui)

;; lista -> lista
;; retorna uma lista com todos elementos impares da lista "lst"
#;(define (lista-impares lst) empty)

(define lista-impares-testes
  (test-suite
   "lista-impares testes"
   (check-equal? (lista-impares empty) empty)
   (check-equal? (lista-impares (list 2 4)) empty)
   (check-equal? (lista-impares (list -1 1 3 19)) (list -1 1 3 19))
   (check-equal? (lista-impares (list 0 1 2 3 4 5)) (list 1 3 5))))

(define (executar-testes testes)
  (run-tests (test-suite "todos os testes" testes)))

(define (lista-impares lst)
  (cond
    [(empty? lst) empty]
    [(odd? (first lst)) (cons (first lst) (lista-impares (rest lst)))]
    [else (lista-impares (rest lst))]))

(executar-testes lista-impares-testes)