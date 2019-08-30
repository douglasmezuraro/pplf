;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

(executar-testes maximo-testes)