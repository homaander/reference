import math

# Переменные
	# str
var = "hello world"
	# int
num = 12
	# float
qwe = 1.43

	# bool
flag = True
flag = False

# Массивы
arr = ["Andrey", "Vitya", 10]
cars = ["Mazda", "Toyota"]

# Вывод на экран
print(arr[0] + str(len(arr)))


c = float(a) + float(b)
c = int(a) + int(b)

# Ввод с клавиатуры
name = input("Ваше имя: ")
# Вывод на экран
print("hello, " + name)

# Условия
if name == "Andrew":
    print("You Andrew")
elif name == "Vitya":
    print("You Vitya")
else:
    print("Invalid name")

# Перебор
for car in cars:
	print(car)

# Функция
def fib(n):
    a, b = 0, 1
    while a < n:
        print(a, end=' ')
        a, b = b, a+b
    print()

fib(1000)

# В конце программы ожидание
input()
