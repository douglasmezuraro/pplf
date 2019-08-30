;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rackunit)
(require rackunit/text-ui)

;; número número -> número
;; retorna o maior número a partir dos parâmetros da função
#;(define (maximo a b) 0)

(define maximo-testes
  (test-suite
   "maximo testes"
   (check-equal? (maximo 1 1) 1)
   (check-equal? (maximo 0 -2) 0)
   (check-equal? (maximo 4 1) 4)))

(define (executar-testes testes)
  (run-tests (test-suite "todos os testes" testes)))

(define (fun-for-maximo a b)
  (if (>= a b) a b))

(define (maximo a b)
  (if (>= a b) a b))

;; número número número -> número
;; retorna a soma dos quadrados dos dois maiores valores de entradas
#;(define(soma-quadrados-maiores a b c) 0)

(define soma-quadrados-testes
  (test-suite
   "soma-quadrados testes"
   (check-equal? (soma-quadrados-maiores 0 0 0) 0)
   (check-equal? (soma-quadrados-maiores 1 2 3) 13)
   (check-equal? (soma-quadrados-maiores 1 2 2) 8)
   (check-equal? (soma-quadrados-maiores 2 2 5) 29)))

(define (soma-quadrados-maiores a b c)
  (if (> a b)
      (+ (sqr a)
         (sqr (maximo b c)))
      (+ (sqr b)
         (sqr (maximo a c)))))

(executar-testes maximo-testes)
(executar-testes soma-quadrados-testes)