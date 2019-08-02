<?php
class People {
	const MESSAGE = 'lol';

	public  $Name;
	private $Age;
	private $Money;
	private static $Count;

	#Предопределённые функции
	public function __construct($name)	{ $this->Name = $name; }
	public function __destruct()		{ fclose($this->f); }
	#При сериализации объекта (что сериализировать)
	public function __sleep()			{ return ['Name', 'Age'] }
	#При унсериализации
	public function __wakeup()			{ $this->Money = 0 }

	#Перехват запроса к несуществующим свыйствам\матадам
	#Перехват запроса на получение несуществующего свойства:
	public function __get($undif) 		{ return $undif.' нет'; }
	#Перехват запроса на редактирование несуществующего свойства:
	public function __set($undif, $val) { echo 'Свойства '.$undif.' нет'; }
	#Перехват запроса на несуществующий метод:
	public function __call($undif, $arr){ return 'Метода '.$undif.' нет'; }

	public function __toString()		{ return "{$this->name}"; } #При выводе как строку
	public function __clone()			{ $this->Name = 'clone'; } #Срабатывает на клон
	#При private - запрещает клонирование

	#Методы
	public function Write_Name2($a, $b)	{ echo $this->Name; }
	#final - запрещает переопределять метод
	protected final function Write_Name() { echo $this->Name; }

	abstract public function Kek(int $a);

}

$obj = new People;			#Создание объекта
$obj = new People(16, 2);	#Создание объекта с параметрами в конструктор
$fake clone $obj;			#Создаёт копию обекта но ссылающийся на другое пространство

$obj->Write_Name2(1, 3);	#Вызываем публичный метод


# Статические:
# Вызов
# Можно, но функция не примет $this
	$obj->Delete_P();
# Просто выызов функции
	People::Delete_P($obj);
# Оброщение к константе
	People::MESSAGE
# Обращение к строке
	People::$Name

class People2 {
	#При обращении к static свойствам используется класс::свойства
	#В статических методах нет $this (т.к. нет объекта) но есть класс self
	public static function Create_P($name) {
		#Проверка существования одинововаж объектов
		if (isset(self::$loggers['name'])) return self::$loggers[$name];
		#Если нет, создаётся новый  
		return self::$loggers[$name] = new self($name);
	}
	public static function Delete_P(People $obj) { self::$Count++ }

	public static function write() { echo 'Hello from '.__CLASS__; }
	#static - В отличие от self не привязывается к классу где был определён и при наследовании будет вызыватся метод/свойство наследника
	public static function test() { static::write(); }
}

#final - запрещает наследовать класс
final class People3 {}

class Student extends People {
	public function printItem($string) {
		echo 'Student: ' . $string;
		parent::Write_Name();
		parent::Kek(); 
	}
}

$obj = new Student;			#Создание объекта каторый наследуется от People

$obj->Write_Name();			#Вызов метода который наследуется от People
$obj->printItem('lol');		#Вызов своего метода

$obj->getComp( new class {} );

#Анонимный класс
class Test {
	private $Name;
	public function anonym() {
 		return new class($this->Name) extends Test {
 			private $Name;
 			public function __construct($name) {
 				$this->Name = $name;
 			}
 			public function write() {
 				echo $this->Name;
 			}
 		};
	}
}

(new Test)->anonym()->write();

$class = 'Test';
#Проверка совместимости
if ($obj instanceof $class) {}
if ($obj instanceof Test) {}

interface IA { protected function Write(); }

interface IB { protected function Read(); }

interface IC extends IA { protected function Info(); }

abstract class ID implements IA {} # Наследование интерфейсов

class Child extends Test implements A, B {
	public function Write { echo 123; }
	public function Read  { echo 321; }
}

#Трейды
trait F { protected function Write() { echo 'lol'; } }

trait G { protected function Read() { echo 'lol'; } }

class Lol { use F, G; }
class Lol { 
	use F, G {
		F::Write insteadof G;		#Использовать именно F::Write привызове
		G::Read insteadof F;
		G::Write as Lol;			#Метод G::Write сделать отдельно в Lol
	}
}

