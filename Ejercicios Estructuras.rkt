;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicios Estructuras|) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
(define-struct pelicula (titulo productor))
(define-struct amigo (nombre edad color-pelo color-ojos))
(define-struct carro (marca color costo))
(define-struct anime (nombre genero))

(define pelicula1 (make-pelicula "Grown ups" "Dennis Dugan"))
(define pelicula2 (make-pelicula "Grown ups 2" "Dennis Dugan"))
(define pelicula3 (make-pelicula "John Wick" "Chad Staheski"))
(pelicula-titulo pelicula1)
(pelicula-productor pelicula2)
(pelicula-titulo pelicula3)


(define amigo1 (make-amigo "Juan" 25 "Castaño" "azul"))
(define amigo2 (make-amigo "Isabella" 20 "Castaño oscuro" "verde"))
(define amigo3 (make-amigo "Luisa" 20 "Castaño claro" "cafe"))
(amigo-nombre amigo1)
(amigo-edad amigo2)
(amigo-color-ojos amigo3)

(define carro1 (make-carro 'Toyota "Beige" 30000000))
(define carro2 (make-carro 'Chevrolet "Spark" 20000000))
(define carro3 (make-carro 'Audi "Q3" 110000000))
(carro-marca carro1)
(carro-color carro2)
(carro-costo carro3)

(define anime1 (make-anime "God of Higschool" 'Shonen))
(define anime2 (make-anime "Tower of God" 'Fantasía-Oscura))
(define anime3 (make-anime "Hellsing Ultimate" 'Accion))
(anime-nombre anime3)
(anime-genero anime1)
(anime-nombre anime2)

