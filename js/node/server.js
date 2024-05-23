// Common
	const http = require('http');

	const server = http.createServer((request, response) => {
		// Роутинг
		if (request.url === '/') 
			response.end('Index');
		
		// Для CSS и JS файлов нужна проверка для правельного Content-Type:
		// Текст - text/plain
		// JS    - text/javascript
		// CSS   - text/css
		// JSON  - application/json

		response.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'});

		// Отдать в поток напрямую
			response.end('error');

		let myReadShort = fs.createReadStream(__dirname + '/test.html', 'utf-8');

		// Перенаправить поток в браузер (пачками)
			myReadShort.pipe(res);
	});

	server.listen(3000, 'locahost');



// MySQL DB
	var mysql      = require('mysql');

	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'dbuser',
	  password : 's3kreee7'
	});

	connection.connect();

	connection.query('SELECT 1 + 1 AS solution', function(err, rows, fields) {
	  if (err) throw err;
	  console.log('The solution is: ', rows[0].solution);
	});

	connection.end();



// Express
	const express = require('express');
	const bodyParser = require('body-parser');

	let app = express();

	app.set('views', __dirname);
	app.set('view engine', 'pug');



	let userRouter = require('./routers/user');

	// ./routers/user.js:
		let express = require('express');
		let router = express.Router();

		router.get(/*...*/);

		module.exports = router;


	app.use('/user', userRouter);

	// Использовать контроллер статических файлов для папки assets
	app.use(express.static('assets'));



	app.get('/', function(request, response) {
		response.sendFile(__dirname + 'file.txt');
	});

	app.get('/news/:id', function (request, responce) {
		responce.send('ID = ' + request.params.id);
	});

	app.get('/view/:id', function (request, responce) {
		responce.render('view', {
			title: 'Views'
		});
	});



	// Обработка запросов
	// GET
	app.get('/page/:id', function(request, response) {
		console.log(request.query);

		response.send('ok');
	});


	// POST
	let urlParser = bodyParser.urlencoded({ extends: false }); 

	app.post('/api/get', urlParser, function(request, response) {
		console.log(request.body);

		response.send('ok');
	});



	// Запуск сервера
	app.listen(3000);
