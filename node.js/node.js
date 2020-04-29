// Аргументы
	var args = process.argv;
	var command = args[0];


// Сервер
	const http = require('http');

	const server = http.createServer((request, response) => {
	console.log(request.url);

	// example
	let filePath = path.join(__dirname, 'tpl', (request.url === '/')? 'index.html' : `${request.url}.html`)

	fs.readFile(filePath, (err, data) => {
			if (err) {
				fs.readFile(path.join(__dirname, 'tpl', 'e404.html'), (err, err_data) => {
					if (err) {
						response.writeHead(500);
						response.end('error');
					} else {
						response.writeHead(404, {
							'Content-Type': 'text/html'
						});

						response.end(err_data);
					}
				});
			} else {
				response.writeHead(404, {
					'Content-Type': 'text/html'
				});

				response.end(data);
			}
		});
	});

	server.listen(3000, () => {
		console.log('Server has been started...');
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

			await fsPromises.writeFile('test.txt', 'Hello');
			await fsPromises.appendFile('test.txt', 'Hello');

			let data = await fsPromises.readFile('test.txt', 'utf-8');
		}

	fs.unlink();



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


	math.myCount();