PrimaryI2C.setup({sda: SDA, scl: SCL});
var lcd = require("HD44780").connectI2C(PrimaryI2C, 0x27);

//PrimaryI2C.writeTo(0x27, 0x08);
// PrimaryI2C.writeTo(0x38, 0x00);

lcd.print("Hello Amperka");
lcd.setCursor(0, 1);
lcd.print("Do It Yourself");
lcd.setCursor(0, 2);
lcd.print("LCD Screen 20x4");
lcd.setCursor(0, 3);
lcd.print("www.Amperka.ru");