#Работа с пространством имён
namespace OOP\Test;
namespace OOP {
	require_once 'OOP.php';
	$obj = new OOP\Test();	#Прямая
	$obj = new namespace\Test();	#Прямая
	$obj = new Test\Lol();	#Относительная ссылка
	\strlen('lol');			#Стандртная php функция а не namespace

	#"Сокращение" ссылки
	use OOP\Test; #Замена на Test (последний элемент ссылки)
	use OOP\Test as Tested; #Замена отдельным
}

function __autoload($classname){
	require_once(__DIR__."$classname.php"); #$classname должен совпсть с именем файла в папке
}

spl_autoload_register();
$page = new OOP\Kek(); #Благодоряы __autoload подключается самостоятельно




class FileExcepton extends Exception {}

try {
	throw new Exception('Hello!');
	throw new FileException('Hello!');
	$a = 1 / 0;
} finally {
	echo 'Всё ровны выполнится!';
} catch (FileException $e) {
	echo $e->GetMessage()
} catch (Exception $e) {		#Базовый класс для пользовалельских искл.
	echo $e->GetMessage()
} catch (Error $e) {			#Базовый класс для всех внутр. ошибок
	echo 'Ошибка!';
	throw $e; #Идём дальше в следующий try catch
}




#Итереторы:

class Dirik implements IteratorAggregate {
	public $Path;
	public function __construct($path) {
	    $this->Path = $path;
	}
	public function getIterator() {
	    return new DirikIterator($this);
	}
}

class DirikIterator implements Iterator {
	private $Owner;
	private $D;
	private $Cur;

	public function __construct($owner) {
		$this->Owner    = $owner;
		$this->D        = opendir($owner->Path);
		$this->rewind();
	}

	public function key()   { return $this->Cur; }
	public function next()  { $this->Cur = readdir($this->D); }
	public function valid() { return $this->Cur !== false; }

	public function current() {
		$path = $this->Owner->Path . '/' . $this->Cur;
		return is_dir($path)? new Dirik($path) : $this->Cur;
	}

	public function rewind() {
		rewinddir($this->D);
		$this->Cur = readdir($this->D);
	}
}

$obj = new Dirik('.');
foreach ($obj as $k => $v) {}
		#Так же можно явно указывать метод, возращающий итератор
foreach ($obj->SecondIrer() as $k => $v) {}

#Виртуальные массивы:

class MyArray implements ArrayAccess{
	private $a =[];

	public function offsetSet($offset, $value) { $this->a[$offset] = $value; }
	public function offsetGet($offset) { return $this->a[$offset]; }
	public function offsetExists($offset) { return isset($this->a[$offset]); }
	public function offsetUnset($offset) { unset($this->a[$offset]); }
}

$obj = new MyArray();
$obj['name'] = 'Andrew';

#Встроеные наследники итераторов:

$dir = new DirectoryIterator('.'); #Перебор объектов файлов

#Фильтр итератора (возращает значение, где accept() == true)
class MyFilter extends FilterIterator {
    
    public function __construct(DirikIterator $it, $ext) {
        parent::__construct($it);
    }

    public function accept() { return true; }
}

#LimitIterator
$limit = new LimitIterator($iterator, 0, 5); # первые 5 итераторов

#Рекурсия
$dir = new RecursiveIteratorIterator(
    new RecursiveDirectoryIterator('1')
);

foreach ($dir as $file) {
	int $dir->getDepth();
}

#Отражение
$obj = new ReflectionFunction('none');
	bool   $obj->isIntergal();		#Функция встроена
	bool   $obj->isUserDifined();	#Функция определена пользователем

	string $obj->getFileName();		#Имя файла где определена
	string $obj->getStartLine();	#Строка начала определения
	string $obj->getEndLine();		#Строка конца определения

	string $obj->getDocComent();	#Коментарий перед функцией


#Функции
	$obj->invoke();					#Вызвать функцию
	array $obj->getParameters();	#Вернёт список ReflectionParameters:

#ReflectionParameters:
	$par->getName();		#Имя параметра
	$par->getClass();		#Тип параметра
	$par->allowsNull();		#может быть null или не обязателный
	$par->isPassedByReference();		#параметр - ссылка


#Классы
	$obj->newInstance($a, $b);		#Создать экземпляр класса
	$obj->getProperties();			#Получить свойства
	$obj->getMethods();				#Молучить методы

?>	