;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio Estructuras Salarios|) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct senador (salario-base gastos-representacion prima-mensual))
(define-struct representante (salario-base apoyo-gasolina gastos-representacion prima-mensual))

(define (descuento-retefuente integrante-congreso)
  (cond
    [ (senador? integrante-congreso) (- (calcular-salario-senador
                                         (senador-salario-base integrante-congreso)
                                         (senador-gastos-representacion integrante-congreso)
                                         (senador-prima-mensual integrante-congreso) )
                                        (* (calcular-salario-senador
                                            (senador-salario-base integrante-congreso)
                                            (senador-gastos-representacion integrante-congreso)
                                            (senador-prima-mensual integrante-congreso) ) 0.12)
                                        ) ]
    [ (representante? integrante-congreso) (- (calcular-salario-representante
                                               (representante-apoyo-gasolina integrante-congreso)
                                               (representante-gastos-representacion integrante-congreso)
                                               (representante-prima-mensual integrante-congreso)
                                               (representante-salario-base integrante-congreso))
                                              (* (calcular-salario-representante
                                                  (representante-apoyo-gasolina integrante-congreso)
                                                  (representante-gastos-representacion integrante-congreso)
                                                  (representante-prima-mensual integrante-congreso)
                                                  (representante-salario-base integrante-congreso)) 0.12)
                                              ) ]
    [ else (error "Tipo de integrante incorrecto. Por favor intente de nuevo.") ]
    )
  )

(define (calcular-salario-senador a b c) (+ a b c))
(define (calcular-salario-representante a b c d) (+ a b c d) )

(define petro (make-senador 45000000 300000 8000000))
(define estebanQuito (make-representante 30000000 3000000 20000000 5000000))
(descuento-retefuente petro)
(descuento-retefuente estebanQuito)