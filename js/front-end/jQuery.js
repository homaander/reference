// Подключение
// <script src="scripts/jscript.js"></script>

$(document).ready(() => {});
$(() => {});

$('#id').html('hello world!');
$('#id').css('color', 'green');


$('#id').addClass('new');

$('#id').parent();
$('#id').parents();

$('#id').children();

$('#id').closest('ul');

$('#id').find('h1');

$('#id').prev();
$('#id').prev('h3');

$('#id').next();
$('#id').next('h3');

$('#id').siblings();
$('#id').siblings('.selected');

var obj = $('#obj');
obj.hide();
obj.show();


$('#button').on('click', () => {})

$(() => {
	$('#button_add').on('click', b_add);
	$('#button_rem').on('click', b_rem);

	$(document).on('click', 'input[type="button"][value!="+"]');

	//AJAX
	$('#id').load('test.php');

	$.ajax({

	}).done((data) => {
		
	});
})

function b_add() {
	$('p:last').clone().insertAfter('p:last');
}

function b_rem() {
	$('p:last').remove();
}


// AJAX
$.ajax({
    url: "/api/getWeather",
    data: {
      zipcode: 97201
    },
    success: function( result ) {
      $( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
    }
});
