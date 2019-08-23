# Общие
var = 10
type(var)

# Математические
import math

round(10.5)

math.ceil(10.01)
math.floor(10.99)

# Массивы

cars = ['Mazda', 'Toyota']

range(1, 10)
len(cars)

tuple('hello world')

cars.append('Skoda')

cars.extend([1, 2])
cars.insert(0, 'BMW')

cars.pop()
cars.pop(1)
var = cars.pop(1)

cars.remove('Toyota')

index = cars.index('BMW')
count = cars.count('BMW')

cars.sort()
cars.reverse()


# Множества
cars = set (cars)
cars.discard(32)
