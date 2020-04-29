<?php

// Iterator:

	// Точное создание итератора
	class DirIterator implements Iterator
	{
	    private $owner;
	    private $dir;
	    private $current;

	    public function __construct($owner) {
	        $this->owner = $owner;
	        $this->dir   = opendir($owner->path);

	        $this->rewind();
	    }

	    // Сбрасывает значение на первое
    	public function rewind() {
        	rewinddir($this->dir);
        	$this->current = readdir($this->dir);
    	}

	    // Должени вернуть ключ
    	public function key() {
			return $this->current;
		}

	    // Должен вернуть значение
    	public function current() {
        	$path = $this->owner->path . '/' . $this->current;
        	return is_dir($path)? new FileIterator($path) : $this->current;
    	}

	    // Меняет значение на следующее
    	public function next() { 
			$this->current = readdir($this->dir);
		}

	    // Проверка коректности значения
    	public function valid() {
			return $this->current !== false;
		}
	}

	// Упрощенное создание итератора
	class VarIterator implements IteratorAggregate
	{
	    public $arr;

	    public function __construct($path) {
	        $this->arr = $arr;
	    }

	    // Метод, возвращающий итератор
	    	public function getIterator() {
	        	return new ArrayIterator($arr);
	    	}

	    // Метод, возвращающий генератор
	    	public function secondIter() {
	    		yield 1;
	    		yield 2;
	    		yield 3;
	    	}
	}

	$obj = new DirIterator('.');
	foreach ($obj as $k => $v) {}

	$obj = new VarIterator([1, 2, 3]);
	// Так же можно явно указывать метод, возращающий итератор
	    foreach ($obj->secondIter() as $k => $v) {}



	// Фильтр итератора (возращает значение, где accept() == true)
	    $a = new ArrayIterator(array('test1', 'test2', 'test3'));

		class MyFilter extends FilterIterator 
		{    
			private $ext = null;

		    public function __construct(DirIterator $it, $ext) {
		        parent::__construct($it);

		        $this->ext = $ext;
		    }

		    public function accept() {
		    	return parent::current() == $this->ext; 
		    }
		}


		$i = new RegexIterator($a, '/^(test)(\d+)/', RegexIterator::REPLACE);
		$i = new MyFilter($a, 'test2');


	// Встроеные наследники итераторов:
		// Перебор файлов и папок
			$dir = new DirectoryIterator('.');

		// Обычный итератор массива
			$a = new ArrayIterator(array('test1', 'test2', 'test3'));

		// LimitIterator
			// Первые 5 значений
				$limit = new LimitIterator($dir, 0, 5);

		// Рекурсия
			$dir = new RecursiveIteratorIterator(
			    new RecursiveDirectoryIterator('dir');
			    new RecursiveArrayIterator($arr);
			);
			
			// Получить глубину рекурсии
				foreach ($dir as $file) { $dir->getDepth(); }



// Виртуальные массивы:
	class MyArray implements ArrayAccess
	{
	    private $a =[];

	    public function offsetSet($offset, $value) { $this->a[$offset] = $value; }

	    public function offsetGet($offset)         { return $this->a[$offset]; }
	    public function offsetExists($offset)      { return isset($this->a[$offset]); }

	    public function offsetUnset($offset)       { unset($this->a[$offset]); }
	}

	$obj = new MyArray();
	$obj['name'] = 'Andrew';



// XML:
    // XML из строки/ссылки
        $obj = new SimpleXMLElement($xml, 0, false);
        $obj = new SimpleXMLElement($url, 0,  true);

    // Получение элемента
        $obj->title;
        $obj->item[0];
    
    // Количество элементов
        $obj->item->count();

    // Массив аттрибутов
        $obj->item->arttibutes();

    // XPath регулярные выражения
        $item = $obj->xpath('//item');
        $item['url'];
        
    // Добовление
        $obj->addChild('item', 'text');
        $obj->item->addAttribute('url', 'vk.com');
        
        $str = $obj->asXML();
        $obj->asXML('file.xml');



// Directory:
$obj = dir('.');
    $obj->path;     // Путь к каталогу
    $obj->handle;   // Дескриптор каталога

    // В качестве параметра можено передать дескриптор другого файла
    $obj->read();   // Чтение очередного элемента
    $obj->rewind(); // Сбросить в изначальное положение
    $obj->close();  // Закрыть каталог



