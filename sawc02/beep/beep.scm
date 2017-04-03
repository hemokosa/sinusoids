(define make-sine
  (lambda (startime dur frequency amp phase)
    (let* (
           (beg (floor (* startime (srate))))
           (len (floor (* dur (srate))))
           (end (+ beg len))
           (hi (make-oscil frequency phase))
           (out-data (make-vct len))
           )
      (do ((i 0 (1+ i)))
          ((= i len))
        (vct-set! out-data i (* amp (oscil hi)))) ; end of do
      (insert-samples beg end out-data (selected-sound) (selected-channel))
      ); end of let
    ); end of lambda
); end of define

(define mix-sine
  (lambda (startime dur frequency amp phase)
    (let* (
           (beg (floor (* startime (srate))))
           (len (floor (* dur (srate))))
           (end (+ beg len))
           (hi (make-oscil frequency phase))
           (out-data (make-vct len))
           )
      (do ((i 0 (1+ i)))
          ((= i len))
        (vct-set! out-data i (* amp (oscil hi)))) ; end of do
      (mix-vct out-data beg (selected-sound) (selected-channel) #f 0)
      ); end of let
    ); end of lambda
); end of define

(define make-sine-env
  (lambda (startime dur frequency amp phase en)
    (let* (
           (beg (floor (* startime (srate))))
           (len (floor (* dur (srate))))
           (end (+ beg len))
           (hi (make-oscil frequency phase))
	   (e (make-env :envelope en :end (* dur (srate))))
           (out-data (make-vct len))
           )
      (do ((i 0 (1+ i)))
          ((= i len))
        (vct-set! out-data i (* amp (env e) (oscil hi)))) ; end of do
      (insert-samples beg end out-data (selected-sound) (selected-channel))
      ); end of let
    ); end of lambda
); end of define

(define mix-sine-env
  (lambda (startime dur frequency amp phase en)
    (let* (
           (beg (floor (* startime (srate))))
           (len (floor (* dur (srate))))
           (end (+ beg len))
           (hi (make-oscil frequency phase))
	   (e (make-env :envelope en :end (* dur (srate))))
           (out-data (make-vct len))
           )
      (do ((i 0 (1+ i)))
          ((= i len))
        (vct-set! out-data i (* amp (env e) (oscil hi)))) ; end of do
      (mix-vct out-data beg (selected-sound) (selected-channel) #f 0)
      ); end of let
    ); end of lambda
); end of define

(define fib
  (lambda (n)
    (cond ((= n 1) 1)
	  ((= n 2) 1)
	  ( t (+ (fib (- n 1))
		 (fib (- n 2)))
	  )
    )
  )
)

(define (fibsine n)
  (do ((i 0 (1+ i)))
      ((= i n))
    (make-sine 0 (/ 1.0 n) (fib (+ i 1)) 0.8 0)
  )
)

(define fibsine2 
  (lambda (n)
    (do ((i 0 (1+ i)))
	((= i n))
      (make-sine 0 (/ 1.0 n) (fib (+ i 1)) 0.8 0)
    )
  )
)

(define (fibmix n)
  (do ((i 0 (1+ i)))
      ((= i n))
    (mix-sine 0 1.0 (fib (+ i 1)) (/ 0.8 n) 0)
  )
)

(define fibmix2
  (lambda (n)
    (do ((i 0 (1+ i)))
	((= i n))
      (mix-sine 0 1.0 (fib (+ i 1)) (/ 0.8 n) 0)
    )
  )
)

(define (make-randsine startime dur frequency amp phase)
  (make-sine 
   (+ startime (random dur)); startime
   (random dur); duration
   (random frequency); frequency
   (* amp (random 1.0)); amp
   (random 6.283184); phase
  )
)

(define (make-randsine2 startime dur frequency amp phase)
  (make-sine 
   (+ startime (random dur)); startime
   (random dur); duration
   frequency; frequency
   (* amp (random 1.0)); amp
   (random 6.283184); phase
  )
)

(define (mix-randsine startime dur frequency amp phase)
  (mix-sine 
   (+ startime (random dur)); startime
   (random dur); duration
   (random frequency); frequency
   (* amp (random 1.0)); amp
   (random 6.283184); phase
  )
)

(define (mix-randsine2 startime dur frequency amp phase)
  (mix-sine 
   (+ startime (random dur)); startime
   (random dur); duration
   frequency; frequency
   (* amp (random 1.0)); amp
   (random 6.283184); phase
  )
)

(define (fibrandsine n)
  (do ((i 0 (1+ i)))
      ((= i n))
    (make-randsine2 0 (/ 1.0 n) (fib (+ i 1)) 0.8 0)
  )
)

(define (fibrandmix n)
  (do ((i 0 (1+ i)))
      ((= i n))
    (mix-randsine2 0 0.5 (fib (+ i 1)) (/ 0.8 n) 0)
  )
)

(define (randsine n)
  (do ((i 0 (1+ i)))
      ((= i n))
    (make-randsine 0 (/ 1.0 n) 20000.0 0.8 0)
  )
)

(define (randmix n)
  (do ((i 0 (1+ i)))
      ((= i n))
    (mix-randsine 0 0.5 20000.0 (/ 0.8 n) 0)
  )
)

(define make-sine-stereo
  (lambda (startime dur freq-ri freq-le amp-ri amp-le phase-ri phase-le)
    (let* (
           (beg (floor (* startime (srate))))
           (len (floor (* dur (srate))))
           (end (+ beg len))
           (ri (make-oscil freq-ri phase-ri))
           (le (make-oscil freq-le phase-le))
           (out-data-ri (make-vct len))
           (out-data-le (make-vct len))
           )
      (do ((i 0 (1+ i)))
          ((= i len))
        (vct-set! out-data-ri i (* amp-ri (oscil ri)))
        (vct-set! out-data-le i (* amp-le (oscil le)))
        ) ; end of do
      (insert-samples beg end out-data-ri (selected-sound) 0)
      (insert-samples beg end out-data-le (selected-sound) 1)
      ); end of let
    ); end of lambda
); end of define


(define (make-rand-lohi startime dur)
  (make-sine-stereo
   startime
   dur
   (random 50.0); freq-ri
   (+ 5000.0 (random 5000.0)); freq-le
   (random 0.8); amp-ri
   (random 0.8); amp-le
   (random 6.283184); phase-ri
   (random 6.283184); phase-le
  )
)

(define (make-rand-hilo startime dur)
  (make-sine-stereo
   startime
   dur
   (+ 5000.0 (random 5000.0)); freq-ri
   (random 50.0); freq-le
   (random 0.8); amp-ri
   (random 0.8); amp-le
   (random 6.283184); phase-ri
   (random 6.283184); phase-le
  )
)

(define (randhilo n)
  (do ((i 0 (1+ i)))
      ((= i n))
    (make-rand-lohi 0 (/ 0.5 n))
    (make-rand-hilo 0 (/ 0.5 n))
  )
)

(define (make-rand-hi startime dur)
  (make-sine-stereo
   startime
   dur
   (+ 10000.0 (random 10000.0)); freq-ri
   (+ 10000.0 (random 10000.0)); freq-le
   0.8; amp-ri
   0.8; amp-le
   0.0; phase-ri
   0.0; phase-le
  )
)

(define (randhi n)
  (do ((i 0 (1+ i)))
      ((= i n))
    (make-rand-hi 0 (/ 1.0 n))
  )
)

(define (make-rand-zerohi startime dur)
  (make-sine-stereo
   startime
   dur
   0.0; freq-ri
   (+ 10000.0 (random 10000.0)); freq-le
   0.8; amp-ri
   0.8; amp-le
   0.0; phase-ri
   0.0; phase-le
  )
)

(define (make-rand-hizero startime dur)
  (make-sine-stereo
   startime
   dur
   (+ 10000.0 (random 10000.0)); freq-ri
   0.0; freq-le
   0.8; amp-ri
   0.8; amp-le
   0.0; phase-ri
   0.0; phase-le
  )
)

(define (randhizero n)
  (do ((i 0 (1+ i)))
      ((= i n))
    (make-rand-zerohi 0 (/ 0.5 n))
    (make-rand-hizero 0 (/ 0.5 n))
  )
)

