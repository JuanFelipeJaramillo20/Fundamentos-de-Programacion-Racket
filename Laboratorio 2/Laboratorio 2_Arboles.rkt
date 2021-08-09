;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Laboratorio 2_Arboles|) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct arbol (valor izq der))

(define arbolprueba1 (make-arbol 20
            (make-arbol 10
                  empty
                  (make-arbol 7 empty empty) )
            (make-arbol 24
                        (make-arbol 22 empty empty)
                        (make-arbol 30 empty empty) )
            ))

(define arbolprueba2 (make-arbol 20
            (make-arbol 10
                  empty
                  (make-arbol 7 empty empty) )
            (make-arbol 24
                        (make-arbol 22 empty empty)
                        (make-arbol 30 empty empty) )
            ))

(define (comparar-arboles arbol1 arbol2)
  (comparar-listas (recorrido-inorden arbol1) (recorrido-inorden arbol2) )
  )

(define (recorrido-inorden arb)
  (cond
    [(null? arb) '()]
    [else
      (append
       (recorrido-inorden  (arbol-izq arb))
       (cons (arbol-valor arb) empty)
       (recorrido-inorden  (arbol-der arb)))
     ]
    ))



(define (comparar-listas lista1 lista2)
  (cond
    [ (or (and (empty? lista1) (not (empty? lista2)) ) (and (not (empty? lista1)) (empty? lista2) ) ) #F]
    [ (and (empty? lista1) (empty? lista2) ) #T]
    [ (equal? (first lista1) (first lista2) ) (comparar-listas (rest lista1) (rest lista2) )]
    [else #F]
    )
  )



(define (esta-en-arbol arbol lista)
  (local
    ((define (esta-en-lista lista1 lista2)
  (cond
    [ (empty? lista2) #T ]
    [ (empty? lista1) #F ]
    [ (empty? (first lista1)) (esta-en-lista (rest lista1) lista2) ]
    [ (not (empty? (first lista1))) (cond
                                      [(= (first lista1) (first lista2) ) (esta-en-lista (recorrido-inorden arbol) (rest lista2))]
                                      [else (esta-en-lista (rest lista1) lista2 ) ]) ]
    
    [else (esta-en-lista (rest lista1) lista2 ) ]
    )
  ))
    
  (esta-en-lista (recorrido-inorden arbol) lista)
  ))

(esta-en-arbol arbolprueba1 (list 20 10 7 24 22 30))