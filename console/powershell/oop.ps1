# Классы
class A {
    # Статическое свойство
    static [string] $info = "Просто класс"

    # Статический метод
    static [void] method() {
        Write-Host "Hello world"
    }

    # Используется только внутри класса
    hidden [int] $count = 0

    [int]     $age
    [string]  $name

    [DateTime] $bitrth

    # Конструктор
    A([string] $name) {
        $this.name = $name
    }

    # Перегрузка конструктора
    A([string] $name, [int] $age) {
        $this.name = $name
        $this.age  = $age
    }

    [int]sum([int] $a, [int] $b) {
        return $a + $b
    }
}

# Наследование
class B : A {
    B([string] $name, [int] $age, [int] $lol) : base($name, $age) {
        $this.name = $name
        $this.age  = $age
    }

    [int] sum([int] $a, [int] $b) {
        return ([A] $this).sum($a, $b);
    }

    [string] info() {
        return "OK"
    }
}

# Создание объекта
    $obj = New-Object A
    [A] $obj = [A]::new()

# Статические свойства
    [A]::info
    $obj::info

# Статические методы
    [B]::foo()

# Свойства
    $obj.name = "Andrew"
    $obj.name
    $obj['name']

# Методы
    $obj.info()

# Обработка
$obj | ForEach-Object { $_ }
$obj | Select-Object Name, Age
$obj | Where-Object {$_.name -eq "Andrew"} | Select-Object Age
