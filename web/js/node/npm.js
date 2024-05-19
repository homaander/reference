// Fetch
// npm install --save node-fetch
    const fetch = require('node-fetch');

// WebSocket
// npm install --save ws
    const WebSocket = require('ws');
    const server = new WebSocket.Server({ port: 3000 });

    // Прослушка подключения
    server.on('connection', ws => {

        // При получении сообщения из браузера
        ws.on('message', message => {

            if (message == 'exit')
                // Закрыть соединение с данным пользователем
                ws.close();


            // Перебрать всех подключённых пользователей
            server.clients.forEach(client => {
                console.log(message);

                // Если подключение с этим пользователем открыто
                if (client.readyState === WebSocket.OPEN)
                    // Послать ему сообщение
                    client.send('message');
            })
        });

        // Отправить сообщение в браузер
        ws.send('hello world');
    });
