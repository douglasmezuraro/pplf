;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rackunit)
(require rackunit/text-ui)

;; número número número -> String
;; retorna o tipo de triângulo a partir dos parâmetros de entrada
#;(define (tipo-triangulo a b c) "")

(define tipo-triangulo-tests
  (test-suite
   "tipo triangulo tests"
   (check-equal? (tipo-triangulo 2 2 2) "equilátero")
   (check-equal? (tipo-triangulo 2 4 2) "isósceles")
   (check-equal? (tipo-triangulo 1 2 2) "isósceles")
   (check-equal? (tipo-triangulo 3 3 1) "isósceles")
   (check-equal? (tipo-triangulo 1 2 3) "escaleno")))

(define (execute-tests tests)
  (run-tests (test-suite "todos os testes" tests)))

(define (tipo-triangulo a b c)
  (cond
    [(= a b c) "equilátero"]
    [(= a b) "isósceles"]
    [(= a c) "isósceles"]
    [(= b c) "isósceles"]
    [else "escaleno"]))
