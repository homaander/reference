<?php

// Работа с пространством имён
    namespace OOP\Test { /* code */ }

    namespace OOP;
        // Подключить файл, что бы использовать пространство
        require_once 'OOP/Test.php';

        // Автоматическое подключение , Стандартный метод:
        //  function __autoload($classname) { require_once __DIR__."$classname.php"; }

        spl_autoload_register();

        // Использование пространства имён
        use OOP\Test;           // Замена на Test (последний элемент ссылки)
        use OOP\Test as Tested; // Замена отдельным

        // Прямая (без подключения use)
        $obj = new OOP\Test();

        // Относительная ссылка
        $obj = new namespace\Test\Lol();


        // Глобальная php функция а не из пространства имён
        \strlen('lol');



// Простой класс
class People
{
    // Свойства класса
        // Доступно так-же в классах-наследниках и у объекта
        public     $name  = null;
        // Доступно так-же в классах-наследниках
        protected  string $login = null;
        // Доступно только из данного класса класса
        private    string $passw = null;

    // Предопределённые методы
        // Конструктор - вызывается при создании и получает параметры в new People(пааметры)
        public function __construct($name) { $this->Name = $name; }
        // Деструктор - вызывается при потере всех ссылок на объект
        public function __destruct()       { fclose($this->f); }

        // При сериализации объекта (имена параметров, которые надо сериализировать)
        public function __sleep()          { return ['name', 'age']; }
        // При унсериализации
        public function __wakeup()         { $this->Money = 0; }

        // Перехват запроса на получение несуществующего или недоступного свойства:
        public function __get($undif)        { return $undif.' нет'; }
        // Перехват запроса на редактирование несуществующего или недоступного свойства:
        public function __set($undif, $val)  { echo 'Свойства '.$undif.' нет'; }
        // Перехват запроса на несуществующий или недоступный метод:
        public function __call($undif, $arr) { return 'Метода '.$undif.' нет'; }

        // При выводе как строку
        public function __toString()         { return "{$this->name}"; }
        // Срабатывает на клон (При private - запрещает клонирование)
        public function __clone()            { $this->Name = 'clone'; }

    // Методы
        // Метод
        public function myWrite($a, $b) { echo $this->Name; }
        // Метод с возвратом
        public function math(int $a, int $b, People $res) : int { return $a + $b; }
        // final - запрещает переопределять метод
        protected final function writeName() { echo $this->Name; }
}

// Объект класса
	// Создание объекта
	$obj = new People;
	$obj = new People('Vitya', 17); // Передача двнных в конструктор

	// Клонирование объекта (другое ячейка памяти)
	$clone = clone $obj;

	// Обращение к параметру
	echo $obj->name;

	// Вызов метода
	$obj->printName();



// Абстрактный класс (должен быть реализован в наследниках)
abstract class A
{
    abstract public function Kek(int $a);

    public function ok($msg) {
        echo $msg . PHP_EOL;
    }
}



/**
 * Статические:
 * При обращении к static свойствам используется класс::свойства
 * В статических методах нет $this (т.к. нет объекта) но есть класс self
 */
class S
{
    // Статическое свойство - не привязывается к объекту
	public static $count;

    // Константа класса - статическая
    public const NAME = 'ok';

    /**
     * Проверка существования объектов
     * Если нет, создаётся новый  
     */
    public static function сreate($name) {
       	self::$count++; 
        return self::$loggers[$name] ?: self::$loggers[$name] = new self($name);
    }

   	public static function delete($name) {
    	self::$count--;
        unset($loggers[$name]);
    }

    public static function where() { echo 'Hello from '.__CLASS__; }
    
	/**
	 * static - В отличие от self не привязывается к классу где был определён 
   	 * и при наследовании будет вызыватся метод/свойство наследника
   	 */
	public static function test() { static::write(); }
}

// Вызов
S::delete($obj);
// Оброщение к константе
S::MESSAGE;
// Обращение к свойству
S::$name;



// Наследование
class Student extends People
{
    public function __construct() {
        parent::__construct();
    }

    public function printItem($string) {
        echo 'Student: ' . $string;
        parent::writeName();
    }
}

$obj = new Student;

// Проверка совместимости объектов
$className = 'People';
if ($obj instanceof People) echo 'OK';
if ($obj instanceof $className) echo 'OK';

// Вызов метода который наследуется от People
    $obj->writeName();
// Вызов своего метода
    $obj->printItem('lol');

// final - запрещает наследовать класс
final class End
{
	public function p(string $msg) {
		echo $msg;
	}
}



// Анонимный класс
class Test
{
    private $Name;
    
	public function __construct($name) {
    	$this->Name = $name;
    }

    public function anonym() {
         return new class($this->Name) extends Test {
             public function write() {
                 echo $this->Name;
             }
         };
    }
}

(new Test)->anonym()->write();



// Интерфейсы
interface IA { public function write(); }
interface IB { public function read(); }
interface IC extends IA, IB { public function info(); }

// Наследование(Реализация) интерфейсов
abstract class ID implements IA {}

class Child extends Test implements IA, IB
{
    public function write() { echo 123; }
    public function read()  { echo 321; }
}



// Трейды
trait F
{ 
    protected function write() { echo 'Lol F'; }
    protected function read()  { echo 'Kek F'; }
}

trait G 
{
	protected function write() { echo 'Lol G'; }
	protected function read()  { echo 'Kek G'; }
}

class T 
{ 
	use F, G; 
}

class T 
{ 
	use F, G {
    	// Использовать именно F::write и G::read при вызове
            F::write insteadof G;
            G::read  insteadof F;

        // Метод G::Write сделать отдельно в Lol
            G::write as my_write;
    }
}



// Исключения
class MyExcepton extends Exception {}

try {
	// Сгенерировать исключения
       	throw new Exception('Hello!');
       	throw new MyException('Hello!');
    $a = 1 / 0;
}
catch (MyException $e) {
    echo $e->GetMessage();
}
catch (Exception $e) {
    echo $e->GetMessage();

    // Идём дальше в следующий catch
       	throw $e;
}
catch (Error $e) {
    // Базовый класс для всех внутр. ошибок
       	echo 'Ошибка!';
}
finally {
        echo 'Всё ровны выполнится!';
}  
