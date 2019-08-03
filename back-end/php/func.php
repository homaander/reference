<?php    
#Стандартные функции:
string escapeshellarg('args');    #Экранировать как аргумент
string eval($str)                #Выполнить php код
string exec('dir', $arr);        #Команда сис. консоли (последний результат)
        #Заполняет массив всеми строка

# Проверить, загружен ли файл
    bool   is_uploaded_file($tmp_name);
# Переместить файл
    bool   move_uploaded_file($tmp_name);


#Функции
array  func_get_args();            #Получить аргументы в виде массива

#Общие
void   unset($a);                #Удалить переменную
bool   isset($a);                #Существует ли переменная
bool   empty($a);                #Пустая ли переменная

void   usleep(5000);            #Пауза скрипта на 5 секунд
string uniqid("str_");            #Рандомная комбинация символов с префиксом
void   exit();                    #die(); Завершить скрипт


#Регулярные выражение
int    preg_match($pat, $sub, $arr);
        #Ищет шаблон $pat в $sub и заполнят $arr
int    preg_match_all($pat, $sub, $arr); #Ищет все шаблоны
int    preg_replace($pat, $rep, $sub);     #Заменить найденый $pat в строке $sub
int    preg_split($pattern, $subject);     #Разбивает строку по рег. выражению

int    preg_replace_callback($pat, function($result) {}, $sub );
        #Поиск по рег выражению и замену с помощью функции:




#Заголовки:
int    header("Location: http://php.net");
        #Задать заголовок
bool   headers_sent();            #Проверка на отправку
list   headers_list();            #Список выведеных заголовков
array  getallheaders();            #Все заголовки

#Отключение кеширования
        header("Expires: " . date("r"));
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GTM");
        header("Cache-Control: no-cache, must-revalidate");
        header("Cache-Control: post-check=0,pre-check=0");
        header("Cache-Control: max-age=0");
        header("Pragma: no-cache");



#Письма:
base64_encode(data);
base64_decode(data);

mail('to@mail.ru', 'Robobo', 'Hello');

#...



#Фильтры:
#Проверка переменной
mixed  filter_var($a, FILTER_DEFAULT);
        #FILTER_CALLBACK
        # ['options' => function() {}]

        #FILTER_VALIDATE_EMAIL - проверка email
        #FILTER_SANITIZE_EMAIL - удалить неправ. символы email

        #FILTER_VALIDATE_BOOLEAN - проверка на 'on','yes','true' и '1' 
            #FILTER_NULL_ON_FAILURE - для проверки на bool возв. true/false/null

        #FILTER_VALIDATE_FLOAT - проверка на число с плавающей точкой

        #FILTER_VALIDATE_IP - проверка ip
            #FILTER_FLAG_IPV4
            #FILTER_FLAG_IPV6

        #FILTER_VALIDATE_URL - проверка url

        #FILTER_VALIDATE_INT - проверка на число + доп. параметр - диапозон
        #    ['options' => ['min_range' => 1, 'max_range' => 100]]

        #FILTER_VALIDATE_REGEXP - проверка на рег выражение в доп.параметре
        #    ['options' => ['regexp' => '/\w/']]

