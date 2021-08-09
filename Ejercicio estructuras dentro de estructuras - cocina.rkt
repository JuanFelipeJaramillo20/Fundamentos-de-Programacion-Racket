;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio estructuras dentro de estructuras - cocina|) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct cocina (refrigerador estufa licuadora horno))
(define-struct refrigerador (marca kwh))
(define-struct estufa (marca modelo kwh))
(define-struct licuadora (potencia kwh))
(define-struct horno (capacidad kwh))

;; Autor: Juan Felipe Jaramillo
;; Fecha de creación: 1 de Agosto de 2020
;; Contrato: gasto-total: cocina, número -> número
;; Propósito: Esta función retorna el gasto total de KW en la cocina
;; Ejemplos: (gasto-total-kwh cocinaA 5) 925
;; (gasto-total-kwh cocinaB 10) 4430
;; Definición:
(define (gasto-total-kwh cocina numeroHoras)
  (+
   (* (refrigerador-kwh (cocina-refrigerador cocina) ) numeroHoras)
   (* (estufa-kwh (cocina-estufa cocina) ) numeroHoras)
   (* (licuadora-kwh (cocina-licuadora cocina) ) numeroHoras)
   (* (horno-kwh (cocina-horno cocina) ) numeroHoras)
   ) )

;; Pruebas
(define cocinaA (make-cocina (make-refrigerador 'samsung 100) (make-estufa 'samsung 2020 25) (make-licuadora 0.5 10) (make-horno 25 50) ) )
(define cocinaB (make-cocina (make-refrigerador 'samsung 300) (make-estufa 'samsung 2010 45) (make-licuadora 2 60) (make-horno 10 38) ) )
(check-expect (gasto-total-kwh cocinaA 5) 925 )
(check-expect (gasto-total-kwh cocinaB 10) 4430 )


;; Autor: Juan Felipe Jaramillo
;; Fecha de creación: 1 de Agosto de 2020
;; Contrato: analizar-estufa: cocina -> símbolo
;; Propósito: Esta función aclara si una estufa es nueva o vieja de acuerdo a su modelo
;; Ejemplos: (analizar-estufa cocinaA) 'nueva
;; (analizar-estufa cocinaB) 'vieja
;; Definición:
(define (analizar-estufa cocina)
  (if (>= (estufa-modelo (cocina-estufa cocina) ) 2015 ) 'nueva 'vieja )
  )

(check-expect (analizar-estufa cocinaA) 'nueva)
(check-expect (analizar-estufa cocinaB) 'vieja)


;; Autor: Juan Felipe Jaramillo
;; Fecha de creación: 1 de Agosto de 2020
;; Contrato: mayor: cocina -> electrodoméstico
;; Propósito: Esta función retorna el electrodomestico que mas consume por hora en la cocina
;; Ejemplos: (mayor cocinaA) (make-refrigerador 'samsung 100)
;; (mayor cocinaB) (make-refrigerador 'samsung 300)
;; Definición:
(define (mayor cocina)
  (cond
    [ (and (> (refrigerador-kwh (cocina-refrigerador cocina) ) (estufa-kwh (cocina-estufa cocina) ) )
           (> (refrigerador-kwh (cocina-refrigerador cocina) ) (licuadora-kwh (cocina-licuadora cocina) ) )
           (> (refrigerador-kwh (cocina-refrigerador cocina) ) (horno-kwh (cocina-horno cocina) ) )
           ) (cocina-refrigerador cocina) ]
    [ (and (> (estufa-kwh (cocina-estufa cocina) ) (refrigerador-kwh (cocina-refrigerador cocina) ) )
           (> (estufa-kwh (cocina-estufa cocina) ) (licuadora-kwh (cocina-licuadora cocina) ) )
           (> (estufa-kwh (cocina-estufa cocina) ) (horno-kwh (cocina-horno cocina) ) )
           ) (cocina-estufa cocina) ]
    [ (and (> (licuadora-kwh (cocina-licuadora cocina) ) (estufa-kwh (cocina-estufa cocina) ) )
           (> (licuadora-kwh (cocina-licuadora cocina) ) (refrigerador-kwh (cocina-refrigerador cocina) ) )
           (> (licuadora-kwh (cocina-licuadora cocina) ) (horno-kwh (cocina-horno cocina) ) )
           ) (cocina-licuadora cocina) ]
    [ (and (> (horno-kwh (cocina-horno cocina) ) (estufa-kwh (cocina-estufa cocina) ) )
           (> (horno-kwh (cocina-horno cocina) ) (licuadora-kwh (cocina-licuadora cocina) ) )
           (> (horno-kwh (cocina-horno cocina) ) (refrigerador-kwh (cocina-refrigerador cocina) ) )
           ) (cocina-horno cocina) ]
    [else (error "Electrodoméstico inválido. Por favor intente de nuevo.") ]
    )
  )

;;Pruebas::
(check-expect (mayor cocinaA) (make-refrigerador 'samsung 100))
(check-expect (mayor cocinaB) (make-refrigerador 'samsung 300))