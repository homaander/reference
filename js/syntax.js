// Константа
    const a = 10;

// Переменные
    // Глобальная переменная
    var a = 10;

    // Переменная в скобочках (локальная)
    let a = 100;
    let b = 0.1;
    let c = true;

    let str = "This is text";
    let str = 'This is text';
    let str = `Var:  ${a}`; // Раскрытие переменной
    let str = `
        Многострочная переменная
    `;

    // Массив
    var arr = new Array(1,3,5,7,9);
    var arr = [1, 3, 7, 38];

    // Объявить несколько переменных
    var a = 1, b = 2;

    // Двойное равенство
    var a = b = 1;

    // Удалить переменную
    delete a;



// Вывод в консоль
    console.log('Hello World');
    console.error('Errorr')
    console.warn('Warning')

    console.log('Arr:', arr);

    console.group('Statuses:');
        console.log('First:  ok');
        console.log('Second: ok');
    console.groupEnd();



// Арифметика
    // Присваевание суммы
    c = a + b;
    // Добавить к переменой
    a += 10;
    // (Использовать и) увеличить\уменьшить на 1
    a++;
    a--;
    // Увеличить\уменьшить на 1 (и использовать)
    ++a;
    --a;
        

    // Математические константы
    console.log(Math.PI);
    console.log(Math.E);

    // Случайное число от 0 до 1
    num = Math.random();


    // Округление
        // К ближайшему (0.5 - к большему)
        num = Math.round(10.3);

        // К меньшему
        num = Math.floor(10.3);

        // К большему
        num = Math.ceil(10.3);


// Работа с массивами
    // Перебор массива
    arr.forEach((item, i, arr) => { console.log(item); });
    
    // Собственный фильтр (добовляет, если результат true)
    arr2 = arr.filter((item, i, arr) => { return true; });
        
    // Редактирование элементов массива
    arr2 = arr.map((item, i, arr) => { return item + "!"; });
    
    // Добавить элементы в массив
    arr.push(1,3,"new el");
    
    // Удалить последний элемент, вернув его значение
    arr.pop();



// Время
    // Интервал воспроизведения функции
    var inter = setInterval(func, 1000);
    // Завершить интервал
    clearInterval(inter);
    
    // Выполнить функцию через время
    var timeu = setTimeout(func, 1000);
    // Отменить выполнение
    clearTimeout(timeu);



