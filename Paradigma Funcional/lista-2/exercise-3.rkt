;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rackunit)
(require rackunit/text-ui)

;; lista, número -> list
;; retorna a lista "lst" com o número "a" no final
#;(define (cons-fim a lst) (list a))

(define cons-fim-testes
  (test-suite
   "cons-fim testes"
   (check-equal? (cons-fim 0 empty) (list 0))
   (check-equal? (cons-fim 1 (list 0)) (list 0 1))
   (check-equal? (cons-fim 3 (list 5 2 8)) (list 5 2 8 3))))

(define (executar-testes testes)
  (run-tests (test-suite "todos os testes" testes)))

(define (cons-fim a lst)
  (cond
    [(empty? lst) (list a)]
    [else (cons (first lst)
                (cons-fim a (rest lst)))]))

(executar-testes cons-fim-testes)