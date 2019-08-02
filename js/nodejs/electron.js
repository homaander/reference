const {app, BrowserWindow} = require('electron');

const path = require('path');
const url  = require('url');

let win;

function createWindow() {
    win = new BrowserWindow({ width: 700, height: 500, icon: 'icon.png' });

    win.loadURL(url.format({
        pathname: path.join(__dirname, 'index.html'),
        protocol: 'file:',
        slashes: true
    }));

    win.loadFile('index.html');

    win.webContents.openDevTools();

    win.on('closed', () => {
        win = null;
    })
}

app.on('ready', createWindow);