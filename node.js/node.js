// Аргументы
	var args = process.argv;
	var command = args[0];



// Чтение строки
	const readline = require('readline');

	const rl = readline.createInterface({
	  input: process.stdin,
	  output: process.stdout
	});

	rl.question('What do you think of Node.js? ', (answer) => {
	  console.log(`Thank you for your valuable feedback: ${answer}`);

	  rl.close();
	});



// Пути
	console.log(__dirname);
	console.log(__filename);

	const path = require('path');

	console.log(path.parse(__filename));
	console.log(path.join(__dirname, 'name'));



// Работа с файлами
	const fs = require('fs');

	// Callback style
		// Создать папку
			fs.mkdir(path.join(__dirname, 'name'), (err) => {
				if (err)
					throw err

				console.log('Каталог создан');
			});

		// Запись
			fs.writeFile(fileP, 'Hello', err => {
				if (err)
					throw err

				console.log('Файл Записан');
			})

			fs.appendFile(fileP, 'Hello', err => {
				if (err)
					throw err

				console.log('Файл Записан');
			})

		// Чтение
			fs.readFile(fileP, 'utf-8', (err, data) => {
				if (err)
					throw err

				console.log(data);
			});

	// Async style
		fsPromises = fs.promises;

		async function test() {
			await fsPromises.mkdir('test');
			await fsPromises.rmdir('test');

			await fsPromises.writeFile('test.txt', 'Hello');
			await fsPromises.appendFile('test.txt', 'Hello');

			let data = await fsPromises.readFile('test.txt', 'utf-8');

			fsPromises.unlink('tese.txt');
		}



// Потоки
	let myReadShort = fs.createReadStream(__dirname + '/test.txt', 'utf-8');
	let myWriteShort = fs.createWriteStream(__dirname + '/test2.txt', 'utf-8');

	myReadShort.on('data', function(chunk) {
		console.log('Новые данные: ' + chunk);

		myWriteShort.write(chunk);
	});

	// Перенаправления потока
	myReadShort.pipe(myWriteShort);




// События
	const events = require('events');

	class A extends events.EventEmitter {
		constructor(name) {
			super();
			this.name = name;

			this.on('go', () => {
				console.log('go');
			});
		}
	}

	const obj = new A();

	// Создать событие
	obj.on('event', () => {
	  console.log('an event occurred!');
	});

	obj.on('test', (text) => {
	  console.log(text);
	});

	// Вызов
	obj.emit('go');
	obj.emit('event');
	obj.emit('test', 'hello world!');



// Свои модули
	// Создание
	module.exports.get = () => {
		console.log('get');
	};

	module.exports = {
		name: 'andrew',
		age: 17,
		callback: () => {
			console.log('KEK');
		}
	}


	// Подключение
	const math = require('./math');
	const {a, b} = require('./vars')
	const data = require('data.json');


	math.myCount();
