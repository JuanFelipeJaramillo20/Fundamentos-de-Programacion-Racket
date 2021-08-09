;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio Monitoria Estructuras (Computadores)|) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct computador (marca modelo precio color) )

(define computador1 (make-computador "Msi" "GP62MVR 6RF Leopard Pro" 6000000 "Negro"))
(define computador2 (make-computador "Dell" "L35" 3000000 "Azul"))
(define computador3 (make-computador "HP" "Pavillion 15" 2500000 "Plata"))

(define (descuento computador)
  (cond
    [(equal? (computador-color computador) "Negro") (- (computador-precio computador) (* (computador-precio computador) 0.1)) ]
    [else "No hay descuento."]
    ) )

(define (mayor-precio computador1 computador2 computador3)
  (cond
    [ (and (> (computador-precio computador1) (computador-precio computador2)) (> (computador-precio computador1) (computador-precio computador3)) ) computador1 ]
    [ (and (> (computador-precio computador2) (computador-precio computador1)) (> (computador-precio computador2) (computador-precio computador3)) ) computador2 ]
    [ (and (> (computador-precio computador3) (computador-precio computador1)) (> (computador-precio computador3) (computador-precio computador2)) ) computador3]
    [ else (error "Llorinder")]
    )
  )

(descuento computador1)
(mayor-precio computador1 computador2 computador3)