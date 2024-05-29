<?php    
# Стандартные функции
    #(string) Экранировать как аргумент CMD
        escapeshellarg($var);
    #(string) Выполнить php код
        eval($str);
    #(string) Команда сис. консоли (последний результат), [заполняет массив результатами]
        exec('dir', $arr);

# Загрузка файла на сервер
    $tmp_file = $_FILE['file']['tmp_name'];

    #(bool) Проверить, загружен ли файл
        is_uploaded_file($tmp_name);
    #(bool) Переместить загруженный файл файл
        move_uploaded_file($tmp_name, 'D:/mysite');


#Функции
    function foo() {
        #(array) Получить аргументы в виде массива
            func_get_args();
        #(int) Количество аргументов функции
            func_num_args();
    }

#Общие
    # Удалить переменную
        unset($a);
    #(bool) Существует ли переменная
        isset($a);
    #(bool) Пустая ли переменная
        empty($a);
    # Пауза скрипта на 5 секунд
        usleep(5000);
    #(string) Рандомная комбинация символов с префиксом
        uniqid("str_");
    #Завершить скрипт
        exit();
        die('Скрипт завершён');


#Регулярные выражение
    #(int) Проверка, соотвецтвия шаблона и строки и заполнят $arr[0] полными сумками $arr[1] ервыми сумками  т.д.
        preg_match($pat, $sub, $arr);
    #(int) Количество найданных шаблонов в строке заполняет $arr результатами
        preg_match_all($pat, $sub, $arr);
    #(string\array) Заменить найденый $pat в строке\массиве $sub на $rep
        preg_replace($pat, $rep, $sub);
    #(array) Разбивает строку по рег. выражению
        preg_split($pattern, $subject);
    #(array) Для многобайтовых
        preg_split('//u', $str, -1, PREG_SPLIT_NO_EMPTY);

    #(string\array) Поиск по рег выражению и замену с помощью функции
        preg_replace_callback($pat, function($result) {}, $sub);




#Заголовки:
    # Отправить заголовок
        header("Location: http://php.net");
    #(bool) Проверка на отправление в браузер
        headers_sent();
    #(array) Список своих заголовков
        headers_list();
    #(array) Список всех заголовков
        getallheaders();
    #(array) Заголовки, которые пришли с сервера
        get_headers($url);

#Отключение кеширования
        header("Expires: " . date("r"));
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GTM");
        header("Cache-Control: no-cache, must-revalidate");
        header("Cache-Control: post-check=0,pre-check=0");
        header("Cache-Control: max-age=0");
        header("Pragma: no-cache");



#Письма:

base64_encode($data);
base64_decode($data);

mail('to@mail.ru', 'Robobo', 'Hello');

#...



#Фильтры:
    #(mixed) Проверка переменной
        filter_var($a, FILTER_DEFAULT, $param);
                /* Фильтры
                    FILTER_CALLBACK
                    $param = ['options' => function() {}]

                    FILTER_VALIDATE_EMAIL - проверка email
                    FILTER_SANITIZE_EMAIL - удалить неправ. символы email

                    FILTER_VALIDATE_BOOLEAN - проверка на 'on','yes','true' и '1' 
                        FILTER_NULL_ON_FAILURE - для проверки на bool возв. true/false/null

                    FILTER_VALIDATE_FLOAT - проверка на число с плавающей точкой

                    FILTER_VALIDATE_IP - проверка ip
                        FILTER_FLAG_IPV4
                        FILTER_FLAG_IPV6

                    FILTER_VALIDATE_URL - проверка url

                    FILTER_VALIDATE_INT - проверка на число + доп. параметр - диапозон
                    $param = ['options' => ['min_range' => 1, 'max_range' => 100]]

                    FILTER_VALIDATE_REGEXP - проверка на рег выражение в доп.параметре
                    $param = ['options' => ['regexp' => '/\w/']]
                */
    #(mixed) Проверка элементов массива
        filter_var_array(
            $arr,
            ['first' => ['filter' => $filter, 'opions' => []]]
        );
    #(mixes) Проверка суперглобальных массивов
        filter_input(INPUT_POST, 'name', $filter);



