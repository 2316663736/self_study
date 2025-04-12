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

(define (interleave lst1 lst2) 'YOUR-CODE-HERE)

(define (no-repeats s) 'YOUR-CODE-HERE)
