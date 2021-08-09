;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicios Lista-simbolos|) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; Autor: Juan Felipe Jaramillo
;; Fecha de creación: 8 de Agosto de 2020
;; Contrato: busca-simbolo: lista-de-símbolos -> booleano
;; Propósito: Esta función recibe una lista de 5 simbolos y verifica si el símbolo está en la lista
;; Ejemplos: (buscar-simbolo (cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty))))) 'a), retorna #T
;; (cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty))))) 'h), retorna #F
;; Definición
(define (busca-simbolo lista simbolo)
  (cond
    [ (or
       (not (symbol? (first lista) ))
       (not (symbol? (first (rest lista)) ))
       (not (symbol? (first (rest (rest lista))) ))
       (not (symbol? (first (rest (rest (rest lista))))))
       (not (symbol? (first (rest (rest (rest (rest lista)))))))
       (not (symbol? simbolo))
       ) (error "Simbolo o lista inválido.")]
    [ (symbol=? (first lista) simbolo) #T]
    [ (symbol=? (first (rest lista)) simbolo) #T]
    [ (symbol=? (first (rest (rest lista))) simbolo) #T]
    [ (symbol=? (first (rest (rest (rest lista)))) simbolo) #T]
    [ (symbol=? (first (rest (rest (rest (rest lista))))) simbolo) #T]
    [ else #F]
    )
  )


;; Pruebas:
(check-expect (busca-simbolo (cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty))))) 'a) #T)
(check-expect (busca-simbolo (cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty))))) 'h) #F)