# Выходной поток
    #(bool) Включить буферизацию
        ob_start();

    #(bool) Включить архивирование
        ob_start('ob_gzhandler', 9);

    #(int) Уровень вложености буфера
        ob_get_level();

    #(string) Содержимое буфера
        ob_get_contents();
    # Очистить буфер
        ob_clean();
    # Отправить буфер в браузер
        ob_flush();
    # Очистить буфер и откл. буферизацию
        ob_end_clean();
    # Отправить буфер и откл. буферизацию
        ob_end_flush();

    #Отправить системный буфер
        flush();



#Изображения
    # Размер картинки
        getimagesize($file);

    #GD
        #(int) Создать картинку
            imageCreate($x, $y);
        #(int) Создать картинку с полноцветной палитрой
            imageCreateTrueColor($x, $y);
        #()
            imageCreateFromPNG($filename);
            
        #(int) Вывести в браузер
            imagePNG($image);
        #(int) Сохратить в файл
            imagePNG($image, $file);
        #(int) Ширина картинки
            imageSX($image);
        #(int) Количество цветов в картинке
            imageColorsTotal($image);
        #(bool) Это truecolor изображение
            imageIsTrueColor($im);

    #(bool) Копировать участок src (x,y,w,h) в участок изображения dst (x,y,w,h)
          imageCopyResized($dst, $src, $dx, $dy, $sx, $sy, $dw, $dh, $sw, $sh);

        #(bool) Копировать участок src (x,y,w,h) в участок изображения dst (x,y,w,h) и растянуть
          imageCopyResampled($dst, $src, $dx, $dy, $sx, $sy, $dw, $dh, $sw, $sh);

        #(bool) Удалить изображение
          imageDestroy($im);


        # Цвета
            # Задать ргб цвет
                imageColorAllocate($im, $r, $g, $b);
            # Возратить ближайший к данному ргб цвет с картинки
                imageColorClosest($im, $r, $g, $b);
            # Задать полупрозрачный ргб цвет
                imageColorAllocateAlpha($im, $r, $g, $b, $a);
            # Возратить ближайший к данному полупрозрачный ргб цвет с картинки
                imageColorClosestAlpha($im, $r, $g, $b, $a);

            #(array) Получить RGB с ID по картинке
                imageColorsForIndex($im, $id);
            #(int) Цвет координаты пиксела
                imageColorAt($im, $x, $y);
            #(int) Задаёт ID как прозрачный цвет
                imageColorTransparent($im, $id);


        # Перо
            #(bool) Толщина Пера
                imageSetThickness($im, 2);
            #(bool) Стиль пера
                imageSetStyle($im, [$r, $r, $g, $g, $b, $b]);

        # Линия
            imageLine($im, $x1, $y1, $x2, $y2, $color);

        # Фигуры [Добавить перед фигурой Filled для заполненой фигуры]
            # Прямоугольник
                imageRectangle($im, $x1, $y1, $x2, $y2, $color);
            # Сектор
                imageArc($im, $x, $y, $w, $h, $start, $end, $color);
            # Круг
                imageEllipse($im, $x, $y, $w, $h, $color);
        #Для использования кисти писать вместо цвета IMG_COLOR_STYLED
        #Для текстуры IMG_COLOR_TILED

        # Заполнение
            # Заливка одноцветной области
                imageFill($im, $x, $y, $color);
            # Заливка всего в пределах границы
                imageFillToBorder($im, $x, $y, $border, $color);
            # Текстура заливки
                imageSetTile($im, $file);

        # Многоугольники
            # Построить многоугольник с точками координат
                imagePolygon($im, [$x1, $y1, $x2, $y2], $count, $color); 
        # Шрифты
            # Загрузить шрифт
                imageLoadFont($file);

            # Ширина символов
                imageFontWidth($font);
            # Высота символов
                imageFontHeight($font);

        #Вывод строки
            #Начертить строку
                imageString($im, $font, $x, $y, $str, $color);
            #Начертить строку верикально
                imageStringUp($im, $font, $x, $y, $str, $color);



# Curl
    # Создать запрос
        $ch = curl_init($url);
    # Установить опции ()
        curl_setopt($ch, CURLOPT_URL, $url);
            # CURLOPT_HEADER
            # CURLOPT_USERAGENT
            # CURLOPT_REFERER
            # CURLOPT_RETURNTRANSFER
            #
            #CURLOPT_SSL_VERIFYHOST
            #CURLOPT_SSL_VERIFYPEER


    # Отправить
        curl_exec($ch);

    # Описание ошибки
        curl_error($ch);

    # Удалить родключение
        curl_close($ch);



