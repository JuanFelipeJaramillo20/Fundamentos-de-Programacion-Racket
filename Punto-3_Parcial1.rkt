;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Punto-3_Parcial1) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; Ya que cada tipo de comida tiene un precio, me pareció que el mejor desarrollo iba a ser encapsulando este valor en una variable.
;; Una estructura es innecesaria ya que una estructura de un solo valor derrotaría el sentido básico de las estructuras: agrupar varios valores en una sola variable.
(define precio-desayuno 5000)
(define precio-almuerzo 8000)
(define precio-comida 6000)

;; Autor: Juan Felipe Jaramillo Losada - 202060257
;; Fecha de creación: 15 de Agosto de 2020
;; Contrato: calcular-costo: símbolo, número -> número
;; Descripción o Propósito: Esta función recibe un pedido y una hora de pedido y de acuerdo a esto, retorna el precio total del pedido.
;; Ejemplos: (calcular-costo 'Desayuno 10), retorna 5000
;; (calcular-costo 'Desayuno 15), retorna 10000
;; (calcular-costo 'Almuerzo 9), retorna 16000
;; (calcular-costo 'Almuerzo 20), retorna 24000
;; (calcular-costo 'Almuerzo 12), retorna 8000
;; (calcular-costo 'Comida 10), retorna 24000
;; (calcular-costo 'Comida 22), retorna 6000
;; (calcular-costo 'EstoNoEsUnaComidaValida 22), retorna "Tipo de comida inválida. Por favor intente de nuevo."
;; (calcular-costo 'Desayuno 24), retorna "El restaurante está cerrado. Vuelva mas tarde."
;; Definición:
;; A continuación explico mi razonamiento y forma de resolver el problema en cada paso de la función:
(define (calcular-costo tipo-comida hora) ;; La funcion recibe el tipo de comida del pedido como símbolo ('Desayuno, 'Almuerzo o 'Comida) y la hora en la que se está haciendo el pedido
  (cond
    [ (and (>= hora 8) (<= hora 23) ) ;; Este condicional valida si la hora de hacer el pedido está dentro de las horas de servicio del restaurante. Si está, continua con la evaluación. Si no está, lanza un error. Es lo primero que evaluo ya que si la hora no es válida no hay necesidad de validar nada más
      (cond
        [ (symbol=? tipo-comida 'Desayuno) (cond  ;; Se valida si el plato pedido es un desayuno. Si lo es, evalúa la hora en la que se hace, si es después de las 11 aplica la penalización de precio. Si no, retorna el precio básico del desayuno
                                             [ (> hora 11) (* 2 precio-desayuno ) ]
                                             [ else precio-desayuno ]
                                             ) ]
        [ (symbol=? tipo-comida 'Almuerzo) (cond  ;; Se valida si el plato pedido es un almuerzo. Si lo es, evalúa la hora en la que se hace, si es después de las 16 o antes de las 10 aplica la penalización de precio correspondiente. Si no, retorna el precio básico del almuerzo
                                             [ (< hora 10) (* 2 precio-almuerzo) ]
                                             [ (> hora 16) (* 3 precio-almuerzo) ]
                                             [ else precio-almuerzo ]
                                             ) ]
        [ (symbol=? tipo-comida 'Comida) (cond  ;; Se valida si el plato pedido es una comida. Si lo es, evalúa la hora en la que se hace, si antes de las 16 se aplica la penalización de precio correspondiente. Si no, retorna el precio básico de la comida
                                           [ (< hora 16) (* 4 precio-comida) ]
                                           [ else precio-comida]
                                           ) ]
        [else (error "Tipo de comida inválida. Por favor intente de nuevo.") ]  ;; Si el plato comido no es ninguno de los tres tipos admitidos, lanza el error de tipo de comida inválida
        )]
    [else (error "El restaurante está cerrado. Vuelva mas tarde.") ]
    )
  )

(check-expect (calcular-costo 'Desayuno 10) 5000)
(check-expect (calcular-costo 'Desayuno 15) 10000)
(check-expect (calcular-costo 'Almuerzo 9) 16000)
(check-expect (calcular-costo 'Almuerzo 20) 24000)
(check-expect (calcular-costo 'Almuerzo 12) 8000)
(check-expect (calcular-costo 'Comida 10) 24000)
(check-expect (calcular-costo 'Comida 22) 6000)
(check-error (calcular-costo 'EstoNoEsUnaComidaValida 22) "Tipo de comida inválida. Por favor intente de nuevo." )
(check-error (calcular-costo 'Desayuno 24) "El restaurante está cerrado. Vuelva mas tarde." )