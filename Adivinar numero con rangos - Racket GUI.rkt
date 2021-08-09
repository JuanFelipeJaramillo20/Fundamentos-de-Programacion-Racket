;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Adivinar numero con rangos - Racket GUI|) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
(define (funcionPrincipal a b)
  (cond
    [ (= (calcularDiferencia a b) 0) 'Iguales ]
    [ (and (> (calcularDiferencia a b) 0) (< (calcularDiferencia a b)  10) ) '10-o-menos ]
    [ (and (>= (calcularDiferencia a b) 10) (< (calcularDiferencia a b)  20) ) 'Entre-10-y-20 ]
    [ (and (>= (calcularDiferencia a b) 20) (< (calcularDiferencia a b)  30) ) 'Entre-20-y-30 ]
    [ (and (>= (calcularDiferencia a b) 30) (< (calcularDiferencia a b)  40) ) 'Entre-30-y-40 ]
    [ (and (>= (calcularDiferencia a b) 40) (< (calcularDiferencia a b)  50) ) 'Entre-40-y-50 ]
    [ (and (>= (calcularDiferencia a b) 50) (< (calcularDiferencia a b)  60) ) 'Entre-50-y-60 ]
    [ (and (>= (calcularDiferencia a b) 60) (< (calcularDiferencia a b)  70) ) 'Entre-60-y-70 ]
    [ (and (>= (calcularDiferencia a b) 70) (< (calcularDiferencia a b)  80) ) 'Entre-70-y-80 ]
    [ (and (>= (calcularDiferencia a b) 80) (< (calcularDiferencia a b)  90) ) 'Entre-80-y-90 ]
    [ (and (>= (calcularDiferencia a b) 90) (< (calcularDiferencia a b)  100) ) 'Entre-90-y-100 ]
    [ (and (>= (calcularDiferencia a b) 100) (< (calcularDiferencia a b)  500) ) 'Entre-100-y-500 ]
    [ (and (>= (calcularDiferencia a b) 500) (< (calcularDiferencia a b)  1000) ) 'Entre-500-y-1000 ]
    [ (and (>= (calcularDiferencia a b) 1000) (< (calcularDiferencia a b)  2000) ) 'Entre-1000-y-2000 ]
    [ (and (>= (calcularDiferencia a b) 2000) (< (calcularDiferencia a b)  3000) ) 'Entre-2000-y-3000 ]
    [ (and (>= (calcularDiferencia a b) 3000) (< (calcularDiferencia a b)  4000) ) 'Entre-3000-y-4000 ]
    [ (and (>= (calcularDiferencia a b) 4000) (< (calcularDiferencia a b)  5000) ) 'Entre-4000-y-5000 ]
    [ (and (>= (calcularDiferencia a b) 5000) (< (calcularDiferencia a b)  6000) ) 'Entre-5000-y-6000 ]
    [ (and (>= (calcularDiferencia a b) 6000) (< (calcularDiferencia a b)  7000) ) 'Entre-6000-y-7000 ]
    [ (and (>= (calcularDiferencia a b) 7000) (< (calcularDiferencia a b)  8000) ) 'Entre-7000-y-8000 ]
    [ (and (>= (calcularDiferencia a b) 8000) (< (calcularDiferencia a b)  9000) ) 'Entre-8000-y-9000 ]
    [ (and (>= (calcularDiferencia a b) 9000) (< (calcularDiferencia a b)  10000) ) 'Entre-9000-y-10000 ]
    [ (and (>= (calcularDiferencia a b) 10000) (< (calcularDiferencia a b)  20000) ) 'Entre-10000-y-20000 ]
    [ (and (>= (calcularDiferencia a b) 20000) (< (calcularDiferencia a b)  30000) ) 'Entre-20000-y-30000 ]
    [ (and (>= (calcularDiferencia a b) 30000) (< (calcularDiferencia a b)  40000) ) 'Entre-30000-y-40000 ]
    [ (and (>= (calcularDiferencia a b) 40000) (< (calcularDiferencia a b)  50000) ) 'Entre-40000-y-50000 ]
    [ (and (>= (calcularDiferencia a b) 50000) (< (calcularDiferencia a b)  60000) ) 'Entre-50000-y-60000 ]
    [ (and (>= (calcularDiferencia a b) 60000) (< (calcularDiferencia a b)  70000) ) 'Entre-60000-y-70000 ]
    [ (and (>= (calcularDiferencia a b) 70000) (< (calcularDiferencia a b)  80000) ) 'Entre-70000-y-80000 ]
    [ (and (>= (calcularDiferencia a b) 80000) (< (calcularDiferencia a b)  80000) ) 'Entre-80000-y-90000 ]
    [ (and (>= (calcularDiferencia a b) 90000) (< (calcularDiferencia a b)  99999) ) 'Entre-90000-y-99999 ]
    
    ) )

(define (calcularDiferencia a b) (abs (- a b) ) )

(guess-with-gui funcionPrincipal)

