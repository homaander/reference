// Аргументы
var args = process.argv;

var command = args[0];

// Работа с файлами
const fs = require('fs');

fs.unlink()


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
var math = require('./math');

math.myCount();

function print() {
	console.log(`c равен ${a + b}`);
}

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