#(bool) Куки
    # Задать куки
        setcookie("name", "123", time() + 3600);
    # Удалить куки
        setcookie("name");

# Сессия
    #(bool) Подготовить запись сессии
        session_start();
    #(bool) Удалить хранилище сессии
        session_destroy();

    #(string) Группа сессии или её присвоение
        session_name($name);
    #(bool) Указать имя при создании сессии
        session_start(['session.name' => 'name']);
    #(string) ID сессии или его присвоение
        session_id($id);

    #(string) Путь к каталогу с сессиями или его присвоение
        session_save_path();

    # Собственные обработчики сессий
    # Пример имён:
        #(bool) Вызывается при session_start()
            # handler_open($path, $sessname);
        #(bool) После записи в хранилище
            # handler_close();
        #(string) Чтении сессии(имяN=serialize(значениеN);...)
            # handler_read($sid);
        #(string) Записи в сессию
            # handler_write($sid, $data);
        #(bool) Уничтожении ссессии
            # handler_destroy($sid);
        #(bool) По прошествию времени от закрытия
            # handler_gc($second);

    # Зарегистрировать обработчик
        session_set_save_handler($open, $close, $read, $write, $destroy, $gc);



#(int) Математические:
    # Формат (число, точность, разделитель, триад):
        number_format(12.5, 2, '.', '\'');

    # Системы счисления
        # Переводит $num из $from в $to С.С.
            base_convert($num, $from, $to);
        # В 8-чную систему
            decoct(10);
        #В 2-чную
            decbin(10);

    # Рандом
        random_int(1, 100);
    # Модуль
        abs($x);
    # Минимальное число
        min($a, $b);
        min($arr);
    # Максимальное число
        max($a, $b);
        max($arr);

    # Синус
        sin($x);
    # Арксинус
        asin($x);
    # Арктангенс по сторонам
        atan2($x, $y);
    # Логарифм с основанием 2 от 4
        log(4, 2);

    # Округление
        # Округление до большего
            ceil($x);
        #Округление до меньшего
            floor($x);

        #Округление к ближайшему:
            # Округление до сотых
                round($x,  2, $mode);
            # Округление до сотен
                round($x, -2, $mode);
                    # Модиф:
                    # PHP_ROUND_HALF_DOWN - При 0.5 до нижного (модуль)
                    # PHP_ROUND_HALF_EVEN - При 0.5 до четного
                    # PHP_ROUND_HALF_ODD  - При 0.5 до нечетного



# Обработка ошибок:
    #(int) Сделать максимальный отчёт
        error_reporting(E_ALL);
    #(string) Изменить конф. файл
        ini_set('error_reporting', E_NOTICE);
            # error_reporting   - Минимальный отчёт об ошибках
            # error_log         - Установить файл записи лога
            # log_errors        - Записывать ошибки в файл
            # display_errors    - Вывод на экран

    #(string) Получить значение  конф.файла
        ini_get('error_reporting');

    #Установить свой обработчик некритичных ошибок:
        set_error_handler( 
            function ($errno, $msg, $file, $line) {
                #Проверка на знак @:
                if (!error_reporting()) return 0;
            }
        );
    #(bool) Востановить обработчик по умолчанию
        restore_error_handler();

#(bool) Вызвать исключение:
    trigger_error('Ошибка: неверный аргумент!', E_USER_NOTICE);
    #(bool) Записать ошибку в лог
        error_log('Error!');

    #(array) Всё дерево вызова функции
    debug_backtrace();




