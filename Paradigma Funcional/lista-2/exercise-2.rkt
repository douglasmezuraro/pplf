;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rackunit)
(require rackunit/text-ui)

;; lista, número->lista
;; retorna uma lista sem a ocorrências do número "x"
#;(define (remove-todos lst x) empty)

(define remove-todos-testes
  (test-suite
   "remove-todos teste"
   (check-equal? (remove-todos empty 0) empty)
   (check-equal? (remove-todos (list 0 1 2 3) 4) (list 0 1 2 3))
   (check-equal? (remove-todos (list 0 2 4 6 8) 2) (list 0 4 6 8))
   (check-equal? (remove-todos (list 3 2 3 5 8 3) 3) (list 2 5 8))))

(define (executar-testes testes)
  (run-tests (test-suite "todos os testes" testes)))

(define (remove-todos lst x)
  (cond
    [(empty? lst) empty]
    [(= x (first lst)) (remove-todos (rest lst) x)]
    [else (cons (first lst) (remove-todos (rest lst) x))]))

(executar-testes remove-todos-testes)

