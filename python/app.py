# Переменные

# str
var = 'hello world'

# Строки
var = 'hel' + 'lo'
var = 'double' * 2

# int
a = 12

# Математика
var = 10 % 2
var = 10 // 2
var = 10 ** 2


# float
b = 1.43

# bool
flag = True
flag = False

# Перевод типа переменной
result = float(a)
result = int(a)
result = str(a)
result = bool(a)

# Определить несколько переменных
a, b = 0, 1
a, b = [0, 1]

a = b = 10

# Размер переменной
a = var.__sizeof__()



# Массивы
arr = [ 'Andrey', 'Vitya', 10 ]

arr = [
	a + b
	for a in 'list' if a != 'l'
	for b in 'vars' if a != 'a'
]

cars = [ 'Mazda', 'Toyota' ]

print(cars[0])
print(cars[-1])

print(cars[2:3:])
print(cars[1:-1:1])
print(cars[::-1])
print(cars[::2])

# Кортеж
cort = ( 1 , 2, 234, 'str' )

# Cловарь
word = { 'name': 'Andrey', 'age': 17 }

word = { a: a ** 2 for a in range(1, 7) }

word = dict ([('name', 'Andrew'),('age', 17)])
word = dict.fromkeys (['a', 'b'], 1)

print(word['name'])

print(word.values())
print(word.keys())



# Удаление переменной
del arr

# Ввод с клавиатуры
name = input('Ваше имя: ')
# Вывод на экран без перевода строка
print('hello, ' + name, end='')
# Вывод на экран с переводом строки
print('hello, ' + name)

# Условия
if name == 'Andrew':
    print('You Andrew')
elif name == 'Vitya':
    print('You Vitya')
else:
    print('Invalid name')

# Циклы
for car in cars:
	print(car)
	if var == 1:
		break
	elif var == 1:
		continue
else:
	print('Цикл не сломан')

while a > 1:
	print(a)
	a += 1
	if var == 1:
		break
	elif var == 1:
		continue
else:
	print('Цикл не сломан')

# Функция
def fib(n):
	print(n)

def getvar():
	print(10)
	return 10

# Вызов функции
fib(1000)

# В конце программы ожидание
input()
