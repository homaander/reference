// Переменные
	// Глобальная переменная
		var a = 10;

    // Константа
        const a = 10;

    // Переменная в скобочках (локальная)
        let a = 10



    // Целочисленная переменная
        let a = 100;

    // Переменная с плавающей запятой
        let b = 0.1;

    // Строковая переменная
        let str = "This is text";
		let str = 'This is text';
		let str = `Var:  ${num}`; // Раскрытие переменной
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



// Вывод в консоль
    console.log("Hello World");



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

	// Округление
    	// К ближайшему (0.5 - к большему)
        	num = Math.round(10.3);
    	// К меньшему
        	num = Math.floor(10.3);
    	// К большему
        	num = Math.ceil(10.3);

    // Случайное число от 0 до 1
        num = Math.random();



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

	str = str.substring(5,7);       // Позстрока по номеру символа
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

	// Перевод из 10 в 2 СС
		str = num.toString(2);

	// Превод из 2 в 10 СС
		num = parseInt(str, 2);

	// Разбить строку в массив по символу
		arr = str.split(" ");

	// Длинна строки
		count = str.length;



// Условия
	if(true && true) {}
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
for(k=0; k<=arr.length; k++) {}
for(k=9; k<=12; k++) { continue; break; }

while(k < 10) {}

do {} while(k < 10);



// Функции
	function Test(name, age) {}
	function Test(a, b) { return a + b }

	//Анонимная фунукия
    	var a = (name, age) => { console.log(name) };
		a();

// Объекты
    var obj = {
        // Свойства
        name: 'Andrew',
        age:  17,
        
        // Методы
       	birthday: function () { this.age += 1; },

        // Системные методы
            // Если объект приводят к строке
            toString: function () { return 'String'; },
            
            // Если объект приводят к числу
            valueOf: function () { return 10; }
    };

    // Создание переменных x и y равных obj.x и obj.y соотвецтвенно
   	var {x, y} = obj;

	obj = new Object();
	obj.my_prop = 'hello';
	obj.fun = function() { return 10; };

    console.log(obj.name);
    obj.birthday()

// Конструктор объекта
	function User(name, age) {
		this.name = name;
		this.age  = age;

		this.getInfo = function() {};
	}

	// Создание объекта
		let obj = new User('Andrew', 17);

	// Проверка совпадения с конструктором
		if (obj instanceof User) {}

// JSON
    // Перевод переменной в JSON
        JSON.stringify(varible);
    // Разбирает JSON в строку
        JSON.parse(json);



// Асинхронность
	// Promises (Обещания)
		const prom = new Promise(function(resolve, reject) {
			setTimeout(function() {
				console.log('work');

				let user = { name: 'Andrew' };

				if (user.name = 'Vitya') reject(user);

				// Означает, что обещание выполнено, передаём 'a' дальше
					resolve(user);
			}, 2000);
		});

		// Когда обещание выполнено (вызвана resolve())
			prom.then(function(data) {
				return new Promise(function(resolve, reject) {
					setTimeout(function() {
						data.age = 17;
						console.log('modified');
						resolve(data);
					}, 2000);
				});
			})
			.then(function(data) {
				console.log('modified 2');
				data.birthday = 2020 - data.age;
				return data;			
			})
			.then(function(data) {
				console.log('complited', data);
			})
			.catch(function(err) {
				console.log('Error:', err)
			})
			.finaly(function() {
				console.log('В любом случае');
			});
		
		// Ждёт выполнения всех обещаний
		Promise.all([prom, prom2])
		.then()
		.catch()
		.finaly();

		// Ждём выполнения хотя-бы одного
		Promise.race([prom, prom2])
		.then()
		.catch()
		.finaly();



	// Async \ Await
	



