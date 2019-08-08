<?php
    
    # Программные константы:

    # Перевод строки согластно с системой
        echo PHP_EOL;
    # Путь к файлу скрипта
        echo __FILE__;
    # Путь к папке со скриптом
        echo __DIR__;

    # Математические константы:
        echo M_PI;
        echo M_E;

    # Программные переменные:
        # Системные константы (имя скрипта)
            echo $_SERVER['SCRIPT_NAME'];
            
            echo $_SERVER['REQUEST_URI']
        # Все поступившие значения
            echo $_REQUEST;
        # POST значения
            echo $_POST;
        # GET значения
            echo $_GET;
        # Полученый файл
            echo $_FILE;

?>