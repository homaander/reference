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
