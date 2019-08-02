// Аргументы
var args = process.argv;

// Работа с файлами
const fs = require('fs');

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