#Проверка элементов массива
mixed  filter_var_array(
        $arr,
        ['first' => ['filter' => $filter, 'opions' =>]
    );
#Проверка суперглобальных массивов
mixed  filter_input(INPUT_POST, 'name', $filter)



#Буфер
bool   ob_start();                #Включить буферизацию
bool   ob_start('ob_gzhandler', 9); #Включить архивирование

int    ob_get_level();            #Уровень вложености буфера
string ob_get_contents();         #Содержимое буфера
void   ob_clean();                #Очистить буфер
void   ob_flush();                #Отправить буфер в браузер
bool   ob_end_clean();            #Очистить буфер и откл. буферизацию
bool   ob_end_flush();            #Отправить буфер и откл. буферизацию

void   flush();                   #Отправить системный буфер



#Изображения
array  getimagesize($file);       #Размер картинки

#GD
int    imageCreate($x, $y);                #Создать картинку
int    imageCreateTrueColor($x, $y);    #Создать картинку с полноцветной палитрой

int    imagePNG($image);        #Вывести в браузер
int    imagePNG($image, $file);    #Сохратить в файл
int    imageSX($image);            #Ширина картинки
int    imageColorsTotal($image);#Количество цветов в картинке
bool   imageIsTrueColor($im);    #Это truecolor изображение

#Цвета
int    imageColorAllocate($im, $r, $g, $b);    #Задать ргб цвет
int    imageColorClosest($im, $r, $g, $b);    #Возратить ближайший к данному ргб цвет с картинки
int    imageColorAllocateAlpha($im, $r, $g, $b, $a);    #Задать полупрозрачный ргб цвет
int    imageColorClosestAlpha($im, $r, $g, $b, $a);    
        #Возратить ближайший к данному полупрозрачный ргб цвет с картинки

array  imageColorsForIndex($im, $id);         #получить RGB с ID по картинке
int    imageColorAt($im, $x, $y);            #цвет координаты пиксела
int    imageColorTransparent($im, $id);        #задаёт ID как прозрачный цвет

int    imageCopyResized($dst, $src, $dx, $dy, $sx, $sy, $dw, $dh, $sw, $sh);
        #Копировать участок src (x,y,w,h) в участок изображения dst (x,y,w,h)

#Перо
bool   imageSetThickness($im, 2); #Толщина Пера
bool   imageSetStyle($im, [$r, $r, $g, $g, $b, $b]); #Стиль пера
#Линия
int    imageLine($im, $x1, $y1, $x2, $y2, $color); #Линия
#Фигуры [Добавить перед фигурой Filled для заполненой фигуры]
int    imageRectangle($im, $x1, $y1, $x2, $y2, $color); #Прямоугольник
int    imageArc($im, $x, $y, $w, $h, $start, $end, $color); #Сектор
int    imageEllipse($im, $x, $y, $w, $h, $color); #Круг
    #Для использования кисти писать вместо цвета IMG_COLOR_STYLED
    #Для текстуры IMG_COLOR_TILED
#Заполнение
int    imageFill($im, $x, $y, $color);    #Заливка одноцветной области
int    imageFillToBorder($im, $x, $y, $border, $color); #Заливка всего в пределах границы
int    imageSetTile($im, $file); #Текстура заливки
#Многоугольники
int    imagePolygon($im, [$x1, $y1, $x2, $y2], $count, $color); 
        #Построить многоугольник с точками координат
#Шрифты
int    imageLoadFont($file); #Загрузить шрифт

int    imageFontWidth($font); #Ширина символов
int    imageFontHeight($font); #Высота символов
#Вывод строки
int    imageString($im, $font, $x, $y, $str, $color); #Начертить строку
int    imageStringUp($im, $font, $x, $y, $str, $color); #Начертить строку верикально



# Curl
# Создать запрос
$ch = curl_init($url);
# Установить опции ()
curl_setopt($ch, CURLOPT_URL, $url);
        #CURLOPT_HEADER
        #CURLOPT_USERAGENT
        #CURLOPT_REFERER
        #CURLOPT_RETURNTRANSFER
        #
        #CURLOPT_SSL_VERIFYHOST
        #CURLOPT_SSL_VERIFYPEER


# Отправить
curl_exec($ch);

# 
curl_error($ch);

# Удалить родключение
curl_close($ch);



#Куки
bool   setcookie("name", "123", time() + 3600);    #Задать куки
bool   setcookie("name");                        #Удалить куки
#Сессия
bool   session_start();        #Подготовить запись сессии
bool   session_destroy();     #Удалить хранилище сессии

string session_name($name);    #Группа сессии или её присвоение
bool   session_start(['session.name' => 'name']);
        #Указать имя при создании сессии
string session_id();        #ID сессии или его присвоение

string session_save_path();    #Путь к каталогу с сессиями или его присвоение

    #Собственные обработчики сессий
    #function name() {}
    #Пример имён:
bool   handler_open($path, $sessname);    #Вызывается при session_start()
bool   handler_close();                    #После записи в хранилище
string handler_read($sid);                #Чтении сессии(имяN=serialize(значениеN);...)
string handler_write($sid, $data);        #Записи в сессию
bool   handler_destroy($sid);            #Уничтожении ссессии
bool   handler_gc($second);                #По прошествию времени от закрытия

void   session_set_save_handler(open, close, read, write, destroy, gc);
        #Зарегистрировать обработчик



#Математические:
#Формат (число, точность, разделитель, триад):
int    number_format(12.5, 2, '.', '\'');

int    base_convert($num, $from, $to);    #Переводит $num из $from в $to С.С.
int    decoct(10);                        #В 8-чную систему
int    decbin(10);                        #В 2-чную

int    random_int(1, 100);                #Рандом
int    abs($x);                            #Модуль
int    min($arr);                        #Минимальное число
int    min($a, $b, ...);                #Минимальное число
int    max($arr);                        #Максимальное число
int    max($a, $b, ...);                #Максимальное число

int    sin($x);                            #Синус
int    asin($x);                        #Арксинус
int    atan2($x, $y);                    #Арктангенс по сторонам
int    log(4, 2);                        #Логарифм с основанием 2 от 4

int    ceil($x);                        #Округление до большего
int    floor($x);                        #Округление до меньшего

#Округление к ближайшему:
int    round($x,  2, $mode);            #Округление до сотых
int    round($x, -2, $mode);            #Округление до сотен
        #Модиф:
        #PHP_ROUND_HALF_DOWN - При 0.5 до нижного (модуль)
        #PHP_ROUND_HALF_EVEN - При 0.5 до четного
        #PHP_ROUND_HALF_ODD  - При 0.5 до нечетного




#Обработка ошибок:

int    error_reporting(E_ALL);                 #Сделать максимальный отчёт
string ini_set('error_reporting', E_NOTICE); #Изменить конф. файл
        # error_reporting    - Минимальный отчёт об ошибках
        # error_log         - Установить файл записи лога
        # log_errors        - Записывать ошибки в файл
        # display_errors    - Вывод на экран

string ini_get('error_reporting');    #Получить значение  конф.файла

#Установить свой обработчик некритичных ошибок:
set_error_handler( 
    function ($errno, $msg, $file, $line) {
        #Проверка на знак @:
        if (!error_reporting()) return 0;
    }
);
bool   restore_error_handler();    #Востановить обработчик по умолчанию

#Вызвать исключение:
bool   trigger_error('Ошибка: неверный аргумент!', E_USER_NOTICE);
bool   error_log('Error!');        #Записать ошибку в лог

array  debug_backtrace();        #Всё дерево вызова функции




#Мыссивы:

void   print_r($arr);                #Быстрый вывод массива
void   var_dump($arr);                #
array  var_export($arr);            #Вывод в виде кода

int    count($arr);                    #Количество элементов массива
bool   shuffle($arr);                #Перемешать значения
bool   in_array(1, $arr)             #Есть ли элемент 1

array  array_keys($arr);            #Все ключи массива
array  array_keys($arr [,$val]);    #Все ключи массива со значениям val
array  array_values($arr);            #Все значения массива
array  array_count_values($arr);    #Частота появления каждого значения

array  array_merge($arr1, $arr2);    #Объединение массива
array  array_slice($arr, 3, 4);        #Вырезает 4 значения начиная с 3
array  array_slice($arr, 3, -3);    #Вырезает кусок массива с 3 значения до 3 с конца

array  range(10, 100);                #Массив с числами от 10 до 100

array  array_diff($arr1, $arr2...);    #Значения $arr1 которых нет в других
array  array_intersect($arr1, $arr2...);
        #Возвращает пересечения двух массивов (из второго)

array  array_unique($arr);             #Выводятся только уникальные значения (первые)

array  array_splice($arr, 3, 3,  [1, 2]);
        #Заменяет подмассив с 3 эл. 3 эл на [1, 2]

array  compact('var1', 'var2');     #Теперь $arr === [a=>'str1', b=>'str2']
#Распаковывает массив в переменные, если переменная существует выполняется инструкция
int    extract($arr, , 'pre_'); 
        #EXTR_OVERWRITE        - Перезаписать
        #EXTR_SKIP            - Пропустить
        #EXTR_PREFIX_ALL    - Добавить префикс

array  array_unshift($arr, 1);         #Добовляет элемент в начало массива
array  array_shift($arr);            #Извлекает первый элемент
array  array_pop($arr);                #Извлекает последний элемент

array  array_reverse($arr, $save);    #Переворачивает массив ($save сохранять ли ключи)
array  array_flip($arr);            #Меняет местами ключи со значениям

bool   array_multisort($arr1, $arr2);
bool   array_multisort($arr1, $arr2, SORT_DESC);
        #Cсортирует несколько массивов 
        #SORT_DESC - обратный порядок
        #SORT_NUMERIC, SORT_STRING - тип

bool   sort($arr);                    #Сортировка по возрастанию
bool   rsort($arr);                    #Сортировка по убыванию
bool   asort($arr);                    #Сортировка по возрастанию + сохранение индексов
bool   arsort($arr);                #Сортировка по убыванию + сохранение индексов
bool   ksort($arr);                    #Сортировка ключа по возрастанию
bool   krsort($arr);                #Сортировка ключа по убыванию
bool   natsort($arr);                 #Натуральная(и по числу и по лекс (lol2, lol10))
bool   natcasesort($arr);             #Натуральная без регистра

#Сортирует массив при помощи callback функции
#Сохранение индексов
bool   usort($arr, function($a, $b){ return -1; return 0; return 1; });
#Сортировка списка
bool   uasort($arr, function($a, $b){ return -1; return 0; return 1; });




#Дата:

#Перевод строки в секунды
int    strtotime('now');
        # 10 September 2015
        # +1 day
        # +1 week 2 days 4 hours
        # next Thursday
        # last Monday

int    GregorianToJD($month, $day, $year);    #Переводит число в дни от 4714 до н.э. (JD)
string JDToGregorian($julianday);            #Переводит дни JD в число
int    JDDayOfWeek($julianday);                #Возращает номер дня недели по дню JD

int    mktime(00, 00, 00, 3, 23, 2019);    #Первести дату в секунды
string date('d.m.Y H:i:s', $time);         #Показать дату или перевести секудны в дату
string getdate('d.m.Y H:i:s', $time);    #date по гринвичу

bool   checkdate(2,30,2001);            #Существует ли такая дата
array  getdate($time);                    #Переводит секунды в ас масив

int    time();                            #Секунды
float  microtime(true);                    #Более точное время





#Строковые:
string nl2br($str);                        #Заменить \n на <br />\n
string md5($str);                        #Кодирование
string wordwrap($str, 50, '\n', false);    #Разделяет строку по 50 символов 
        #(false) разрезая слова, разделяя '\n'

string trim($str);                     #Удаление пробелов до и после строки
string strip_tags($str);             #Удалить все теги
string htmlspecialchars($str);        #Обязательна для работы с введённым пользователем

string addslashes($str);            #Добавить \ перед ' " и \
string stripslashes($str);            #Убрать \

string http_build_query($arr);        #Создаёт строку url параметров из массива

void   parse_str($url, $arr);        #Записать аргументы ссылки в массив
array  parse_url($url)                #Разбирает ссылку по состовляющим
string urlencode($str);                #Кодирует в url код 
string urldecode($url);                #Кодирует из url код

array  explode(' ', $str);            #Разбивает строку в массив
string implode(' ', ['a', 'b']);    #Соединяет массив в строку (синоним - join)

#Для работы с кирилицей прибавить mb_[com]:
string strtolower($str);            #Нижний регистр
string strtoupper($str);            #Верхний регистр
string ucfirst($str);                #Праписная для первой буквы

sscanf($str, '%2x%2x', $a, $b) #Разбирает сторку на переменные по формату
string sprintf('%01.2f', 50.4);        #Возвращает строку, созданную с format.
int    printf('%04.2f');            #Выводит sprintf()
        #Формат: %[символ][-][макс. кол. символ].[точность]тип
        #'-' - Выравнивание по лев краю
        #Типы:  b-бинарное, d-число, 
        #        s-строка, f-число с запятой, 
        #x/X - шеснацеричное представление числа (строч/проп)

int    strlen('LOL');                    #Количество символов в строке
int    strpos('find fox', 'fox', 2);    #Поиск первой fox в строке начиная со 2 символа
int    strrpos('find fox', 'fox', 2);    #Поиск последней fox в строке начиная с конца
string substr('1234567890', 3, 2);        #Вырезает 2 символа начиная с 3 символа
string substr('1234567890', 3, -2);        #Вырезает кусок строки с 3 символа до 2 с конца

string strtr($str, $from, $to);
        #Заменяет в str соответcвующему в from из to
string strtr($str, ['lol'=>'kek', 'no'=>'yes']);
        #Заменяет в str из массива ключ -> число

int    strcmp($str, $str2)                    #Сравнивает строки по байту
string str_replace('is', '123', 'This is');    #
array  str_replace($arr, '123', $arr);        # Замена символов в строке;
array  str_replace($arr, $arr2, 'This is');    #
string str_ireplace('is', '123', 'This is');# Без учёта регистра
string substr_replace('text', 'st', 2, 2);    # Заменяет подстроку

string str_repeat('-', 5);                    # строка с 5 ю тере



#Типы переменных:

string gettype($x)                #Тип переменной

#Проверка типа
bool   is_integer($a);             # Проверка типа
bool   is_double($a);            #
bool   is_string($a);            #
bool   is_bool($a);                #

bool   is_numeric($a);             #Число ли это, даже если String
bool   is_null($a);                #Переменная есть, но значения нет
bool   is_scalar($a);            #Не объект и не массив

bool   is_array($arr);            #Массив
bool   is_nan($a);                #Не число
bool   is_infinite($a);            #Бесконечность

string filetype('file.txt');    #Тип файла

#Проверка типа файла
bool   is_file('file.txt');        #Это файл
bool   is_dir('folder/');        #Это папка
bool   is_link('file.lnk');        #Это ярлык




#Работа с файлами:

int    fopen('file/1.txt', 'rt') or die('Ошибка!');
        # Постфикс t нужнем для кросплатформиности (иначе - b)
        # r - чтение, r+ - запись и чтание курсор в начале
        # a - запись, курсор в конце a+ - доб чтение

int    file('file.txt', $flags);
        #Возвращает список с каждой строкой  файла
        # Флаги:
        # FILE_IGNORE_NEW_LINES - не вписывает \n в конеч элемента
        # FILE_SKIP_EMPTY_LINES - пропусить пустые линии
        # Объединить с помощью "|"

int    tmpfile();                #Временный файл

array  parse_ini_file('file.ini', false, $mode); 
        #Читает ini файл file.ini и возвращает одномерный (false) или
        #многомерный  (true) массив, Преобразуются "yes","true","on" = true
        # и "false","off","no","none" = false
        #Модификаторы: 
        #INI_SCANNER_RAW   - Не возращать значение опции
        #INI_SCANNER_TYPED - "yes","true","on" = true и
        #"none" = none и "false","off","no" = false 

int    fwrite($file, 'New \n');    #Записать (синоним - fputs())
bool   feof($file)                #Файл не закончился
string fread($file, 10);        #Чтение очередной строку длин. 1
string fgets($file);            #Чтение очередной строки

int    ftell($file);            #Текущая позиция курсора
int    fseek($file, 0, $mode);    #Курсор в позицию относительно начала
        #Add Mode:
        #SEEK_CUR - Текущей позиции 
        #SEEK_END - Конца файла (использовать отр. пизицию)

bool   ftruncate($file, 10);    #Урезает файл до 10 (После это использовать
        #tseek что бы позиция не превышала размер)
bool   fclose($file);            #Закрыть файл

bool   fclose(fopen('f.txt', 'a+b'));
        #Конструкция создаёт пустой файл, а если он есть ничего не делает

flock($file, LOCK_SH);
        #Ждём, пока наш процесс не станем единственным редактором файла
        #LOCK_SH - разд. блокировка
        #LOCK_EX - иск. блокировка
        #LOCK_UN - снять блок (происходит при fclose())
        #[+ LOCK_NB] - не ждать своей очереди, поделать что ни буть другое

        #!!! НЕ ОТКРЫВАТЬ ФАЙЛ В РЕЖИМЕ W, ТОЛЬКО R+ 
        # И ИСПОЛЬЗОВАТЬ ftruncate($file, 0); после flock();
        #!!! ПЕРЕД РАЗБЛОКИРОВКОЙ ПРОИЗВОДИТЬ fflush($file);

bool   copy('1.txt', '2.txt');            #Копирование
bool   rename('f', '2.txt');            #Переименовать
bool   unlink('2.txt');                    #Удалить

int    filesize($file)                    #Размер файла
string basename('C:/l/k/f.txt', '.txt');#Имя файла, отбрость '.txt'
string dirname('C:/l/k/f.txt');            #Путь к файлу  (C:/l/kek/)
string dirname('C:/l/k/f.txt', 2);        #Путь к файлу уровня 2 (C:/lo/)
string realpath('file.txt');            #Возращает полный путь к файлу 
        #взамен относительному

string tempnam('/lol/', 'temp');        #Создаёт и возращает случайное 
#        имя файла с префикстом так, что бы оно было уникальным в папке
int    getmygid();    #Добовляет суфикс с номером процесса для уничтожения 
        #вероятности появления идентичеого файла в другом процессе

int    file_put_contents('f.txt', 'Text Text'); #Записать в файл
int    file_get_contents('f.txt');                #Прочитать файл

int    file_exists('lol.txt');                    #Существует ли файл?



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

string readlink('file.lnk');        #Возвращает настоящий файл
symlink('file.txt', 'file2.txt');    #Символическая ссылка
link('file.txt', 'file2.tx');        #Жесткая ссылка

#Потоки:
echo file_get_contents('http://php.net');
echo file_get_contents('ftp://ftp.aha.ru');
echo file_get_contents('http://user:password@php.net');

$body = 'f=1&s=2';
$opts = [
    'http' => [
        'method' => 'POST'
        'user_agent' => 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:42.0)',
        'header' => 
            'Content-Type: application/x-www-form-urlencoded\r\n'.
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
string json_encode($val, $option);    #JSON кодирование
        #Опции: JSON_UNESCAPED_UNICODE - нормальная кодировка
string json_decode($json, true);    #true - асоц. массив



# Методы классов:
# XML:
    # XML из строки/ссылки
        $obj = new SimpleXMLElement($xml, 0, false);
        $obj = new SimpleXMLElement($url, 0,  true);

    # Получение элемента
        $obj->title
        $obj->item[0]
    
    # Количество элементов
        $obj->item->count();
    # Массив аттрибутов
        $obj->item->arttibutes();
    # XPath регулярные выражения
        $item = $obj->xpath('//item')
        $item['url'];
        
    # Добовление
        $obj->addChild('item', 'text');
        $obj->item->addAttribute('url', 'vk.com');
        
        $str = $obj->asXML();
        $obj->asXML('file.xml');

# Directory:
$obj = dir('.');
    $obj->path;          #Путь к каталогу
    $obj->handle;        #Дескриптор каталога

    #В качестве параметра можено передать дескриптор другого файла
    $obj->read();       #Чтение очередного элемента
    $obj->rewind();     #Сбросить в изначальное положение
    $obj->close();      #Закрыть каталог

# База данных:
    # Соединится с БД
    $pdo = new PDO(
            'mysql:host=...;dbname=...',
            'root',
            '1111',
            [ PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION ]
        );

    #Последнее значение primary_key с auto_increment
    $pdo -> lastInsertId();

    #Выполнить запрос без получения данных
    $count = $pdo->exec($query);

    #Запрос с получением данных
    $res = $pdo->query($query);
    #Извлеч очередную строку запроса
    $result = $res->fetch();
    #Вернуть только асоц массив
    $result = $res->fetch(PDO::FETCH_ASSOC);

    #Преобразовать все резулбтаты в большой массив
    $all_result = $res->fetchAll();

    #Параметры SQL (Переменные в запросе)
    $query = 'SELECT * FROM table WHERE id = :id';
    #Установить, что в запросе есть параметры
    $cat = $pdo->prepare($query);
    #Изменить параметр
    $cat->execute(['id' => 1]);

# Generator:
function gen() {
    yield  1;
    yield  2;
    return 3;
}
$obj = gen();
    $obj->send('text');    #Послать значение в генератор
    $obj->getReturn();    #Получить значение return
    $obj->valid();        #Проверка на открытость генератора
    $obj->currect();    #Текущее значение генератора
    $obj->next();        #Следующее значение

# Closure:
class View {
    protected $Page;
    public function addPage($page) { $this->Page = $page; }
}
$clos = function() { echo $this->Page; };

$obj  = new View();
$obj ->addPage('Test');
$clos = $clos->bindTo($obj, 'View');    #Назначить замыкание функции
$clos();

# Дата:
$date  = new DateTime();
$date2 = new DateTime("2016-01-01 00:00:00");
$date  = new DateTime("now", new DateTimeZone("Europe/Moscow"));
    $date->format('d.m.Y'); # Эквивалент date

$result = $date->diff($diff2);     # Интервал между текущей датой и данной в $date

# DateInterval:
$intval = new DateInterval("P3Y1M1D10H12M59S"); #Формат даты: P(число)(чего)
$result = $date->add($intval);     # Добавить к дате интервал
$result = $date->sub($intval);     # Вычесть из даты интервал
    $date->format('d.m.Y'); # Эквивалент date

# DatePeriod:
$period = new DatePeriod($date, $intval, 5); #Генерирует 5 дат от $date с шагом $intval
foreach ($period as $v) {}
?>