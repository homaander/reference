#include <stdio.h>
#include "myhead.h"

// Для подкльчения 2 .c файла:
// 	gcc -c second.c -o second.o
// 	gcc -c first.c -o first.o
// 	gcc first.o second.o -o app

// Константа
#define NAME "Andrew"

// Функция - константа (макрос, все переменные - ссылочные)
#define new_func(a) \
	a = 10

//  Проверка существования константы
#ifndef NAME
#endif

// Усовие
#if (NAME == "Andrew")
#endif

// Структура
struct user {
	char*  name;
	int     age;
	int   money;
};

// Прототип функции (можно в .h)
int number (int a);

int main() {
	// Вывод
	printf("Int:   %d\n", a);
	printf("Float: %.2f\n", c);
	printf("Str:   %s\n", str);


	// Ввод
	scanf("%d", &num);
	scanf("%s", &name);


	// Переменные
		// Целочисленные
		char   a = 1;		// -128 -> 127
		short  a = 10;		// -32768 -> 32767
		int    a = 100;		// -2000000000 -> 2000000000 
		long   a = 1000;	//

		int a, b, c, d = 10, e;

		// С плавующей точкой
		float  c = 1.5;
		double d = 1.55;

		// Нельзя менять значение
		const short a = 100;

		// Обнуление
		a = NULL;

		// Модификаторы
			// Со знаком
			signed int a = 10;

			// Только положительные
			unsigned int a = 10;

		// Char
			// Символ
			char sym   = 'A';

			// Строка
				char str[] = "Hello world";

				// Только чтение (нельзя менять, ставить const)
				const char* str  = "Hello world";

		// Указатели
			char a = 10;

			// Создать указатель на a
			char* aPointer = NULL;
			char* aPointer = &a;

			// Получение знечения из адреса
			printf("%d", *aPointer);
			int b = *aPointer;

			// Изменить значение a
			*aPoint = 5;

			// Нельзя менять значения и ссылку
			const char* const a = "Lol";

			// Вывести адрес
			printf("%p", aPointer);

		// Массивы
		short arr[5] = {1, 3, 5, 4, 2};
		short arr[3] = { [2] = 3 };
		short arr[2][2] = {
			{1, 2},
			{0, 1}
		}
		char* arr[] = {"Hello", "world"};

		printf("%d\n", arr[1]);
		printf("%d\n", *(arr + 1));

		// index access
		short a = arr[0];

		// pointer access
		short a = *arr;
		short b = *(arr + 1);

		// Арифметика
		sum = a + 1;
		a += 10;
		a++;
		++a;

	// Реализация структур
	struct user obj;
		obj.name  = "Andrew";
		obj.age   = 17;
		obj.money = 100;

	// Размер типов данных
	size_t intSize = sizeof(int);
	size_t varSize = sizeof(a);
	printf("%zu\n", intSize);

	// Условия
	if (a < 11 && a > 9) { /* code */ }
	else if (b >= 10) { /* code */ }
	else
		/* code */

	a = (a > 10)? a - 10: a;

	switch (a) {
		case 10:
			/* code */
			break;

		default:
			/* code */
			break;
	}


	// Циклы
	for (int a = 1; a < 10; a++) { /* code */ }

	while (sum > 10) { /* code */ }

	do { /* code */ } while (sum < 10)

	return 0;
}

void print(char* str) { /* code */ }

// Функция с вазращаемым значением
int sum(int a, int b) { return a + b; }

// Передаётя ссылка
void new(int* a, int b) { /* code */ }

// Массив на вход
int sum(int*  a) {}
int sum(int a[]) {}

// Массив строк на вход
void test(char* str[]) { /* code */ }
void test(char**  str) { /* code */ }

// Неограниченное количество аргументов
void my_print(int str, ...) { /* code */ }