// Строки
    // Проверка на содержание lol в str
    if (str.includes('lol')) {}

    str = str.substring(5,7);       // Подстрока по номеру символа
    str = str.toUpperCase();        // Вурхний регистр
    str = str.toLowerCase();        // Нижний регистр

    str = str.slice(4,-6);          // Вырезать подстроку с 4 до 6 с конца
    str = str.slice(-8,6);          // Вырезать подстроку с 8 c конца 6 символов

    // Регулярные выражения
        var re = new RegExp(a + "lol", "gim");
        
        // Замена по регулярному выражению 
        str = str.replace(/is l.l lo+l lu?l la*l (lol)* \[/gi, "don\’t $1");

        // Поиск в строке
        str = str.search(/\D/);
        // Сопоставления по рег выражению
        matches = str.match(/s/)

    // Перевод из 10 в 2 СС
    str = num.toString(2);

    // Превод из 2 в 10 СС
    num = parseInt(str, 2);

    // Разбить строку в массив по символу
    arr = str.split(" ");

    // Длинна строки
    count = str.length;



// Условия
    if (true && true) {}
    else if (false) {}
    else {}

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
    for (let k=0; k<=arr.length; k++) {}
    for (let k=9; k<=12; k++) { continue; break; }

    // Пройти свойства объекта
    for (let key in obj) {
        // Не заходить в прототип
        if (!obj.hasOwnProperty(key)) continue;
    }

    while (k < 10) {}

    do {} while(k < 10);



// Функции
    function Test() {}
    function Test(a, b) { return a + b; }

    // Изменить прототип функции
    Test.bind(obj)();

    //Анонимная фунукия
    var a = (name, age) => { console.log(name) };
    a();



// Объекты
    // var obj = new Object();

    // 1 Прямое создание объекта
        var obj = {
            // Свойства
            name: 'Andrew',
            age:  17,
            
            // Свои методы
               birthday: function () { this.age += 1; },

            // Системные методы
                // Если объект приводят к строке
                toString: function () { return 'String'; },
                
                // Если объект приводят к числу
                valueOf: function () { return 10; }
        };

        // Вывод свойства
        console.log(obj.name || 'Ненайдено');

        console.log(obj['name']);
        console.log(obj[name]);

        // Вызов метода
        obj.birthday();

        // Изменение\добовление свойства\метода
        obj.my_prop = 'hello';
        obj.my_fun = function() { return 10; };

    // 2 Конструктор объекта
        function User(name, age) {
            this.name = name;
            this.age  = age;

            this.getInfo = function() {};
        }

        const obj = new User('Andrew', 18);


    // 3 С добовлением прототипа
        // Создать объект и назначить ему прототип
        let child = Object.create(obj);

        // 
        const obj = Object.create(
            { 
                getInfo() { console.log(this.name) }
            },

            {
                name: {
                    value: 'Andrew',

                    // Показывать в for
                    enumerable: true,

                    // Возможность изменять
                    writable: true,

                    // Можем удалять (delete obj.name)
                    configurable: true
                },

                birthday: {
                    value: 2002;
                },

                age:  {
                    get() {
                        return new Date().getFullYear() - this.birthday;
                    },
                    set(value) {
                        this.birthday = new Date().getFullYear() - this.age;
                    }
                }
            }
        );


    // 4 Классы
        class Animal
        {
            // Приватное свойство
            #name = 'lol';

            // Вызывается как Animal.count
            static count = 0;

            // Доступно как свойство ageInfo
            get ageInfo() { return this.age * 7; }
            set ageInfo(value) { this.age = value / 7; }

            getInfo() {
                console.log(this.name, this.age);
            }

            constructor(name, age) {
                this.name = name;
                this.age = age;
            }
        }

        class Cat extends Animal
        {
            constructor(name, age, color) {
                super(name, age);
                this.color = color;
            }

            getInfo() {
                super.getInfo();
                console.log('mya');
            }
        }

    // Создание объекта класса
    let obj = new User('Andrew', 17);
    let obj = new Animal();

    Animal.prototype.NewMethod = function() {};
    // Будет доступен у всех объектов
    Object.prototype.myMethod = function() {};

    // Проверка совпадения с конструктором
    if (obj instanceof User) {}

    // Создание переменных x и y равных obj.x и obj.y соответcтвенно
    let {x, y} = obj;



// JSON
    // Перевод переменной в JSON
    JSON.stringify(varible);
    // Разбирает JSON в строку
    JSON.parse(json);



// Асинхронность
    // Promises (Обещания)
    // Выполняет асинхронный код, и вызывает then своего объекта, для понимания кода того,
    // что асинхронный код выполнен и получены данные

    const prom = new Promise((resolve, reject) => {
        // Не имеет смысл писать тут синхронный код, например fetch

        setTimeout(() => {
            let user = { age: 17 };

            // Промис не будет создан, будет вызвана ошибка
            if (user.age > 17) reject(user);

            // Означает, что обещание выполнено, передаём 'user' дальше
            resolve(user);
        }, 2000);
    });

    // Когда обещание выполнено (вызвана resolve())
    prom.then(data => {
            return new Promise((resolve, reject) => {
                setTimeout(function() {
                    data.age = 17;
                    console.log('modified');
                    resolve(data);
                }, 2000);
            });
        })
        .then(data => {
            console.log('modified 2');
            data.birthday = 2020 - data.age;
            return data;            
        })
        .then(data => console.log('complited', data))

        // Когда обещание не выполнено (вызвана reject())
        .catch(err => console.log('Error:', err))
        // В любом случае
        .finaly(() => console.log('В любом случае'));

    // Ждёт выполнения всех обещаний из списка
    Promise.all([prom, prom2])
        .then()
        .catch()
        .finaly();

    // Ждём выполнения хотя-бы одного обещания из списка
    Promise.race([prom, prom2])
        .then()
        .catch()
        .finaly();

    // async/await
        // Старый код
        function get() {
            return new Promise((resolve, reject) => {
                resolve('hello');
            });
        }

        // async/await
        async function get() {
            return 'hello';
        }

    // Examples:
    const delay = ms => new Promise(r => setTimeout(r, ms));
    const url = 'http://localhost:8000/jj.php';

        // Promise style:
            function fetchContent() {
                return delay(2000)
                    .then(() => fetch(url))
                    .then(res => res.json());
            }

            fetchContent()
                .then(data => console.log(data))
                .catch(e => console.log(e));

        // Async/Await style:
            async function fetchAsyncContent() {
                await delay(2000);
                const res  = await fetch(url);
                const data = await res.json();
                console.log(data);
            }

            fetchAsyncContent();
