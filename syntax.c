#include <stdio.h>

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

int main() {

	// Переменные
		// Целочисленные
			char   a = 1;		// -128 -> 127
			short  a = 10;		// -32768 -> 32767
			int    a = 100;		// -2B -> 2B 
			long   a = 1000;	//
		// С плавующей точкой
			float  c = 1.5;
			double d = 1.55;

		a = NULL;

	// Модификаторы
		// Со знаком
			signed int a = 10;
		// Только положительные
			unsigned int a = 10;

	char* - ссылка на тип char

	// Char
		// Символ
			char sym   = 'A';

		// Строка
			char* str  = "Hello world";
			char str[] = "Hello world";

	// Массивы
		int arr[5] = {1, 3, 5, 4, 2};
		int arr[2][2] = {
			{1, 2},
			{0, 1}
		}

	// Реализация структур
		struct user obj;
			obj.name  = "Andrew";
			obj.age   = 17;
			obj.mpney = 100;


	// Арифметика
		sum = a + 1;
		a += 10;
		a++;


	// Вывод
		printf("Int: %d\n", a);
		printf("Float: %.2f\n", c);
		printf("Str: %s\n", str);


	// Ввод
		scanf("%d", &num);
		scanf("%s", &name);


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

void print(char* str) {
	printf("%s\n", str);
}

int sum(int a, int b) {
	return a + b;
}

void new(*int a, int b) {
	a = b;
}

// Неограниченное количество аргументов
void my_print(char* srt, ...) {

}
