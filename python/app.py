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
arr = ['Andrey', 'Vitya', 10]

arr = [
	a + b
	for a in 'list' if a != 'l'
	for b in 'vars' if a != 'a'
]

cars = ['Mazda', 'Toyota']

print(cars[0])
print(cars[-1])

print(cars[2:3:])
print(cars[1:-1:1])
print(cars[::-1])
print(cars[::2])

# Кортеж
cort = (1 , 2, 234, 'str')

# Cловарь
word = {'name': 'Andrey', 'age': 17}

word = {a: a ** 2 for a in range(1, 7)}

word = dict ([('name', 'Andrew'),('age', 17)])
word = dict.fromkeys (['a', 'b'], 1)

print(word['name'])

print(word.values())
print(word.keys())

# Множества
man = {1, 2}
arr = {a ** 2 for a in range(10)}

man = set('hello')
man = set(arr)

man = frozenset(arr)

print(10 in man)
# Не имеют общих элементов
print(man.isdisjoint(arr))

# Сложение множеств
arr.update(man)
# Пересечение множеств
arr.intersection_update(man)
# Вычитание множеств
arr.difference_update(man)
# Сложение вычитаний :)
arr.symmetric_difference_update(man)

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

# Перебор элементов
for car in cars:
	print(car)
	if var == 1:
		break
	elif var == 1:
		continue
else:
	print('Цикл не сломан')



# Цикл
while a > 1:
	print(a)
	a += 1
	if var == 1:
		break
	elif var == 1:
		continue
else:
	print('Цикл не сломан')



# Исключения
try:
	b = input()
	a = 1 / b
except ValueError:
	b = 1
except ZeroDivisionError:
	a = 0
else:
	print (a)
finally:
	a = 0



# Менеджеры
with open('file.txt', 'a+') as inFile:
	num = int( input() )
	inFile.write(num)



# Файлы
f = open('file.txt', 'w')
f = open('file.txt', 'a+')

f.read()
f.read(10)

f.write('Hello')

for line in f:
	print (line)

f.close()



# Функции
# Простая функция
def foo (n):
	print(n)

foo(1000)

# Функция, возращающая значение
def getvar():
	print(10)
	return 10

print (getvar())

# Использование глобальных переменных
def my_print():
	global a
	print(a)

# Функция, с 1 обязательным и неограничинами параметрами
# параметр будет картежом
def write(msg, *args):
	print(msg + args[0])

write ('hello', 1, 2, 3)

# Функция со словорём в параметрах
def user(**args):
	print('Hello ' + args['name'])

user (name='Andrey', age=17)

# Функция возращяющая функцию
def func (a = 10):
	def add (b):
		return a + b
	return add

test = func(10)
print(test(20))

# Анонимная функция
add = lambda a, b: a + b

# Генераторы
def gener():
	yield 1
	yield 2
	yield 3

gen = gener()
print (next(gen))

for i in gen:
	print(i)

# Декораторы
def decor (func):
	def wrapper (a, b):
		print('before')
		func(a, b)
		print('after')
	return wrapper

@decor
def add(a, b):
	print(a + b)



# Классы
class User:
	def __init__(self, name, age):
		self.name = name
		self.age  = age

	def _kill(self):
		print ('Нижнее подчёркивание - не желается использовать в глобале')

	def __ok(self):
		print ('Можно вызвать только как obj._User__ok()')

	def birthday(self):
		self.age += 1

class Moder(User):
	def __init__(self, name, age, breed):
		User.__init__(self, name, age)
		self.breed = breed

class Admin(User, Moder):
	def __init__(self, name, age, breed):
		self.breed = breed

obj = User('Andrew', 17)

print(obj.name)
print(obj.age)

obj.birthday()



# Модули
import math
import os
import random as r

from time import time

math.cos(1)
time()
os.getcwd()