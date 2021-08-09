;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio estructuras salarios profesores|) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct profesor-planta (salario-base apoyo-trabajo gastos-representacion) )
(define-struct profesor-voluntario (salario-base apoyo-transporte) )
(define-struct profesor-por-horas (horas-trabajadas valor-hora) )
(define-struct salario (salarioTotal descuentoSalud descuentoPension descuentoARP salarioDevengado) )

(define (calcular-salario profesor)
  (cond
    [ (profesor-planta? profesor) (make-salario
                                   (calcularSalarioProfesorPlanta (profesor-planta-salario-base profesor)
                                                                  (profesor-planta-apoyo-trabajo profesor)
                                                                  (profesor-planta-gastos-representacion profesor
                                                                                                  ) )
                                   (* (calcularSalarioProfesorPlanta (profesor-planta-salario-base profesor)
                                                                  (profesor-planta-apoyo-trabajo profesor)
                                                                  (profesor-planta-gastos-representacion profesor
                                                                                                  ) ) 0.05)
                                   (* (calcularSalarioProfesorPlanta (profesor-planta-salario-base profesor)
                                                                  (profesor-planta-apoyo-trabajo profesor)
                                                                  (profesor-planta-gastos-representacion profesor
                                                                                                  ) ) 0.064)
                                   (* (calcularSalarioProfesorPlanta (profesor-planta-salario-base profesor)
                                                                  (profesor-planta-apoyo-trabajo profesor)
                                                                  (profesor-planta-gastos-representacion profesor
                                                                                                  ) ) 0.02)
                                   (* (calcularSalarioProfesorPlanta (profesor-planta-salario-base profesor)
                                                                  (profesor-planta-apoyo-trabajo profesor)
                                                                  (profesor-planta-gastos-representacion profesor
                                                                                                  ) ) 0.866)
                                   ) ]
    [ (profesor-voluntario? profesor) (make-salario
                                       (calcularSalarioProfesorVoluntario (profesor-voluntario-salario-base profesor)
                                                                          (profesor-voluntario-apoyo-transporte profesor))
                                       (* (calcularSalarioProfesorVoluntario (profesor-voluntario-salario-base profesor)
                                                                          (profesor-voluntario-apoyo-transporte profesor)) 0.05 )
                                       (* (calcularSalarioProfesorVoluntario (profesor-voluntario-salario-base profesor)
                                                                          (profesor-voluntario-apoyo-transporte profesor)) 0.064 )
                                       (* (calcularSalarioProfesorVoluntario (profesor-voluntario-salario-base profesor)
                                                                          (profesor-voluntario-apoyo-transporte profesor)) 0.02 )
                                       (* (calcularSalarioProfesorVoluntario (profesor-voluntario-salario-base profesor)
                                                                          (profesor-voluntario-apoyo-transporte profesor)) 0.866 )
                                       ) ]
    [ (profesor-por-horas? profesor) (make-salario (calcularSalarioProfesorPorHoras (profesor-por-horas-horas-trabajadas profesor)
                                                                                    (profesor-por-horas-valor-hora profesor) )
                                                   (* (calcularSalarioProfesorPorHoras (profesor-por-horas-horas-trabajadas profesor)
                                                                                    (profesor-por-horas-valor-hora profesor) ) 0.05 )
                                                   (* (calcularSalarioProfesorPorHoras (profesor-por-horas-horas-trabajadas profesor)
                                                                                    (profesor-por-horas-valor-hora profesor) ) 0.064 )
                                                   (* (calcularSalarioProfesorPorHoras (profesor-por-horas-horas-trabajadas profesor)
                                                                                    (profesor-por-horas-valor-hora profesor) ) 0.02 )
                                                   (* (calcularSalarioProfesorPorHoras (profesor-por-horas-horas-trabajadas profesor)
                                                                                    (profesor-por-horas-valor-hora profesor) ) 0.866 )
                                                   ) ]
    [ else (error "Tipo de profesor inválido, intente de nuevo") ])
  )

(define (calcularSalarioProfesorPlanta a b c) (+ a b c) )
(define (calcularSalarioProfesorVoluntario a b) (+ a b) )
(define (calcularSalarioProfesorPorHoras a b) (* a b) )

(define profesor1 (make-profesor-planta 3000000 1000000 800000))
(define profesor2 (make-profesor-voluntario 2000000 1500000))
(define profesor3 (make-profesor-por-horas 80 25000 ))
(define profesor4 (make-profesor-planta 4000000 500000 2500000))

(calcular-salario profesor1)
(calcular-salario profesor2)
(calcular-salario profesor3)
(calcular-salario profesor4)