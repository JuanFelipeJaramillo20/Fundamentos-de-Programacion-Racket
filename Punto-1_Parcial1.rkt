;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Punto-1_Parcial1) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(define-struct salario-empleado (salario-basico bonificaciones prima-extralegal descuentos) )
;; Autor: Juan Felipe Jaramillo Losada - 202060257
;; Fecha de creación: 15 de Agosto de 2020
;; Contrato: calcular-salario: salario-empleado -> número
;; Descripción o Propósito: Esta función recibe los datos de salario de un empleado y retorna cuanto debe pagarle como total
;; Ejemplos: (calcular-salario salario1), retorna 3878.6
;; (calcular-salario salario2), retorna "El descuento no puede ser mayor al 40%. Por favor intente de nuevo."
;; (calcular-salario salario3), retorna 7757.2
;; Definición:
(define (calcular-salario salario-empleado)
  (cond
    [ (not (salario-empleado? salario-empleado)) (error "Entrada inválida. Por favor intente de nuevo.") ]
    [ (> (salario-empleado-descuentos salario-empleado) (* (salario-empleado-salario-basico salario-empleado) 0.6) ) (error "El descuento no puede ser mayor al 40%. Por favor intente de nuevo.") ]
    [ (<= (salario-empleado-descuentos salario-empleado) (* (salario-empleado-salario-basico salario-empleado) 0.6) )
      (* (- (+ (salario-empleado-salario-basico salario-empleado)
               (salario-empleado-bonificaciones salario-empleado)
               (salario-empleado-prima-extralegal salario-empleado))
            (salario-empleado-descuentos salario-empleado))
         0.946 )
      ]
    )
  )


(define salario1 (make-salario-empleado 3000 1000 200 100))
(define salario2 (make-salario-empleado 3000 1000 200 5000))
(define salario3 (make-salario-empleado 8000 2000 200 2000))
(define salario5 (make-salario-empleado 200000 40000 60000 5000))
(define salario6 (make-salario-empleado 600000 34000 54000 20000))
;; Pruebas:
(check-expect (calcular-salario salario1) 3878.6 )
(check-error (calcular-salario salario2) "El descuento no puede ser mayor al 40%. Por favor intente de nuevo." )
(check-expect (calcular-salario salario3) 7757.2 )
(check-expect (calcular-salario (make-salario-empleado 100000 20000 45000 20000)) 137170)
(check-error (calcular-salario "Esto no es un salario de empleado válido.") "Entrada inválida. Por favor intente de nuevo." )
(check-expect (calcular-salario salario6) 631928)
(check-expect (calcular-salario salario5) 279070)
