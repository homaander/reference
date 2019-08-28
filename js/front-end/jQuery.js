// Подключение
// <script src="scripts/jscript.js"></script>

// 
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
$('#button_rem').on('click', b_rem);

$(document).on('click', 'input[type="button"][value!="+"]');

$('#id').load('test.php');


function b_add() {
	$('p:last').clone().insertAfter('p:last');
}

function b_rem() {
	$('p:last').remove();
}


// AJAX
$.ajax({
    url: 'app.php',
    method: 'post',
    data: {
      	name: 'Andrew',
      	age: 17
    },

    success: function( result ) {
      $( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
    }
});

$.post(
    'app.php',
    {
        id: $(this).prop('id'),
        status: $(this).prop('checked')
    }
);

