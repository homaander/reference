//P0.write(1);
//P1.write(1);
//P2.write(1);
//P3.write(1);

require("@amperka/KeyPad").connect([P7, P6, P5, P4], [P3, P2, P1, P0], function(e) {
  print("3412"[e]);
});

//setInterval(() => {
  //console.log(analogRead(P0), analogRead(P1), analogRead(P2), analogRead(P3));
  //console.log(analogRead(P4), analogRead(P5), analogRead(P6), analogRead(P7));
//}, 200);

//var lcd = require("HD44780").connect(P8,P9,P2,P3,P4,P5);
//var a = 0;

//lcd.setCursor(0,0);
//lcd.print("Hello");

//setInterval(() => {
  //lcd.setCursor(0,1);
  //lcd.print(a + "");
  //a++;
//}, 1000);

//var kb = require('@amperka/usb-keyboard');
var button = require('@amperka/button').connect(P1);

//button.on('press', function() {
//  kb.type("Hello world!");
//});

//var led = require('@amperka/led').connect(P1);

//led.turnOn();

//var button = require('@amperka/button').connect(P2);
//var buzzer = require('@amperka/buzzer').connect(P3);

//button.on('press', function() {
//  led.turnOn();
//  buzzer.turnOn();
//});

//button.on('release', function() {
//  led.turnOff();
//  buzzer.turnOff();
//});

//setInterval(function() {
//  led.brightness(pot.read());
//}, 500);

//var servo = require("@amperka/servo").connect(P8);
//var sonic = require("@amperka/ultrasonic")
//  .connect({trigPin: P10, echoPin: P9});
//var pot = require('@amperka/pot').connect(A0);

//setInterval(function() {
//  let angle = 180 * pot.read();
//  servo.write(angle);
//  //print(pot.read());
//}, 20);

//setInterval(function() {
//  sonic.ping(function(err, val) {
//    if (err) {
//      console.log(err.msg);
//    }
//    else {
//      console.log(val, 'mm');
//    }
//  }, 'mm');
//}, 100);


//var ir = require("@amperka/ir-receiver").connect(P1);
//var led = require("@amperka/led").connect(P2);

//led.brightness(0.1);

//ir.on("receive", function(code, repeat) {
//  if (!repeat)
//    if (code.toString(16) == "1689d02f") {
//      led.toggle();
//    }
//});