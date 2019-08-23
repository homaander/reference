<?php

# Работа с пространством имён
    # namespace OOP\Test { Code... }
    namespace OOP;
        require_once 'OOP/Test.php';

        # Прямая
            $obj = new OOP\Test();
            $obj = new namespace\Test();

        # Относительная ссылка
            $obj = new Test\Lol();
        # Стандртная php функция а не namespace
            \strlen('lol');

        # "Сокращение" ссылки
        use OOP\Test; #Замена на Test (последний элемент ссылки)
        use OOP\Test as Tested; #Замена отдельным

    # Автоматическое подключение
        # $classname должен совпсть с именем файла в папке
            function __autoload($classname){
                require_once(__DIR__."$classname.php");
            }
        spl_autoload_register();

        #Благодоряы __autoload подключается самостоятельно
            $page = new OOP\Kek();



# Простой класс
class People {
    const MESSAGE = 'lol';

    public  $Name;
    private $Age;
    private $Money;

    public static $Count;

    # Предопределённые функции
        # Конструктор и деструктор
            public function __construct($name) { $this->Name = $name; }
            public function __destruct()       { fclose($this->f); }

        # При сериализации объекта (что сериализировать)
            public function __sleep()          { return ['Name', 'Age']; }
        # При унсериализации
            public function __wakeup()         { $this->Money = 0; }

        # Перехват запроса на получение несуществующего свойства:
            public function __get($undif)        { return $undif.' нет'; }
        # Перехват запроса на редактирование несуществующего свойства:
            public function __set($undif, $val)  { echo 'Свойства '.$undif.' нет'; }
        # Перехват запроса на несуществующий метод:
            public function __call($undif, $arr) { return 'Метода '.$undif.' нет'; }

        # При выводе как строку
            public function __toString()         { return "{$this->name}"; }
        # Срабатывает на клон (При private - запрещает клонирование)
            public function __clone()            { $this->Name = 'clone'; }

    #Методы (final - запрещает переопределять метод)
        public function myWrite($a, $b)      { echo $this->Name; }
        protected final function writeName() { echo $this->Name; }
}

# Абстрактные методы
abstract class A {
    abstract public function Kek(int $a);
}

# Создание объекта класса
    $obj = new People;

    # Передать параметры в конструктор
        $obj = new People(16, 2);

# Создаёт копию обекта но ссылающийся на другое пространство
    $fake = clone $obj;

# Оброщение к переменной
    $obj->name;

# Вызываем публичный метод
    $obj->Write_Name2(1, 3);


# Статические:
    # Вызов
        # Можно, но функция не примет $this
            $obj->Delete_P();
        # Просто выызов функции
            People::Delete_P($obj);

    # Оброщение к константе
        People::MESSAGE;
    # Обращение к строке
        People::$Name;

class People2 {
    #При обращении к static свойствам используется класс::свойства
    #В статических методах нет $this (т.к. нет объекта) но есть класс self
    public static function Create_P($name) {
        #Проверка существования одинововаж объектов
        if (isset(self::$loggers['name'])) return self::$loggers[$name];
        #Если нет, создаётся новый  
        return self::$loggers[$name] = new self($name);
    }
    public static function delete(People $obj) { self::$Count++; }

    public static function write() { echo 'Hello from '.__CLASS__; }
    #static - В отличие от self не привязывается к классу где был определён и при наследовании будет вызыватся метод/свойство наследника
    public static function test() { static::write(); }
}

#final - запрещает наследовать класс
final class People3 {}

class Student extends People {
    public function printItem($string) {
        echo 'Student: ' . $string;
        parent::writeName();
        parent::kek(); 
    }
}

$obj = new Student;            #Создание объекта каторый наследуется от People

$obj->Write_Name();            #Вызов метода который наследуется от People
$obj->printItem('lol');        #Вызов своего метода

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

interface IA { public function write(); }

interface IB { public function read(); }

interface IC extends IA { public function info(); }

abstract class ID implements IA {} # Наследование интерфейсов

class Child extends Test implements IA, IB {
    public function write() { echo 123; }
    public function read()  { echo 321; }
}

#Трейды
trait F { protected function Write() { echo 'lol'; } }

trait G { protected function Read() { echo 'lol'; } }

class Lol { use F, G; }
class Lol { 
    use F, G {
        F::Write insteadof G;        #Использовать именно F::Write привызове
        G::Read insteadof F;
        G::Write as Lol;            #Метод G::Write сделать отдельно в Lol
    }
}



class FileExcepton extends Exception {}

try {
    throw new Exception('Hello!');
    throw new FileException('Hello!');
    $a = 1 / 0;
} catch (FileException $e) {
    echo $e->GetMessage();
} catch (Exception $e) {
    echo $e->GetMessage();
    #Идём дальше в следующий try catch
    throw $e;
} catch (Error $e) {
    #Базовый класс для всех внутр. ошибок
    echo 'Ошибка!';
} finally {
    echo 'Всё ровны выполнится!';
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
	# Первые 5 итераторов
		$limit = new LimitIterator($iterator, 0, 5);

#Рекурсия
$dir = new RecursiveIteratorIterator(
    new RecursiveDirectoryIterator('1')
);

foreach ($dir as $file) {
    $dir->getDepth();
}

#Отражение
$obj = new ReflectionFunction('none');
    #(bool) Функция встроена
        $obj->isIntergal();
    #(bool) Функция определена пользователем
        $obj->isUserDifined();

    #(string) Имя файла где определена
        $obj->getFileName();
    #(string) Строка начала определения
        $obj->getStartLine();
    #(string) Строка конца определения
        $obj->getEndLine();

    #(string) Коментарий перед функцией
        $obj->getDocComent();


# Функции
    # Вызвать функцию
        $obj->invoke();
    #(array) Вернёт список ReflectionParameters:
        $obj->getParameters();

# ReflectionParameters:
	# Имя параметра
		$par->getName();
	# Тип параметра
		$par->getClass();
	# Может быть null или не обязателный
		$par->allowsNull();
	# Параметр - ссылка
    	$par->isPassedByReference();


# Классы
    # Создать экземпляр класса
        $obj->newInstance($a, $b);
    # Получить свойства
        $obj->getProperties();
    # Молучить методы
        $obj->getMethods();

?>    