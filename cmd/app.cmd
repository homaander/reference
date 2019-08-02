        set /p =Choose: "

    :: Двоичные операции (& - and; | - or; ^ - xor)
        set /a a=("9|7")

    :: Математические операции
        :: Сумма
            set /a sum=2+2
        :: Добавить 1
            set /a sum+=1

    :: Строковые операции
        :: Замена W на T в переменной
            echo %str:W=T%
        :: Подстрока с 1 сим. длинной 2
            echo %str:~1,2%
        :: Подстрока с 1 сим. до 2 с конца
            echo %str:~1,-2%

:: Перенапровление в/из файлов
    :: Чтение
        :: Чтение первой строки
            < test.txt set /p read =
        :: Вывод строки без перевода
            < nul set /p . = Text

    :: Запись
        :: Перезапись файла (единицу можно опустить)
            1> test.txt echo text
        :: Запись ошибки
            2> errs.txt set /a a=1/0
        :: Запись и ошибки и выхода в один файл
            > file.txt 2>&1
        :: Множественная запись
            > file.txt (
                echo 1
                echo 2
            )

        :: Новая строка в файле 
            >> test.txt echo text
        :: Запись строки без перевода
            < nul >> test.txt set /p . = Text

:: Управление программой
    :: Пауза на 3 секунды
        > nul timeout /t 3 /nobreak
    :: Ожидание нажания клавиши
        > nul pause
    :: Очистить консоль
        cls
    :: Завершить программу
        exit

    :: Цвет
        color f0
    :: Заголовок
        title app
    :: Размер консоли
        mode con: cols:100 lines:40

    :: Установка кодировки
        :: ANSI 1251
            chcp 1251
        :: UTF-8
            chcp 65100


:: Функции
    :: Объявить функцию
        :Point
    :: Объявить фукцию с коментариями к параметрам
        :Point [number][string]

    :: Имя функции / файла скрипта
        echo %0
    :: Аргументы
        echo %1 %2 %*
    :: Перейти к коду функции без возврата
        goto Point
    :: Вызов исполняемого файла с параметрами
        call Test 123 "text"
    :: Вызов функции с параметрами
        call :Point  123 "text"
    :: Конец функции
        exit /b

    :: Команда в переменной
        set "com=Echo Test"
        %com%

    :: Содержимое файла
        type test.txt
    :: Путь к файлу app
        where app

:: Работа с файлами
    :: Показать структуру каталога
        dir .
    :: Создать каталог
        md  All\Folder
    :: Перейти в каталог
        cd  All\Folder
    :: Удалить каталог
        rd  All\Folder

    :: Удалить файл
        del  /q All\test.txt
    :: Переместить файл
        move    All\test.txt New\
    :: Скопировать файл
        copy    All\test.txt new.txt
    :: Переименовать файл
        ren     All\test.txt new.txt
    :: Сравнить файлы построчно
        fc      All\test.txt new.txt

    :: Запомнить папку
        pushd "..\Saved Files"
        pushd .
    :: Перейти в запомненую папку
        popd

    :: Найти строку в файле
        findstr "1" *
    :: Найти строку из найденых строк
        findstr "1" * | findstr "0"



if    '%a%'=='5' ()
        :: gtr - больше
        :: geq - больше или ровно
        :: lss - меньше
        :: leq - меньше или ровно
if /i not        1 gtr 1 () else ()
if    exist      new.txt () else if 1 == 2 () else ()
if    defined    var     ()
if    errorlevel 1       ()



for     %%i in (1, "d", 234) do ()
for     %%i in (Dir\*)       do ()
for /l  %%i in (1,1,5)    do ()
for /d  %%i in (Dir\*0)   do ()
for /r  %%i in (Dir\*)    do ()

for /f  %%a in (test.txt)                    do ()
for /f  %%a in ('findstr 123453 test.txt') do ()

for /f "tokens=*     delims= "  %%a in (test.txt)    do ()
for /f "tokens=1-3   delims=."  %%a in (test.txt)     do ()
for /f "tokens=1,2,* delims= "  %%a in ("1 2 3")    do ()

for /f "usebackq" %%a in (`"findstr '12345' test.txt"`) do ()
for /f "eol=#"    %%a in (test.txt)    do ()
for /f "skip=3"   %%a in (test.txt)    do ()

setlocal
setlocal EnableExtensions
setlocal EnableDelayedExpansion

for /l %%a in (1,1,5) do set /a a=!a! * 5

endlocal
endlocal & (
    set LcVar1 = %a%
    set LcVar2 = %b%
)

for /f "tokens=1 delims=." %%a in (
    '"prompt $h. & echo on & for %%b in (1) do rem"'
) do (
    set bs=%%a
)

tasklist
taskkill /IM notepad.exe

set /p ".=."< nul > Text
findstr /a:CA "." Text*
set /p ".= %bs%%bs%"< nul

cscript /nologo sc.js

ping –n 1 –w 2500 1.1.1.1 ::Работает, если нет интернета
pathping -h 1 -q 1 -p 10000 localhost