// Mysqli
    $mysql = mysqli('localhost', 'user', 'pass', 'db_name');

    $mysql->query();

    $mysql->escape_string($str);

    $mysql->insert_id;



// PDO:
    // Соединится с БД
    	$pdo = new PDO(
    		'mysql:host=...;dbname=...',
            'root',
            '1111',
            [ PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION ]
        );

    // Последнее значение primary_key с auto_increment
    	$pdo -> lastInsertId();

    // Выполнить запрос без получения данных
    	$count = $pdo->exec($query);

    // Запрос с получением данных
    	$res = $pdo->query($query);
    // Извлеч очередную строку запроса
    	$result = $res->fetch();
    // Вернуть только асоц массив
    	$result = $res->fetch(PDO::FETCH_ASSOC);

    // Преобразовать все резулбтаты в большой массив
    	$all_result = $res->fetchAll();

    // Параметры SQL (Переменные в запросе)
    	$query = 'SELECT * FROM table WHERE id = :id';
    // Установить, что в запросе есть параметры
    	$cat = $pdo->prepare($query);
    // Изменить параметр
    	$cat->execute(['id' => 1]);



// Generator:
	function gen() {
    	yield  1;
    	yield  2;
    	return 3;
	}

	$obj = gen();
    	$obj->send('text'); // Послать значение в генератор
    	$obj->getReturn();  // Получить значение return
    	$obj->valid();      // Проверка на открытость генератора
    	$obj->currect();    // Текущее значение генератора
    	$obj->next();       // Следующее значение



// Closure:
	class View
	{
    	protected $page;
    	public function __construct($page) { $this->page = $page; }
	}

	$clos = function() { echo $this->page; };

	$obj  = new View('test');

	$clos = $clos->bindTo($obj, 'View'); // Назначить замыкание функции

	$clos();



// Дата:
	$date  = new DateTime();
	$date2 = new DateTime("2016-01-01 00:00:00");
	$date  = new DateTime("now", new DateTimeZone("Europe/Moscow"));
	    $date->format('d.m.Y'); // Эквивалент date

	$result = $date->diff($diff2); // Интервал между текущей датой и данной в $date


	// DateInterval:
		$intval = new DateInterval("P3Y1M1D10H12M59S"); // Формат даты: P(число)(чего)
		$result = $date->add($intval);                  // Добавить к дате интервал
		$result = $date->sub($intval);                  // Вычесть из даты интервал
	    	$date->format('d.m.Y');                     // Эквивалент date


	// DatePeriod:
		$period = new DatePeriod($date, $intval, 5); #Генерирует 5 дат от $date с шагом $intval
		foreach ($period as $v) {}



// Отражение
	$obj = new ReflectionFunction('MyArray');
	    // (bool) Функция встроена
	        $obj->isIntergal();
	    // (bool) Функция определена пользователем
	        $obj->isUserDifined();

	    // (string) Имя файла где определена
	        $obj->getFileName();
	    // (string) Строка начала определения
	        $obj->getStartLine();
	    // (string) Строка конца определения
	        $obj->getEndLine();

	    // (string) Коментарий перед функцией
	        $obj->getDocComent();


	// Функции
	    // Вызвать функцию
	        $obj->invoke();
	    // (array) Вернёт список ReflectionParameters:
	        $obj->getParameters();

	// ReflectionParameters:
		// Имя параметра
			$par->getName();
		// Тип параметра
			$par->getClass();
		// Может быть null или не обязателный
			$par->allowsNull();
		// Параметр - ссылка
	    	$par->isPassedByReference();


	// Классы
	    // Создать экземпляр класса
	        $obj->newInstance($a, $b);
	    // Получить свойства
	        $obj->getProperties();
	    // Молучить методы
	        $obj->getMethods();



// PHP 7.4
	// FFI
		$obj = FFI::cdef("
			int lol() {
				return 10;
			}
		")

		echo $obj->lol();

		$ffi = FFI::cdef("
			struct user {
				char* name;
				int age;
			};
		")

		$obj = new $ffi->user;

