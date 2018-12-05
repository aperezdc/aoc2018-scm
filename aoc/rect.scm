; vim:ft=scheme:

(define-record-type Rect
                    (rect x y w h)
                    rect?
                    (x rect-x)
                    (y rect-y)
                    (w rect-w)
                    (h rect-h))

; Convenience (left, right, top, bottom) accessors.
;
(define (rect-r r)
  (assume '(rect? r))
  (+ (rect-x r) (rect-w r)))

(define (rect-b r)
  (assume (rect? r))
  (+ (rect-y r) (rect-h r)))

(define (rect-l r)
  (assume (rect? r))
  (+ 1 (rect-x r)))

(define (rect-t r)
  (assume (rect? r))
  (+ 1 (rect-y r)))

; Calculate area of a rectangle.
;
(define (rect-area r)
  (assume (rect? r))
  (* (rect-w r) (rect-h r)))

; Do two rectangles intersect?
;
(define (rect-intersect? r o)
  (assume (rect? r))
  (assume (rect? o))
  (not (or (> (rect-l o) (rect-r r))
           (< (rect-r o) (rect-l r))
           (> (rect-t o) (rect-b r))
           (< (rect-b o) (rect-t r)))))

; Find the intersection rectangle.
;
(define (rect-intersection r o)
  (assume (rect? r))
  (assume (rect? o))
  (let ((h (sort! (list (rect-l r) (rect-r r) (rect-l o) (rect-r o)) <))
        (v (sort! (list (rect-t r) (rect-b r) (rect-t o) (rect-b o)) <)))
    (rect (car h)
          (car v)
          (- (cadr h) (car h))
          (- (cadr v) (car v)))))
