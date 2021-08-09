;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejemplos dibujo en Racket|) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(start 600 600)

(draw-circle (make-posn 300 300) 50 'red)

(draw-solid-disk (make-posn 50 50) 100 'blue)

(draw-solid-rect (make-posn 450 450) 30 40 'cyan)

(draw-solid-line (make-posn 250 0) (make-posn 340 340) 'blue)

(draw-solid-string (make-posn 100 100) "Hola mundo")