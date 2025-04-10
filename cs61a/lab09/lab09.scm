(define (over-or-under num1 num2) (cond  (
                                            (< num1 num2)   (print -1))
                                            ((= num1 num2)  (print 0) )
                                            ( else          (print 1) )
                                          )
                                  )

(define (make-adder num) (lambda (inc) (+ inc num)))

(define (composed f g) (lambda (num) (f (g num))))

(define (repeat f n)   ( lambda (num) (if (> n 1) (f( (repeat f (- n 1)) num )) (f num) )))

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) (cond
                    ((= a b) (print a))
                    ((> a b) (gcd (- a b ) b))
                    (else  ( gcd a (- b a)))
                    ))
