import fetch from "node-fetch";

let user = {
  regUsername:  "hello",
  regPassword:  "123",
  regSPassword: "123"
}

const response = await fetch('http://127.0.0.1:3000/register', {method: 'POST', body: JSON.stringify(user)});
const body = await response.json();

console.log(body);