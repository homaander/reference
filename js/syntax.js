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

// Вывод в консоль
    console.log("Hello World");

// Math
    console.log(Math.PI);
    console.log(Math.E);

    num = Math.round(10.3);
    num = Math.floor(10.3);
    num = Math.ceil(10.3);
    num = Math.random();

// Объекты
    var obj = {
        name: 'Andrew',
        age: 17,
        
        birthday: function () {
            this.age += 1;
        },
        
        toString: function () {
            return 'String';
        },
        
        valueOf: function () {
            return 10;
        }
    }

    var {x, y} = obj;

    x = foo.x;
    y = foo.y;


// Работа с массивами
    arr.forEach((item, i, arr) => {
        console.log(item);
    });
    
    arr2 = arr.filter((item, i, arr) => {
        return true;
    });
    
    arr2 = arr.map((item, i , arr) => {
        return item + "!";
    })

// JSON
    // Перевод переменной в JSON
        JSON.stringify(varible);
    // Разбирает JSON в строку
        JSON.parse(json);

// Время
    var inter = setInterval(func, 1000);
    clearInterval(inter);
    
    var timeu = setTimeout(func, 1000);
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



if(true && true) {} else if (false) {} else {}

switch (key) {
    case 1: break;
    case 2:
        alert(2 + ', ');
        case 3:
            alert(3);
        break;
    default: break;
}

num = (true)? 1 : 2;



for(k=0; k<=arr.length; k++) {}
for(k=9; k<=12; k++) { continue; break; }

while(k < 10) {}
do {} while(k < 10);


const a = 10;

let obj = {
    name: 'Andrew',
    age: 17,
    birthday: function () {
        console.log('Birth day!!!');
    }
}

function Test(name, age) {}
function Test(a, b) { return a + b }
function User(name) {
    this.Name = name;
    this.Age;
    this.SayName = function() {return this.Name}
}
Obj = new User("Andrew");
Obj.SayName();

//Короткий вариант + не создаёт контекст this
    (name, age) => { console.log(name) }





