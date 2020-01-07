<?php

// Iterator:

// Точное создание итератора
class DirIterator implements Iterator {
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
    public function key()   { return $this->current; }

    // Должен вернуть значение
    public function current() {
        $path = $this->owner->path . '/' . $this->current;

        return is_dir($path)? new FileIterator($path) : $this->current;
    }

    // Меняет значение на следующее
    public function next()  { $this->current = readdir($this->dir); }
   


    // Проверка коректности значения
    public function valid() { return $this->current !== false; }

}

// Упрощенное создание итератора
class VarIterator implements IteratorAggregate {
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

// Встроеные наследники итераторов:
$dir = new DirectoryIterator('.'); # Перебор объектов файлов

// LimitIterator
	// Первые 5 значений
		$limit = new LimitIterator($dir, 0, 5);

// Рекурсия
$dir = new RecursiveIteratorIterator(
    new RecursiveDirectoryIterator('1')
);

foreach ($dir as $file) {
    $dir->getDepth();
}



// Виртуальные массивы:
class MyArray implements ArrayAccess{
    private $a =[];

    public function offsetSet($offset, $value) { $this->a[$offset] = $value; }

    public function offsetGet($offset)         { return $this->a[$offset]; }
    public function offsetExists($offset)      { return isset($this->a[$offset]); }

    public function offsetUnset($offset)       { unset($this->a[$offset]); }
}

$obj = new MyArray();
$obj['name'] = 'Andrew';



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
