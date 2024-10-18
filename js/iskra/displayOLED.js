I2C1.setup({sda: B9, scl: B8, bitrate: 100000});

var lcd = require("SSD1306").connect(I2C1);;

function showTemperature(temp) {
  lcd.clear();
  lcd.setFontBitmap();
  lcd.drawString("Temp",1,0);
  lcd.drawLine(0,10,84,10);
  lcd.setFontVector(20);
  lcd.drawString("112",1,15);
  lcd.flip();

}

showTemperature();