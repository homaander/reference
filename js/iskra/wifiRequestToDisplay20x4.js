var serial = Serial1;
serial.setup(115200, {rx:B7, tx: B6});

//I2C1.setup({sda: B9, scl: B8});
//var lcd = require("HD44780").connectI2C(I2C1, 0x27);

//lcd.print("Hello Amperka");
//lcd.setCursor(0, 1);
//lcd.print("Do It Yourself");
//lcd.setCursor(0, 2);
//lcd.print("LCD Screen 20x4");

var SSID = 'homaander';
var PSWD = 'cdswifi2002';

var http = require('http');
var wifi = require('ESP8266WiFi_0v25');

let net = wifi.connect(serial, function(err){
  console.log(1, err);
    net.connect(SSID, PSWD, function(err){
      console.log(2, err);
        setInterval(() => {
          http.get('http://192.168.3.31', function(res){
              var str = '';
              res.on('data', function (chunk) {
                str += chunk;
              });
              res.on('end', function () {
                print(str);
                //gg(str);
              });
          });
        }, 10 * 1000);
    });
});

function gg(str) {
  //PrimaryI2C.writeTo(0x27, 0x08);
  // PrimaryI2C.writeTo(0x38, 0x00);

  lcd.setCursor(0, 3);
  lcd.print(str);
}