# Массивы:
    # Быстрый вывод массива/объекта
        print_r($arr);
        var_dump($arr);

        #(array) Вывод в виде кода
            var_export($arr);

    #(int) Количество элементов массива
        count($arr);
    #(bool) Перемешать значения
        shuffle($arr);
    #(bool) Есть ли элемент 1
        in_array(1, $arr);
        
    #(array) Массив с числами от 10 до 100
        range(10, 100);
    
    #(array) Разбирает ссылку по состовляющим
        parse_url($url);

    # Записать аргументы ссылки в массив
        parse_str($url, $arr);

    #(array) array_
        # Все ключи массива
            array_keys($arr);
        # Все ключи массива [со значениям val]
            array_keys($arr, $val);
        # Все значения массива
            array_values($arr);
        # Частота появления каждого значения
            array_count_values($arr);
        # Объединение массива
            array_merge($arr1, $arr2);
        # Вырезает 4 значения начиная с 3
            array_slice($arr, 3, 4);
        # Вырезает кусок массива с 3 значения до 3 с конца
            array_slice($arr, 3, -3);
        # Значения $arr1 которых нет в других
            array_diff($arr1, $arr2);
        # Возвращает пересечения двух массивов (из второго)
            array_intersect($arr1, $arr2);
        # Выводятся только уникальные значения (первые)
            array_unique($arr);
        # Заменяет подмассив с 3 эл. 3 эл на [1, 2]
            array_splice($arr, 3, 3,  [1, 2]);

        # Добовляет элемент в начало массива
            array_unshift($arr, 1);
        # Извлекает первый элемент
            array_shift($arr);
        # Извлекает последний элемент
            array_pop($arr);
        # Переворачивает массив ($save сохранять ли ключи)
            array_reverse($arr, $save);
        # Меняет местами ключи со значениям
            array_flip($arr);
            

    #(array) Теперь $arr === [a=>'str1', b=>'str2']
        compact('var1', 'var2');
    #(int) Распаковывает массив в переменные, если переменная существует выполняется инструкция
        extract($arr, $flags, 'pre_'); 
            #EXTR_OVERWRITE        - Перезаписать
            #EXTR_SKIP            - Пропустить
            #EXTR_PREFIX_ALL    - Добавить префикс

#(bool) Сортировка
    # Cсортирует несколько массивов 
        array_multisort($arr1, $arr2);
        array_multisort($arr1, $arr2, SORT_DESC);
            #SORT_DESC - обратный порядок
            #SORT_NUMERIC, SORT_STRING - тип

    # Сортировка по возрастанию
        sort($arr);
    # Сортировка по убыванию
        rsort($arr);
    # Сортировка по возрастанию + сохранение индексов
        asort($arr);
    # Сортировка по убыванию + сохранение индексов
        arsort($arr);
    # Сортировка ключа по возрастанию
        ksort($arr);
    # Сортировка ключа по убыванию
        krsort($arr);
    # Натуральная(и по числу и по лекс (lol2, lol10))
        natsort($arr);
    #Натуральная без регистра
        natcasesort($arr);

    # Сортирует массив при помощи callback функции
        # Сохранение индексов
            usort($arr, function($a, $b){ return $a <=> $b; });
        # Сортировка списка
            uasort($arr, function($a, $b){ return -1; return 0; return 1; });
        # Сортировка по ключам  
            uksort($arr, function($a, $b){ return -1; return 0; return 1; });




#Дата:

#(int) Перевод строки в секунды
    strtotime('now');
        # 10 September 2015
        # +1 day
        # +1 week 2 days 4 hours
        # next Thursday
        # last Monday
    
    #(int) Переводит число в дни от 4714 до н.э. (JD)
        GregorianToJD($month, $day, $year);
    #(string) Переводит дни JD в число
        JDToGregorian($julianday);
    #(int) Возращает номер дня недели по дню JD
        JDDayOfWeek($julianday);
    
    #(int) Первести дату в секунды
        mktime(00, 00, 00, 3, 23, 2019);
    #(string) Показать дату или перевести секудны в дату
        date('d.m.Y H:i:s', $time);
    #(string) date по гринвичу
        getdate('d.m.Y H:i:s', $time);

    #(bool) Существует ли такая дата
        checkdate(2,30,2001);
    #(array) Переводит секунды в ас масив
        getdate($time);

    #(int) Секунды
        time();
    #(float) Более точное время
        microtime(true);



#Строковые:
    # Заменить \n на <br />\n
        nl2br($str);
    # Кодирование
        md5($str);
    # Разделяет строку по 50 символов
        #(false) разрезая слова, разделяя '\n'  
            wordwrap($str, 50, '\n', false);
    # Удаление пробелов до и после строки
        trim($str);
    # Удалить все теги
        strip_tags($str);
    # Обязательна для работы с введённым пользователем
        htmlspecialchars($str);
    # Добавить \ перед ' " и \
        addslashes($str);
    # Убрать \
        stripslashes($str);
    # Создаёт строку url параметров из массива
        http_build_query($arr);
    
    # URL
        # Кодирует в url код 
            urlencode($str);
        # Кодирует из url код
            urldecode($url);

    # Разбивает строку в массив
        explode(' ', $str);
    # Соединяет массив в строку (синоним - join)
        implode(' ', ['a', 'b']);
     
    #(string) Для работы с кирилицей прибавить mb_[com]:
        strtolower($str);            #Нижний регистр
        strtoupper($str);            #Верхний регистр
        ucfirst($str);                #Праписная для первой буквы

    # Разбирает сторку на переменные по формату
        sscanf($str, '%2x%2x', $a, $b);
    # Возвращает строку, созданную с format.
        sprintf('%01.2f', 50.4);
    # Выводит sprintf()
        printf('%04.2f', 50.2);
            #Формат: %[символ][-][макс. кол. символ].[точность]тип
            #'-' - Выравнивание по лев краю
            #Типы:  b-бинарное, d-число, 
            #        s-строка, f-число с запятой, 
            #x/X - шеснацеричное представление числа (строч/проп)

    #(int) Количество символов в строке
        strlen('LOL');
    #(int) Поиск первой fox в строке начиная со 2 символа
        strpos('find fox', 'fox', 2);
    #(int) Поиск последней fox в строке начиная с конца
        strrpos('find fox', 'fox', 2);

