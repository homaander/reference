window.onload = setup;

setInterval(update, 500);

function encodeStr(rawStr) {
    return rawStr.replace(/[\u00A0-\u9999<>\&]/g, function(i) {
        return '&#'+i.charCodeAt(0)+';';
    });
}

code_highlight.onclick = () => {
    code.focus();
}

code_run.onclick = () => {
    let text = code.value;
    let v,s;

    result.value = '';

    while(v=/^((?:[^\\\/]|\\.)*)\/((?:[^\\\/]|\\.)*)\/((?:[^\\\/]|\\.)*)\//.exec(text)) {
        text = text.slice(v[0].length);
        v = v.map(text => text.replace(/\\(.)/g,"$1"));
        result.value = result.value + (v[1]);
        console.log(v);
        s=true;
        while(s) s=false,text=text.replace(v[2],()=>(s=true,v[3]));
    }
    // 
    result.value = result.value + text.replace(/\\(.)/g,"$1");
    //result.value = result.value + (text.replace(/\\([^])/g,(y,x)=>x=="/"?"":x).replace(/\/[^]*$/,""));
}

function setup() {
    update();
    for (let i = 0; i < 200; i++) numbers.innerHTML = numbers.innerHTML + i + '<br>';
}

function update() {
    let text = encodeStr(code.value);
    code_highlight.innerHTML = highlight(text);
}

let list_default = [
    {'color': 'blue', 'words': ['if', 'for', 'while']},
    {'color': 'pink', 'words': ['foreach']},
];

let list_slashes = [
    // {style: 'color: #555',           regs: ['( -&#62; )', '(\n= )']},
    {style: 'color: #FF0000',        regs: ['(\\/\\[[a-zA-Z0-9\\-\\+_!:{}]+\\^\\/\\[[a-zA-Z0-9\\-\\+_!:{}]+\\]\\[[a-z]+\\/)']},   // Строка умножения функции
    {style: 'color: #5555FF;'
       +    'font-weight: bold;',    regs: ['(?<!\\^\\/)(\\[[a-zA-Z0-9\\-\\+_!:{}]+?\\])']},    // Функция
    {style: 'color: #FBB917;',       regs: ['(\\@[a-zA-Z0-9!:\\-\\+_{}]+?\\;)']},               // Фикс
    {style: 'color: #5555FF',        regs: ['(\\[\\])']},                                       // Замена 2 порядка
    {style: 'color: #46C7C7',        regs: ['(?<!&)(#[^\\/ ]*?&#62;)']},                        // Указатель >
    {style: 'color: #46C7C7',        regs: ['(&#60;[^\\/ ]*?(?<!&)#)']},                        // Указатель <
    {style: 'color: #AAAAFF;'
      +     'font-weight: bold;',    regs: ['(&#60;[a-zA-Z0-9!:\\-\\+_{}]+?&#62;)']},           // Интерфейс
    {style: 'color: #AAAAFF',        regs: ['(&#60;&#62;)', '(\\\*\\\*)']},                     // Замена 3 порядка
    {style: 'color: #777',           regs: ['(?<== +)(\\/[^\\/]+\\/\\/)'],},                    // Коментарий
    {style: 'color: pink',           regs: ['(\\\\\\\\)', '(\\\\\\\/)']},                       // Замена 1 порядка
    {style: 'color: #55FF55',        regs: ['({[a-zA-Z0-9\\-\\+_!\\\\:]+?})',
                                            '(?<!\\[[a-z]+)(\\^+)']},                           // Переменные и счетчик
];

let highlight_list = [
    // ...list_default
    ...list_slashes
];

function highlight(text) {
    highlight_list.forEach((o) => {
        let style = o.style;
        let re;

        if (o.words) {
            let list = o.words.join('|');
            re = new RegExp(`(?<=\\s|\n)(${list})(?=\n|\\s)`, "g");

            text = text
                .replace(re, `<span style='${style}'>$1</span>`)
        }

        if (o.regs) o.regs.forEach((v) => {
            re = new RegExp(v, "g");

            text = text
                .replace(re, `<span style='${style}'>$1</span>`)
        })
    });

    text = text.replace(/( -&#62; )/g, "<span style='color: #555'>•-&#62;•</span>");
    text = text.replace(/(\n= )/g, "<span style='color: #555'>\n=•</span>");

    return text;
}