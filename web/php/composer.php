<?php

require_once '/vendor/autoload.php';

# SimpleDOMParser
    # Получить DOM объект из файла\ссылки:
        $dom = file_get_html($url);
    # Получить DOM объект из строки:
        $dom = str_get_html($str);
    # Создать пустой объект DOM
        $dom = new simple_html_dom();
        
    # 2 способ получения DOM
        # Из строки
            $dom->load($str);
        # Из файла\ссылки
            $dom->load_file($url);

    # Установить обработчик
        $html->set_callback('my_callback');

    # Найти объект по CSS селектору:
        # Вернуть первый элемент
            $obj = $dom->find('.class', 0);
        # Вернуть последний элемент
            $obj = $dom->find('#id', -1);
        # Вернуть массив элементов
            $arr = $dom->find('div div');

    # Второй элемент-потомок:
        $obj->children(2);
    # Родительский элемент:
        $obj->parent();

    # Первый потомок:
        $obj->first_child();
    # Последний потомок:
        $obj->last_child();
    # Следующий родственик:
        $obj->next_child();
    # Преведущий родственик:
        $obj->prev_child();

    # Вернуть или указать название тега:
        $obj->tag;
    # Вернуть или указать класс тега
        $obj->class;
    # Вернуть или указсть весь блок:
        $obj->outertext;
    # Вернуть или указать внутрености блока с тегами:
        $obj->innertext;
    # Вернуть или указать только текст без тегов:
        $obj->plaintext;
    # Вернуть или указать href тега:
        $obj->href;

    # Сохранение
        # В строку
            $str = $dom->save();
        # В файл
            $dom->save('index.html');

    #  Удалить объект
        $dom->clear();



# pQuery
    #Преобразовать строку в DOM
        $dom = pQuery::parseStr($html);
    #Найти класс inner и поменять тег на span
        $dom->query('.inner')
            ->tagName('span');
    #Найти класс adj, поменять текст и поменять тег на i
        $dom->query('.adj')
            ->html('Beautiful')
            ->tagName('i');
    #Вывести текст
        echo $dom->html();



# Monolog
    # composer require monolog/monolog
    # Подключение
        use Monolog\Logger;
        use Monolog\Handler\StreamHandler;
    # Создание
        $log = new Logger('info');
        $log->pushHandler(
            new StreamHandler('info_log.txt', Logger::INFO)
        );
    # Запись
        $log->warning('Foo');
        $log->info('Lol');
        $log->error('Bar');



# MessagePack       
    # Упаковка
        # Подключение
            use MessagePack\Packer;

        # Создание
            $packer = new Packer();

        $packed = $packer->pack($var);
        
        $packer->packNil();           // MP nil
        $packer->packBool(true);      // MP bool
        $packer->packInt(42);         // MP int
        $packer->packFloat(M_PI);     // MP float
        $packer->packStr('foo');      // MP str
        $packer->packBin("\x80");     // MP bin
        $packer->packArray([1, 2]);   // MP array
        $packer->packMap(['a' => 1]); // MP map
        $packer->packExt(1, "\xaa");  // MP ext

    # Распаковка
        # Подключение
            use MessagePack\BufferUnpacker;

        # Создание
            $unpacker = new BufferUnpacker();

        $unpacker->reset($packed);
        $value = $unpacker->unpack();



# Faker
    $faker = Faker\Factory::create();
    
    echo $faker->name;
    echo $faker->address;
    echo $faker->text;

# xDebug
