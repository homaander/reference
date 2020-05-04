$(document).ready(() => {});
$(() => {});

// CSS Селекторы
	let foo = $('.class');
	let foo = $('#id');


$(this).html('new html');
$(this).css('color', 'green');
$(this).val('new value');


$(this).addClass('new');
$(this).removeClass('new');

$(this).parent();
$(this).parents();

$(this).children('li');

$(this).closest('ul');

$(this).find('h1');

$(this).prev();
$(this).prev('h3');

$(this).next();
$(this).next('h3');

$(this).siblings();
$(this).siblings('.selected');

// Скрыть эелменты
	$(this).hide();
// Показать элементы
	$(this).show();


// События
	// Добавить событие клика
		$('#button').on('click', function () {})

	// Добавить события на все элементы блока по селектору
		$(document).on(
			'click',
			'input[type="button"][value!="+"]', 
			function () { $(this).html('ok'); }
		);

$('p:last')
	// Склонировать
		.clone()
	// Вставить после
		.insertAfter('p:last');

// Удалить элемент
	$('p:last').remove();

// Загрузить данные из ссылки
	$('#id').load('test.php .block ul');

// Отправить форму
	$('#form').submit();


// Cookie
	// Создать
		$.cookie('name', 'value', { expires: 7, path: '/' });
	// Читать
		let foo = $.cookie('name');
	// Удалить
		$.cookie('name', null);


// AJAX
	$.ajax({
	    url: 'app.php',
	    method: 'post',

	    data: {
	      	name: 'Andrew',
	      	age: 17
	    },

	    success: function(result) {
	      $('#weather-temp').html('<strong>' + result + '</strong>');
	    }
	});

// FancyBox
	$.fancybox.open(html);
