;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicios Recursion|) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(define-struct producto (codigo nombre precio unidades))

(define (consultar-producto lista-productos identificador)
  (cond
    [ (empty? lista-productos) #F ]
    [ (symbol=? identificador (producto-codigo (first lista-productos)) ) #T ]
    [ else (consultar-producto (rest lista-productos) identificador) ]
    )
  )

(define (adicionar-producto lista-productos producto)
  (cond
    [ (symbol=? (producto-codigo producto) (producto-codigo (first lista-productos) ) ) () ]
    []
    []
    []
   )
  )