(use-modules (ice-9 rdelim))

;; Определить "Константу"
(define *my_name* "Andrew")
;; Функии
;; Через лямду
(define cube (lambda (x) (* x x x)))
;; Синтаксический сахар
(define (my_add x y) (+ x y))

;; Условные выражения
;; IF
(define (check_age x)
  (if (> x 18) 1 0))

;; cond
(define (tt x)
  (cond
   ((< x 0) "Low")
   ((= x 0) "Zero")
   (else    "Ok")))

;; Хвостовая рекурсия
(define (fact n)
  (define (go acc n')
    (if (= n' 0) acc
	(go (* n' acc) (- n' 1))))
  (go 1 n))

;; Lists
(define arr1 '(1 2 3))
(define arr2 (list 2 3 4))

(define arr3 (cons 0 arr1)) ; (0:arr1)
(define head (car arr1))
(define tail (cdr arr1))

(define arr4 (append arr1 arr2))
(define val1 (list-ref arr1 0))

;; Предикаты заканчваются на ?
(display (null? arr2)) ; #t / #f

;; Структуры
(define user
  (cons "Andrew"
	(cons 24
	      (cons "SPB" '()))))

(define (name usr) (car usr))
(define (age usr) (car (cdr usr)))
(define (city usr) (car (cdr (cdr usr))))

;; Локальные алифсы
;; let - локальные переменные для следующих команд
(define ok1
  (let ((a 10)
	(b 12))
    (+ a b)))
;; let* - означает что все следующие определения будут видет преведущие
;; Например b увидит a
(define ok2
  (let* ((a 10)
	 (b (* 12 a)))
    (+ a b)))

;; IO
(display "Hello, world!")
(newline)
(display (+ 1 2))
(newline)

(define (mn)
  (let ((name1 (read-line)))
    (begin (display name1) (newline))))


