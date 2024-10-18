
I2C1.setup({ scl : SCL, sda: SDA });



setInterval(() => {
  let arr = {
    128: {8: "1", 4: "2", 2: "3", 1: "A"},
    64: {8: "4", 4: "5", 2: "6", 1: "B"},
    32: {8: "7", 4: "8", 2: "9", 1: "C"},
    16: {8: "*", 4: "0", 2: "#", 1: "D"},
  }
  I2C1.writeTo(0x20, 0b11110000);
  a = 240 - I2C1.readFrom(0x20, 1);
  I2C1.writeTo(0x20, 0b00001111);
  b = 15 - I2C1.readFrom(0x20, 1)[0];
  
  if (a && b)
    console.log(arr[a][b])
}, 100);