#(string) Вырезает 2 символа начиная с 3 символа
    substr('1234567890', 3, 2);
#(string) Вырезает кусок строки с 3 символа до 2 с конца
    substr('1234567890', 3, -2);

#(string) Заменяет в str соответcвующему в from из to
    strtr($str, $from, $to);
#(string) Заменяет в str из массива ключ -> число
    strtr($str, ['lol'=>'kek', 'no'=>'yes']);

strcmp($str, $str2);                    #Сравнивает строки по байту
str_replace('is', '123', 'This is');    #
str_replace($arr, '123', $arr);        # Замена символов в строке;
str_replace($arr, $arr2, 'This is');    #
str_ireplace('is', '123', 'This is');# Без учёта регистра
substr_replace('text', 'st', 2, 2);    # Заменяет подстроку

str_repeat('-', 5);                    # строка с 5 ю тере



#Типы переменных:

#Узнать тип переменной
    gettype($x);

#(bool) Проверка типа
    is_integer($a);
    is_double($a);
    is_string($a);
    is_bool($a);

    # Число ли это, даже если String
        is_numeric($a);
    # Переменная есть, но значения нет
        is_null($a);
    # Не объект и не массив
        is_scalar($a);

    # Массив
        is_array($arr);
    # Не число
        is_nan($a);
    # Бесконечность
        is_infinite($a);

# Тип файла
    filetype('file.txt');

#(bool) Проверка типа файла
    is_file('file.txt');        #Это файл
    is_dir('folder/');        #Это папка
    is_link('file.lnk');        #Это ярлык




#Работа с файлами:

    fopen('file/1.txt', 'rt') or die('Ошибка!');
        # Постфикс t нужнем для кросплатформиности (иначе - b)
        # r - чтение, r+ - запись и чтание курсор в начале
        # a - запись, курсор в конце a+ - доб чтение
    file('file.txt', $flags);
        #Возвращает список с каждой строкой  файла
        # Флаги:
           # FILE_IGNORE_NEW_LINES - не вписывает \n в конеч элемента
        # FILE_SKIP_EMPTY_LINES - пропусить пустые линии
        # Объединить с помощью "|"
    tmpfile();                #Временный файл
    parse_ini_file('file.ini', false, $mode); 
        #Читает ini файл file.ini и возвращает одномерный (false) или
        #многомерный  (true) массив, Преобразуются "yes","true","on" = true
        # и "false","off","no","none" = false
        #Модификаторы: 
            #INI_SCANNER_RAW   - Не возращать значение опции
            #INI_SCANNER_TYPED - "yes","true","on" = true и
         #"none" = none и "false","off","no" = false 
    fwrite($file, 'New \n');    #Записать (синоним - fputs())
    feof($file);                #Файл не закончился
    fread($file, 10);        #Чтение очередной строку длин. 1
    fgets($file);            #Чтение очередной строки
    ftell($file);            #Текущая позиция курсора
    fseek($file, 0, $mode);    #Курсор в позицию относительно начала
        #Add Mode:
        #SEEK_CUR - Текущей позиции 
        #SEEK_END - Конца файла (использовать отр. пизицию)

    #Урезает файл до 10 (После это использовать tseek что бы позиция не превышала размер)
        ftruncate($file, 10);
    fclose($file);            #Закрыть файл
    fclose(fopen('f.txt', 'a+b'));
     #Конструкция создаёт пустой файл, а если он есть ничего не делает

