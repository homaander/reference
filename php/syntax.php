<?php

// Переменные
$num = 10;									// Целочисленная
$num = 1.25;								// Плавающая запятая
$str = 'str $a';							// Обычная строка
$str = "str $a \n \t \u{0410} \$ \" "; 		// Строка с раскрытием переменных и доп.символами
$bol = true;								// Логическая переменная
$arr = [1,2,3];								// Массив
$arr = [									// Асоциативный массив
	'name'	=> 'Andrew',
	'age'	=> 40,
	'edy'	=> [1,2,3]
];

// Присвоить переменным значения массива
list($a, $b, $c) = $arr;
[$a, &$b, &$c] = $arr;
[$a, [$b, $c]] = [10, [1, 2]];
['name'=>$name, 'age'=>$age] = $arr;

// Многострочные переменные (с инициализацией переменных и без)
$a =<<<TEXT
This message display var: $a
TEXT;

$a =<<<'TEXT'
This message don't display var: $a
TEXT;



// Операции
$a = $b + 10;		// Приравнивание
$a += 10;			// Прибавить
$a = $a ** $b;		// Возведение в степень
$a = $b ** 0.5;		// Квадратный корень
$str .= ' руб';		// Добавить строку
$arr[] = 1;			// Добавить элемент в конец

$arr3 = $arr1 + $arr2;	// Слияние массивов

// Примет значение 'ok', если $var это null
$a = $var ?? 'ok';
(null ?? $obj ?? false); // Принимает первую определённую операцию. с лева на право

$a = null;
$a ??= 'Hello';

// Примет значение 'ok', если $var выдаёт false
$a = $var ?: 'ok';

$a = $a<<2; # Добавить 2 бита в конец двоичного кода
$a = $a>>2;	# Убрать 2 последних бита в двоичном коде

@fopen('test.txt', 'r'); 	 # Не выдаёт ошибку, возращает false

$command = `cmd.exe /c dir`; # Команды системной консоли сервера

$a++; # Не раскрывается в вырожении, но увеличивается
++$a; # Раскрывается в выражении и увеличивается

echo $a.$arr[2].'lol';

$a = $b = 10;
$a = 3 * sin($b = $c + 10) + $d;

$name = 'var';
$$name = 'str'; # Символические ссылки

$b = &$a; #Жесткая ссылка на а (b и a теперь одно и то же)
$a = &$obj['name']; #Если элемента не существует, выведет Null



#Константы
	define('MY_NAME', 'Andrew');
	defined('MY_NAME'); #true(1), false('')

#Логические операции
$num = 0;
$str == true;	#Строка существует
$num == false;	#0, "" и false - одно и то же
$num === false;	#Сравнивает так же тип, вывод: false 

$a == $b and $a > $b or $a >= $b xor $a != $b;
# &&, ||, ^ - более высокий приоритет (перед '=')
$a <=> $b; # ($a < $b) = -1; ($a == $b) = 0; ($a > $b) = 1

if ('str' == 0) 	echo 'OK'; 	#OK
if ('str' == false) echo 'OK';	#-

if (false == 0) echo 'OK';		#OK



# Программные константы:
    # Перевод строки согластно с системой
		echo PHP_EOL;
    # Путь к файлу скрипта
        echo __FILE__;
    # Путь к папке со скриптом
        echo __DIR__;

    # Математические константы:
        echo M_PI;
        echo M_E;

# Программные переменные:
        # Системные константы (имя скрипта)
            echo $_SERVER['SCRIPT_NAME'];
        # Запрос в виде строки 
            echo $_SERVER['REQUEST_URI'];
        # Все поступившие значения
            echo $_REQUEST;
        # POST значения
            echo $_POST;
        # GET значения
            echo $_GET;
        # Полученый файл
            echo $_FILE;



#Условные операторы
$a = ($b > 10)? 0 : 1;   # Если b > 10 то $a = 0, иначе $a = 1;

if ($a > 10) { 
	echo 1; 
} elseif ($a <= 10) {
	echo 0; 
} else
	echo -1;

if (true):
endif;

switch ($x) {
	case 1: echo 1; break;
	case 2: echo 2;			#
	case 3:	echo 3; break;	#После 2 выполнится 3
	default:
}

switch ($x):
	case 1:
endswitch;

#Циклы
for ($k = 0;$k < 100;$k++){ break; continue; for($i = 0;$i < 10;$i++) { break(2); } }
for ($a = 0, $b = 0; $b < 100; $a++, $b+=$a):
endfor;

while ($a > 1){}
while ($a > 1):
endwhile;

do {} while($a > 1);

foreach ( $arr as $a ) {}
foreach ( $arr as &$a ) {}
foreach ( $arr as $key => $value ) {}
foreach ( $arr as $key => &$value ) {} # Возможность изменять массив

foreach ( $arr as $key => $value ):
endforeach;

# Функции

/**
* Описание
* Функции
* @var
* @param
* @return
* @todo
*/

// Статическая переменная - относительно первого x это другая переменная,
// но со следующим вызовом переменная сохраняет своё значение
	function fun()	{ static $x; $x++; }

// Переменная становится глобальной и можно изменять её как первую 
	function fun(string $a, int $b)	{ global $x; $x++; }

// Функция принимает либо строку, либо null
	function fun(?string $str) {}

// Использоание внешних функций (Замыкание)
	$func = function($a, $b) use ($x)	{ return $a + $b + $x; };
	$func = fn($a, $b) => $a + $b + $x;

	$func();

// Позволяет изменять входящую переменную
	function fun(&$a) {}
// Сколь угодное количество аргументов записывается в массив
	function fun(...$args) {}

// Изменение статической переменной функции
	function &fun7() {
		static $num = 10;
		return $num;
	}

	$a = &fun();
	$a = 20;
	echo fun(); // 20

fun();			#Вызов
fun(123);		#Вызов с аргументами
fun(...$arg);	#Раскрыть массив в аргументы

$str = 'func';	#Имя функции
$str();			#Вызов функции по имени

// Генераторы
	function gener1() {
		yield 1;
		yield 2;
	}

	foreach (gener() as $i) echo $i;

	// Возврат генератора
		function gener2() {
			yield 1;
			yield from gener1();
		}
	
	// Отправка в генератор
		function gener3() {
			$ret = yield;
			echo $ret;
		}

		$gen = gener3();
		$gen->send('OK');

	// return в генераторах
		function gener4() {
			yield 1;
			yield 2;
			return 3;
		}

		$gen = gener4();

		$result = $gen->getRetutn();

# Если файл не найден ошибки нет
	include_once 'lib.php';
# Если файл не найден ошибка сервера
	require_once 'lib.php';
