// Переменные
    // Целочисленная переменная
        var num = 100;
    // Переменная с плавающей запятой
        var num = 0.1;
    // Строковая переменная
        var str = "This is text";
    // Массив
        var arr = new Array(1,3,5,7,9);
        var arr = [1, 3, 7, 38];

    // Объявить несколько переменных
        var
            a = 1,
            b = 2;
    // Двойное равенство
        var a = b = 1;

    // Константа
        const a = 10;

    // Переменная в скобочках (локальная)
        let a = 10

// Вывод в консоль
    console.log("Hello World");

// Math
    // Математические константы
        console.log(Math.PI);
        console.log(Math.E);

    // Округление к ближайшему (0.5 - к большему)
        num = Math.round(10.3);
    // Округление к меньшему
        num = Math.floor(10.3);
    // Округление к большему
        num = Math.ceil(10.3);

    // Случайное число от 0 до 1
        num = Math.random();

// Объекты
    var obj = {

        // Поля
        name: 'Andrew',
        age: 17,
        
        // Системные методы
            // Если объект приводят к строке
                toString: function () {
                    return 'String';
                },
            
            // Если объект приводят к числу
                valueOf: function () {
                    return 10;
                },

        // Методы
        birthday: function () {
            this.age += 1;
        }
    };

    // Создание переменных x и y равных obj.x и obj.y соотвецтвенно
        var {x, y} = obj;

    console.log(obj.name);
    obj.birthday()


// Работа с массивами
    // Перебор массива
        arr.forEach((item, i, arr) => {
            console.log(item);
        });
    
    // Собственный фильтр (добовляет, если результат true)
        arr2 = arr.filter((item, i, arr) => {
            return true;
        });
        
    // Редактирование элементов массива
        arr2 = arr.map((item, i, arr) => {
            return item + "!";
        });

// JSON
    // Перевод переменной в JSON
        JSON.stringify(varible);
    // Разбирает JSON в строку
        JSON.parse(json);

// Время
    // Интервал воспроизведения функции
        var inter = setInterval(func, 1000);
    // Завершить интервал
        clearInterval(inter);
    
    // Выполнить функцию через время
        var timeu = setTimeout(func, 1000);
    // Отменить выполнение
        clearTimeout(timeu);

if(str.includes('lol')){}

str = str.substring(5,7);       //Позстрока по номеру символа
str = str.toUpperCase();        //Вурхний регистр
str = str.toLowerCase();        //Нижний регистр
str = str.slice(4,-6);          //

var re = new RegExp(a + "lol", "gim");
str = str.replace(/is l.l lo+l lu?l la*l (lol)* \[/gi, "don\’t");
str = str.search(/\D/);

str = num.toString(2);

arr = str.split(" ");
arr.push(1,3,"new el");
arr.pop();

count = str.length;


// Условия
if(true && true) {} else if (false) {} else {}

num = (true)? 1 : 2;

switch (key) {
    case 1: break;
    case 2:
        alert(2 + ', ');
        case 3:
            alert(3);
        break;
    default: break;
}



// Циклы
for(k=0; k<=arr.length; k++) {}
for(k=9; k<=12; k++) { continue; break; }

while(k < 10) {}
do {} while(k < 10);



function Test(name, age) {}
function Test(a, b) { return a + b }
function User(name) {
    this.Name = name;
    this.Age;
    this.SayName = function() {return this.Name}
}
Obj = new User("Andrew");
Obj.SayName();

//Анонимная фунукия
    var a = (name, age) => { console.log(name) };