flock($file, LOCK_SH);
        # Ждём, пока наш процесс не станем единственным редактором файла
        # LOCK_SH - разд. блокировка
        # LOCK_EX - иск. блокировка
        # LOCK_UN - снять блок (происходит при fclose())
        # [+ LOCK_NB] - не ждать своей очереди, поделать что ни буть другое

        # !!! НЕ ОТКРЫВАТЬ ФАЙЛ В РЕЖИМЕ W, ТОЛЬКО R+ 
        # И ИСПОЛЬЗОВАТЬ ftruncate($file, 0); после flock();
        # !!! ПЕРЕД РАЗБЛОКИРОВКОЙ ПРОИЗВОДИТЬ fflush($file);

copy('1.txt', '2.txt');            #Копирование
rename('f', '2.txt');            #Переименовать
unlink('2.txt');                    #Удалить
filesize($file);                    #Размер файла
basename('C:/l/k/f.txt', '.txt');#Имя файла, отбрость '.txt'
dirname('C:/l/k/f.txt');            #Путь к файлу  (C:/l/kek/)
dirname('C:/l/k/f.txt', 2);        #Путь к файлу уровня 2 (C:/lo/)
realpath('file.txt');            #Возращает полный путь к файлу 
 #взамен относительному
tempnam('/lol/', 'temp');        #Создаёт и возращает случайное 
#        имя файла с префикстом так, что бы оно было уникальным в папке
getmygid();    #Добовляет суфикс с номером процесса для уничтожения 
 #вероятности появления идентичеого файла в другом процессе
file_put_contents('f.txt', 'Text Text'); #Записать в файл
file_get_contents('f.txt');                #Прочитать файл
file_exists('lol.txt');                    #Существует ли файл?


#Работа с каталогами:

#Создать каталог с правами доступа 0777, (true) - создать все пропущеные каталоги
mkdir('new_folder', 0777, true);
rmdir('new_folder');                    #Удалить каталог
chdir('photos');                        #Перейти в каталог
getcwd();                                #Возращает полный путь к каталогу

$dir = opendir('new_folder');            #Открыть каталог
readdir($dir);                            #Возвращает очередное имя файла
rewinddir($dir);                        #Переставляет указатель на первый файл
closedir($dir);                            #Закрывает каталог

glob('new_folder/word_?/*.exe');        #Выдаст списаок всех файлов с подходящай маской 
        #(? - любой символ, * - любое количество любых символов)
glob('{*.exe, *.ini}', GLOB_BRACE);     #Возращает список exe и ini файлов

#Поток общения с приложением
$file = popen('programm', 'wb');    #fwrite()
$file = popen('programm', 'rb');

pclose($file);

#Возвращает настоящий файл
    readlink('file.lnk');
#Символическая ссылка
    symlink('file.txt', 'file2.txt');
#Жесткая ссылка
    link('file.txt', 'file2.tx');

#Потоки:
    echo file_get_contents('http://php.net');
    echo file_get_contents('ftp://ftp.aha.ru');
    echo file_get_contents('http://user:password@php.net');

    $body = 'f=1&s=2';
    $opts = [
        'http' => [
            'method' => 'POST',
            'user_agent' => 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:42.0)',
            'header' => 
                'Content-Type: application/x-www-form-urlencoded\r\n' .
                'Content-Length: ' . mb_strlen($body),
            'content' => $body
        ]
    ];
    $context = stream_context_create($opts);
    echo file_get_contents('http://php.net', false, $context);


#Права доступа:
    fileowner('file.txt');    #UID пользователя владеющего файлом
    filegroup('file.txt');    #GID группы
    fileperms('file.txt');    #Права доступа к файлу первые 7 - тип, остальные 9 - права доступа
    filesize('file.txt');    #Вес файла в байтах
    filemtime('file.txt');    #Дата последнего редактирования

    is_readable('file.txt');        #Можно прочитать
    is_writable('file.txt');        #Можео недактировать
    is_executable('file.exe');        #Исполняемый файл

    chown('file.txt', '1001');            #Изменить владельца файла (админ)
    chgrp('file.txt', '1001');            #Изменить группу, которой владееш
    chmod('file.ttx', 0775);            #Изменить права доступа

# JSON
    #(string) Кодирование
        json_encode($val, $option);
        # Опции: JSON_UNESCAPED_UNICODE - нормальная кодировка
    #(string)  Декодирование #true - асоц. массив
        json_decode($json, true);
