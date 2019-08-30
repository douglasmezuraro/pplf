;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

;; lista -> lista
;; inverte os elementos da lista "lst"
#;(define (inverte lst) lst)

(define inverte-testes
  (test-suite
   "inverte testes"
   (check-equal? (inverte empty) empty)
   (check-equal? (inverte (list 0)) (list 0))
   (check-equal? (inverte (list 1 1)) (list 1 1))
   (check-equal? (inverte (list 1 2 3)) (list 3 2 1))
   (check-equal? (inverte (list 1 2 3 3 4 5)) (list 5 4 3 3 2 1))))

(define (inverte lst)
  (cond
    [(empty? lst) empty]
    [else (cons-fim (first lst) (inverte (rest lst)))]))


;; lista -> booleano
;; retorna se a lista "lst" é um palindromo
#;(define (palindromo lst) #f)

(define palindromo-testes
  (test-suite
   "palindromo testes"
   (check-equal? (palindromo empty) #t)
   (check-equal? (palindromo (list 0)) #t)
   (check-equal? (palindromo (list 0 1)) #f)
   (check-equal? (palindromo (list 0 0)) #t)
   (check-equal? (palindromo (list 0 1 0)) #t)
   (check-equal? (palindromo (list 0 1 1 0)) #t)
   (check-equal? (palindromo (list 1 2 3 2 1)) #t)))

(define (palindromo lst)
  (equal? lst (inverte lst)))

(executar-testes cons-fim-testes)
(executar-testes inverte-testes)
(executar-testes palindromo-testes)