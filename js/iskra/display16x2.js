var PIN_RS = P6;
var PIN_EN = P7;
var PIN_DB4 = P8;
var PIN_DB5 = P9;
var PIN_DB6 = P10;
var PIN_DB7 = P11;

var lcd = require("HD44780").connect(PIN_RS, PIN_EN, PIN_DB4, PIN_DB5, PIN_DB6, PIN_DB7);

lcd.setCursor(0, 0);
lcd.print("Counter:");

let a = 0;

setInterval(() => {
  a++;
  lcd.setCursor(0, 1);
  lcd.print("" + a);
}, 1000);

