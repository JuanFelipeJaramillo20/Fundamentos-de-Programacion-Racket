;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicios Lista-numeros|) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; Autor: Juan Felipe Jaramillo
;; Fecha de creación: 8 de Agosto de 2020
;; Contrato: buscar-mayor: lista-de-numeros -> número
;; Propósito: Esta función recibe una lista de 5 números y retorna el mayor
;; Ejemplos: (buscar-mayor (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 empty))))), retorna 5
;; (buscar-mayor (cons 10 (cons 20 (cons 30 (cons 40 (cons 50 empty)))))), retorna 50
;; Definición
(define (buscar-mayor lista)
  (cond
    [(or (not (number? (first lista))) (not (number? (first (rest lista)))) (not (number? (first (rest (rest lista))))) (not (number? (first (rest (rest (rest lista))))))  (not (number? (first (rest (rest (rest (rest lista)))))))) (error "Lista inválida.") ]
    [ (and
       (> (first lista) (first (rest lista) ) )
       (> (first lista) (first (rest (rest lista))) )
       (> (first lista) (first (rest (rest (rest lista)))) )
       (> (first lista) (first (rest (rest (rest (rest lista)))))) )
         (first lista) ]
    [ (and
       (> (first (rest lista) ) (first lista ) )
       (> (first (rest lista) ) (first (rest (rest lista))) )
       (> (first (rest lista) ) (first (rest (rest (rest lista)))) )
       (> (first lista) (first (rest (rest (rest (rest lista)))))) )
         (first (rest lista) ) ]
    [ (and
       (> (first (rest (rest lista))) (first (rest lista) ) )
       (> (first (rest (rest lista))) (first lista ) )
       (> (first (rest (rest lista))) (first (rest (rest (rest lista)))) )
       (> (first (rest (rest lista))) (first (rest (rest (rest (rest lista)))))) )
        (first (rest (rest lista))) ]
    [ (and
       (> (first (rest (rest (rest lista)))) (first (rest lista) ) )
       (> (first (rest (rest (rest lista)))) (first lista ) )
       (> (first (rest (rest (rest lista)))) (first (rest (rest  lista))) )
       (> (first (rest (rest (rest lista)))) (first (rest (rest (rest (rest lista)))))) )
        (first (rest (rest (rest lista)))) ]
    [ (and
       (> (first (rest (rest (rest (rest lista))))) (first (rest lista) ) )
       (> (first (rest (rest (rest (rest lista))))) (first lista ) )
       (> (first (rest (rest (rest (rest lista))))) (first (rest (rest (rest lista)))) )
       (> (first (rest (rest (rest (rest lista))))) (first  (rest (rest lista)))) )
        (first (rest (rest (rest (rest lista))))) ]
    ) )





;; Pruebas:
(check-expect (buscar-mayor (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 empty)))))) 5 )
(check-expect (buscar-mayor (cons 10 (cons 20 (cons 30 (cons 40 (cons 50 empty)))))) 50 )