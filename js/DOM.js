// AJAX
  // Promise style:
  function getAJAX() {
    fetch('url', { 
      method: 'POST',
      headers: {
        //
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: 'qwe=1&ewe=2'
    })
      .then(response => response.text())
      // .then(response => response.json())

      .then(result => console.log(result));
  }

  // Async/Await style:
  async function getAJAXAsync() {
    const response = await fetch('url', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: 'data=' + JSON.stringify(data)
    });

    if (!response.ok) return false;

    const result = await response.text();
    console.log(result);
  }


// Cookie
  function getCookie(name) {
    console.log(document.cookie);

    document.cookie.replace(/.*?=(.*?)(;|$).*/g, '$1')

    return document.cookie;
  }

  function setCookie(name, value) {}


// WebSocket
  // Подключение
  const ws = new WebSocket('ws://localhost:3000');

  // При успешном подключении
  ws.onopen = () => console.log('hello');
  // При закрытии подключения
  ws.onclose = () => console.log('good bye');

  // При получении сообщения 
  ws.onmessage = response => console.log(response.data);

  // Отправить сообщение
  ws.send('from browser');


// Поиск элементов
  // По id
    let obj1 = document.getElemetnById("go");
  // По классу
    let obj2 = obj.getElemetnByClass("buttons");
  // По тегу
    let obj3 = obj.getElemetnByTagName("p");

  // По CSS селектору (первый элемент)
    let obj4 = document.querySelector('#id');
  // По CSS селектору (все)
    let obj5 = document.querySelectorAll('ul > li:last-child');

// Проверка, совподает ли элемент с CSS
  obj.matches('li{first}');

alert("Привет, мир");        // Диалоговое окно с текстом
str  = prompt("Введите число: ");  // Запрос текста
bool = confirm("Вы уверянны?");    // Логическое диалоговое окно

window.resizeTo(400, 400);

// Открыть окно без меню
  window.open('http://php.net',
    '_blank',
    'menubar=no,width=200,height=100,top=0,left=0'
  );

document.documentElement.scrollTop;

clipboardData.setData('text', 'lool');
clipboardData.getData('text');


window.onload     = () => {};

// Левый клик
obj.onclick     = e => {};

// Правый клик
obj.oncontextmenu = e => {};


obj.onmousemove = e => {};
obj.onmousedown  = e => {};
obj.onmouseup  = e => {};
obj.onmouseover = e => {};
obj.onmouseout   = e => {
  e.srcElement;
  e.type;    // mousemove
  e.clientX;
  e.clientY;

  e.altKey;
  e.ctrlKey;
  e.shiftKey;
};

obj.onkeyup    = e=> {};
obj.onkeydown  = e=> {};
obj.onkeypress = e=> {
  if (e.key == "W") {};
};

// Обычное поведение
  e.preventDefault();

var obj  = element.parentElement;
var data = element.firstChild.innerHTML;
var data = element.lastChild.innerHTML;

var arr  = element.ChildNodes;

// Тег select
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
