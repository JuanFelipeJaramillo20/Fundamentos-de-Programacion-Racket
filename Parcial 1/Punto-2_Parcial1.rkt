;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Punto-2_Parcial1) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(define-struct cancion-individual (nombre numero-minutos costo-minuto))
(define-struct sencillo (nombre costo-total))
(define-struct recompilacion (nombre numero-albumes minutos-por-album costo-minuto))
;; Autor: Juan Felipe Jaramillo Losada - 202060257
;; Fecha de creación: 15 de Agosto de 2020
;; Contrato: cobrar-canciones: estructura-producto, número -> número
;; Descripción o Propósito: Esta función recibe los datos de un producto y el número de productos a comprar y retorna cuanto debe pagarse como total.
;; Ejemplos: (cobrar-canciones sencillo1 1), retorna 330000
;; (cobrar-canciones cancion-individual1 1), retorna 1428000
;; (cobrar-canciones recompilacion1 1), retorna 595000000
;; (cobrar-canciones sencillo1 2), retorna 714000
;; (cobrar-canciones cancion-individual1 5), retorna 7140000
;; (cobrar-canciones recompilacion1 10), retorna 5950000000
;; (cobrar-canciones "Esto NO es una estructura" 10), retorna "Tipo de producto inválido. Por favor intente de nuevo."
;; Definición:
(define (cobrar-canciones producto numero-productos-acomprar)
  (cond
    [ (cancion-individual? producto) (impuesto (* (* (cancion-individual-numero-minutos producto) (cancion-individual-costo-minuto producto)) numero-productos-acomprar) ) ]
    [ (sencillo? producto) (impuesto (* (sencillo-costo-total producto) numero-productos-acomprar )) ]
    [ (recompilacion? producto) (impuesto (* (* (recompilacion-numero-albumes producto) (recompilacion-minutos-por-album producto) (recompilacion-costo-minuto producto)) numero-productos-acomprar)) ]
    [else (error "Tipo de producto inválido. Por favor intente de nuevo.") ]
    )
  )

(define (impuesto valor)
  (cond
    [ (< valor 500000) (* valor 1.1) ]
    [ (>= valor 500000) (* valor 1.19) ]
    )
  )

(define sencillo1 (make-sencillo "Leave it all behind you" 300000))
(define cancion-individual1 (make-cancion-individual "I'll be your contradiction" 3 400000))
(define recompilacion1 (make-recompilacion "Music to be Murdered By" 5 100 1000000))

;; Pruebas:
(check-expect (cobrar-canciones sencillo1 1) 330000)
(check-expect (cobrar-canciones cancion-individual1 1) 1428000)
(check-expect (cobrar-canciones recompilacion1 1) 595000000)
(check-expect (cobrar-canciones sencillo1 2) 714000)
(check-expect (cobrar-canciones cancion-individual1 5) 7140000)
(check-expect (cobrar-canciones recompilacion1 10) 5950000000)
(check-error (cobrar-canciones "Esto NO es una estructura" 10) "Tipo de producto inválido. Por favor intente de nuevo.")