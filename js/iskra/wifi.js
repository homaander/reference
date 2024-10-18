var serial = Serial1;
serial.setup(115200, {rx:B7, tx: B6});

var SSID = 'homaander';
var PSWD = 'cdswifi2002';

var http = require('http');
var wifi = require('ESP8266WiFi_0v25');

let net = wifi.connect(serial, function(err){
    net.connect(SSID, PSWD, function(err){
        http.get('hhttp://www.pur3.co.uk/hello.txt', function(res){
            var str = '';
            res.on('data', function (chunk) {
              str += chunk;
            });
            res.on('end', function () {
              print(str);
            });
        });
    });
});