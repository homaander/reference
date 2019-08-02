// AJAX
function ajaxGet(){
	fetch('test.php', { 
		method: 'POST',
		headers: {
			"Content-Type": 'application/x-www-form-urlencoded'
		},
		body: "qwe=1&ewe=2"
	}).then((response) => {
		return response.text();
		return response.json();
	}).then((result) => {
		console.log(result);
	});
}

// Cookie
function cookieGet(name) {
	
}

alert("Привет, мир");					//Диалоговое окно с текстом
str 	= prompt("Введите число: ");	//Запрос текста
bool 	= confirm("Да?");				//Логическое диалоговое окно

window.resizeTo(400, 400);
document.documentElement.scrollTop;

var obj = document.getElemetnByClass("buttons");
var obj = document.getElemetnById("go");

var child = obj.getElemetnByTagName("p");

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
	e.client[X\Y];

	e.[alt\ctrl\shift]Key;
	e.button;
};

obj.onkeyup = function(e){};
obj.onkeydown = function(e){};
obj.onkeypress = function(e) {
	e.key == "W";
};
e.preventDefault();							//Обычное поведение

var obj1 = element.parentElement;
var obj1 = element.[first\last]Child.innerHTML;
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




