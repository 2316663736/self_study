(define (ascending? s)
  (define (biger-than num lis)
    (
      if
      (null? lis)
      #t
      (
        if
        (<= num (car lis))
        (biger-than (car lis) (cdr lis))
        #f
      )
    )
  )
  (if
    (null? s )
    #t
    (biger-than (car s) (cdr s))
  )
)

(define (my-filter pred s)
  (
    if
    (null? s)
    nil
    (
      append
      (
        if
        (pred (car s))
        (list (car s))
        nil
      )
      (my-filter pred (cdr s))
    )
  )
)

(define (interleave lst1 lst2)
  (
   cond
    ((null? lst1) lst2)
    ((null? lst2) lst1)
    (else (append (list (car lst1) (car lst2)) (interleave (cdr lst1) (cdr lst2))))
  )
)

(define (no-repeats s)
  (define (appear num lis)
    (if
      (null? lis)
      #f
      (
        if
        (= (car lis) num)
        #t
        (appear num (cdr lis))
      )
    )
  )
  (
    if
    (null? s)
    nil
     (
        let
        (
          (tems (no-repeats  (cdr s)))
          (n- (car s))
        )
       (
          if
          (appear n- tems)
          tems
          (append (list n-) tems)
      )
    )
  )
)
