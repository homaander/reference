/*
    Для подкльчения 2 .c файла:
        gcc -c second.c -o second.o
        gcc -c first.c -o first.o
        gcc first.o second.o -o app
*/

/* Комманды компилирования */
// Стандарт ввод-вывод
#include <stdio.h>
// Windows CMD комманды через system("комманда")
#include <stdlib.h>
// bool
#include <stdbool.h>
// Строки
#include <string.h>

// Свой заголовочный файл
#include "my_lib.h"

// Константа, котороя при компиляции заменится на значение
#define NAME "Andrew"

// Функция - константа (макрос, все переменные - ссылочные)
#define new_func(a) \
    a = 10

// Проверка существования константы
#ifdef NAME
    // ...
#endif

// Проверка НЕ существования константы
#ifndef NAME
    // ...
#endif

// Усовие
#if (NAME == "Andrew")
    // ...
#endif
/* ----------------------- */


// Структура
struct User {
    char  *name;
    int     age;
    int   money;
};

// Структура как тип данных
typedef struct {
    char* name;
    int    age;
    int  money;
} User;

// Прототип функции (можно в .h)
int number (int a);

// Входная точка
int main() {
    /* Типы переменных------------------------------ */

    // Целочисленные
    /* Модификаторы--------- */
    // Со знаком
    signed int a = -10;

    // Только положительные
    unsigned int a = 10;
    /* --------------------- */

    // Числа
    char   a = 1;        // -128 -> 127
    short  a = 10;        // -32768 -> 32767
    int    a = 100;        // -2B -> 2B
    long   a = 1000;    // -6Qu - 6Qu (18 нулей)
    long long a = 1;    //

    // strbool.h
    bool flag = true;

    // Несколько переменных
    int a, b, c, d = 10, e;

    // Множественное определение
    int a, b, c;
    int d = a = b = c = 10;

    // С плавующей точкой
    float  c = 1.5f;  // +- 10 ^ 38
    double d = 1.55f; // +- 2 * 10 ^ 308
    long double d = 1.555f;

    // ASCII символ
    char a = 'A';
    // или
    char a = 65;

    // Массивы
    int   arr[]  = {1, 2, 3, 4, 5};
    short arr[3] = { [2] = 3 };
    short arr[2][2] = {
        {1, 2},
        {0, 1}
    };
    short a = arr[0];

    // Строка
    char* str = "Hello!";   // Не менять
    char  str[] = "Hello!";

    // Массив строк
    char* arr = {"hello", "world"}; // Не менять
    char arr[3][5] = {"hello", "world"};

    // Константа
    const short a = 100;

    // Размер типов данных
    size_t intSize = sizeof(int);
    size_t varSize = sizeof(a);

    // Обнуление
    a = NULL;
    /* --------------------------------------------- */


    /* Указатели-------------------------- */
    char a = 10;

    // тип данных и * = адрес переменной этого типа
    // &var = получить адрес переменной
    // *pVar = получить значение по адресу

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

    // pointer access
    short a = *(arr + 0);
    short b = *(arr + 1);

    // array access
    short a = arr[0];
    short a = arr[1];
    /* ----------------------------------- */


    /* Арифметика--- */
    sum = a + 1;
    a += 10;
    a++;
    ++a;
    /* ------------- */

    /* Ввод----------- */
    int name
    char* name;

    scanf("%d", &num);
    scanf("%s", name);
    /* --------------- */

    /* Вывод------------------- */
    printf("Int:    %d\n",   a);
    printf("Float:  %.2f\n", c);
    printf("Char:   %c\n",   c);
    printf("String: %s\n",   str);
    printf("Point:  %p\n",   &a);
    printf("Size:   %zu\n", intSize);
    /* ------------------------ */

    // Реализация структур
    struct User obj = {"Andrew", 18, 1000};

    // Структура как тип данных
    User obj = {"Andrew", 18, 1000};

    struct User obj;
    // obj.name  = "Andrew"; - ! Не работает !
    obj.name  = strdup("Andrew");
    // или
    srtcpy(obj.name, "Andrew");

    obj.age   = 17;
    obj.money = 100;

    /* Условия--------- */
    if (1) {}
    if (flag or true)
    if (a == 1 || a == 2) {}
    if (!(a == 1 && b == 2)) {}
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
    /* ---------------- */

    // Циклы
    for (int a = 1; a < 10; a++) { /* code */ }

    while (sum > 10) { 
        continue;
        break;
    }

    do { /* code */ } while (sum < 10)

    return 0;

    // String.h
    char a[32] = "Hello";
    char b[32] = "Hello";

    // Проверка совпадения стрк
    if (strcmp(a, b) == 0)
        /* code */


    // Файлы
    char line[512];

    FILE* file = fopen("file.txt", "w"); // Перезаписать
    FILE* file = fopen("file.txt", "a"); // Дописать
    FILE* file = fopen("file.txt", "r"); // Читать

    fprintf(file, "hello\n"); // Запись

    fgets(line, 512, file) // Чтение первых 512 символов из первой строки

    fclose(file);
}

// Передать структуру
void get(struct User user) { /* code */ }

// Передать структуру это тип
void get(User user) { /* code */ }

// Передать ссылку на структуру
void get(struct User* user) {
    // Получить значение свойства из ссылки на объект
    user->name;
}

// Передать ссылку на структуру если это тип
void get(User* user) {}



// Функция с вазращаемым значением
int sum(int a, int b) { return a + b; }

// Передаётя ссылка
void new(int* a, int b) { /* code */ }

// Массив на вход
int sum(int* a) {}
int sum(int a[]) {}


void print(char* str) { /* code */ }

// Массив строк на вход
void test(char* str[]) { /* code */ }
void test(char** str) { /* code */ }

// Неограниченное количество аргументов
void my_print(int str, ...) { /* code */ }
