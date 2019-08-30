;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rackunit)
(require rackunit/text-ui)

;; elemento, lista -> booleano
;; retorna se o elemento "a" está contido na lista "lst"
;; (define (elemento-na-lista a lst) #f)

(define elemento-na-lista?-testes
  (test-suite
   "elemento-na-lista? testes"
   (check-equal? (elemento-na-lista? 1 empty) #f)
   (check-equal? (elemento-na-lista? 0 (list 1)) #f)
   (check-equal? (elemento-na-lista? 1 (list 0 1 2)) #t)
   (check-equal? (elemento-na-lista? 2 (list 1 3 5 7)) #f)
   (check-equal? (elemento-na-lista? 3 (list 1 3 5 7)) #t)))

(define (executar-testes testes)
  (run-tests (test-suite "Todos os testes" testes)))

(define (fun-for-elemento-na-lista? a lst)
  (cond
    [(empty? lst) #f]
    [(= a (first lst)) #t]
    [else (fun-for-elemento-na-lista? a (rest lst))]))

(define (elemento-na-lista? a lst)
  (cond
    [(empty? lst) #f]
    [(= a (first lst)) #t]
    [else (elemento-na-lista? a (rest lst))]))

(executar-testes elemento-na-lista?-testes)