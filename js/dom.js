// AJAX
	// Promise style:
	function ajaxGet() {
		fetch('test.php', { 
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			body: 'qwe=1&ewe=2'
		})
			.then(response => response.text())
			// .then(response => response.json())

			.then(result => console.log(result));
	}

	// Async/Await style:
	async function ajaxGetAsync() {
		const response = await fetch('test.php', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			body: 'qwe=1&ewe=2'
		});
		const result   = await response.text();
		console.log(result);
	}

	ajaxGetAsync();



// Cookie
	function cookieGet(name) {
		console.log(document.cookie);
	}



// Поиск элементов
	// Все элементы с классом
		var obj = document.getElemetnByClass("buttons");
	// Элемент с ID
		var obj = document.getElemetnById("go");
	// Все элементы тега
		var obj = obj.getElemetnByTagName("p");

	// Поиск по CSS селектору (первый элемент)
		var obj = document.querySelector('#id');
	// Все элементы подходящие по условию
		var obj = document.querySelectorAll('ul > li:last-child');

// Проверка, совподает ли элемент с CSS
	obj.matches('li{first}');

alert("Привет, мир");					//Диалоговое окно с текстом
str 	= prompt("Введите число: ");	//Запрос текста
bool 	= confirm("Да?");				//Логическое диалоговое окно

window.resizeTo(400, 400);
document.documentElement.scrollTop;


clipboardData.setData('text', 'lool');
clipboardData.getData('text');


window.onload = function(){};

obj.onclick = function(e){};
obj.oncontextmenu = function(e){};

obj.onmousemove = function(e){};
obj.onmousedown = function(e){};
obj.onmouseup = function(e){};
obj.onmouseover = function(e){};
obj.onmouseout = function(e){
	e.srcElement;
	e.type;		// mousemove
	e.clientX;
	e.clientY;

	e.altKey;
	e.ctrlKey;
	e.shiftKey;
	e.button;
};

obj.onkeyup = function(e){};
obj.onkeydown = function(e){};
obj.onkeypress = function(e) {
	e.key == "W";
};
e.preventDefault();							//Обычное поведение

var obj1 = element.parentElement;
var obj1 = element.firstChild.innerHTML;
var obj1 = element.lastChild.innerHTML;
var arr = element.ChildNodes;

//Тег select
selectObj.selectIndex;
selectObj.value;
var arr = selectObj.options;
selectObj.onchange = function(){};

// Все стили через тире пишутся как "первоеВторое" (2 слово с большой буквы)
// obj.style.[Стиль] = Значение;
obj.style.backgroundColor = 'red';

var obj = document.createElement("div");
	obj.className = "myClass";
map.appendChild(obj);
map.appendRemove(obj);
