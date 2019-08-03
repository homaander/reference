:: Синтаксис
    :: Не выводить сами команды
        @echo lol
    :: Отключить вывод всех команд
        @echo off
    
    :: Выполнить несколько команд
        echo foo & echo bar

    :: Выполнять, если ошибок нет
        set /a a = 1 / 1 && echo Ok!
    :: Выполнять, если есть ошибка
        set /a a = 1 / 0 || echo Err!

    :: Выполнить несколько команд
        2> nul set /a a = 1 / 0 || (
            echo Error del zero
        )

:: Вывод переменных
    :: Обычный вывод
        echo Hello
    :: Вывод с символами пробела
        echo.    Hello

:: Переменные

    :: Ввод пользователя
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

        :: Вывод постранично (если нет места в буфере)
            more test.txt
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

:: Пространства имён
    :: Установить пространство имён (внутренние переменные не влияют на внешние)
        setlocal

    :: Завершение
        :: Закончить пространство имён (переменные в жтом пространстве удалятся)
            endlocal
        :: Закончить и сохранить в глобальные переменные
            endlocal & (
                set gVar_a = %a%
                set gVar_b = %b%
            )

:: Расширения
    :: Добавить /i и defined в команду if
        setlocal EnableExtensions

    :: Новый тип "Долгих" переменных для цикла и не только
        setlocal EnableDelayedExpansion

        :: Пример
            for /l %%a in (1,1,5) do set /a a=!a! * 5

:: Ветвление
    :: Математические
        if /i not        1 gtr 1 () else ()
                :: gtr - больше
                :: geq - больше или ровно
                :: lss - меньше
                :: leq - меньше или ровно

    :: Строковые
        if    '%a%'=='5' ()
    :: Существование файла
        if    exist      new.txt () else if 1 == 2 () else ()
    :: Существование переменных
        if    defined    var     ()
    :: Проверка ошибок
        if    errorlevel 1       ()

:: Циклы
    :: Перебор элементов
        for %%i in (1, Andrew, "hello world!") do echo %%i
        for %%i in (1 Andrew "hello world!") do echo %%i

    :: Математический перебор
        for /l  %%i in (1, 1, 5)  do echo %%i
        for /l  %%i in (5, -1, 1) do echo %%i

    :: Перебор файлов
        for %%i in (dir\*) do echo %%i
        :: Во всех подкаталогах
            for /r "dir\"  %%i in (*.lnk) do echo %%i
    :: Перебор каталогов
        for /d  %%i in (dir\*.lnk) do echo %%i

:: Перебрать все строки файла
    for /f  %%a in (test.txt)                  do ()

:: Перебор вывода команды
    for /f  %%a in ('findstr 123453 test.txt') do ()

:: Запись отдельных частей набора в переменные в аловитном порядке
:: С помощью некоторого раздалителя
    for /f "tokens=*     delims= "  %%a in (test.txt) do ( echo %%a & echo %%b )
    for /f "tokens=1-3   delims=."  %%a in (test.txt) do echo %%a
    for /f "tokens=1,2,* delims= "  %%a in ("1 2 3")  do ( echo %%a & echo %%b )

:: Переназначить ковычки (для файлов сод. пробелы в пути или команд сод. апострафы)
    for /f "usebackq" %%a in (`findstr '12345' test.txt`) do ()
:: Символ начала коментария
    for /f "eol=#"    %%a in (test.txt)    do ()
:: Пропуск количества символов
    for /f "skip=3"   %%a in (test.txt)    do ()


:: Символ бекспейса
    for /f "tokens=1 delims=." %%a in ('prompt $h. & echo on & for %%b in (1) do set .=') do set bs=%%a

:: Цветной текст
    < nul > Text set /p ".=."
    findstr /a:CA "." Text*
    set /p ".= %bs%%bs%"< nul

:: Процессы
    :: Показать список процессов
        tasklist
    :: Отключить процесс
        taskkill /IM notepad.exe

:: Исполнить JScript
    cscript /nologo sc.js