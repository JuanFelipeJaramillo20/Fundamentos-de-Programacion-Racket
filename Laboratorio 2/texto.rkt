;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname texto) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define (lista-a-string-aux lst)
  (cond
    [(null? lst) ""]
    [else (string-append (number->string (first lst)) " " (lista-a-string-aux (rest lst)))]))

(define (lista-a-string lsst)
  (cond
    [(null? lsst) ""] 
    [else (string-append (symbol->string (first lsst)) (symbol->string (second lsst)) (lista-a-string-aux (first lsst)) "\n" )]))

(define (producto-a-lista producto)
  (list (symbol->string (producto-codigo producto)) (symbol->string (producto-nombre producto)) (list (symbol->string (disponibilidad-precio (producto-disponibilidad producto)) ) (symbol->string (disponibilidad-unidades-disponibles (producto-disponibilidad producto)) )) )
  )

(define (listaproductos-a-listastring lista-productos)
  (cond
    [ (empty? lista-productos) "\n"]
    [else (list (producto-a-lista (first lista-productos) ) (listaproductos-a-listastring (rest lista-productos) ) ) ]
    )
  
  )