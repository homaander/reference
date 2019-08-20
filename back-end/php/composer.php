<?php

require_once '/vendor/autoload.php';

# Lavarel
    /* CMD
        Установка
            composer global require laravel/installer
            laravel new blog
        или
            composer create-project --prefer-dist laravel/laravel blog "5.8.*"

        Запустить лок. сервер (по умолчанию localhost:8000)
            php artisan serve

        Очистить кеш (в основнои после изменения .env)
            php artisan cache:clear

        Обновить Composer
            composer dumpautoload
        
        Регистрация
            php artisan make:auth
        
        Письма
            php artisan make:mail newMail --markdown=email

            Кастомизация
                php artisan vendor:publish --tag=laravel-mail
        
        Модели
            #Создать модель +миграцию [ +контроллер ]
                php artisan make:model Task -m[c]

        
        Контроллеры
            php artisan make:controller TasksController
        
        Миграции
            Создать системные миграции:
                php artisan migrate
            Удалить все миграции:
                php artisan migrate:reset
            Переустановить системные файлы:
                php artisan migrate:fresh
            Обновить миграции:
                php artisan migrate:refresh
            Создать миграцию:
                php artisan make:migration create_tasks_table --create=tasks
    */

    # Роутинг (routes/routes.php)
        # Установить возврат на страницу name:
            Route::get('/{name}', function() {
                # Получить базу данных app:
                    $tasks = DB::table('app')->get();
                    #Модель:
                        $tasks = App\Task::all();
                # Найти id в БД:
                    $task = DB::table('app')->find($id);
                    # Модель:
                        $task = App\Task::find($id);
                # Получить столбец таблицы
                    $body = $task->body;
                    
                # Содержимое массива / объекта
                    dd($arr);
                    
                # Вернуть текст:
                    return 'Hello World!';
                # Вернуть представление-шаблонизатор (resources/view) c
                # внедрением переменых:
                    return view('index', [
                        'name'=>'Andrew'
                    ]);
                # Второй вариант внедрения переменных с путём к файлу:
                    return view('folder.index')->with('name', 'Yarik');
            });

    # Установить контроллер на главную страницу и метод index
        Route::get('/', 'UserController@index');
        Route::get('/{id}', 'UserController@show');
        
    # Авторизация
        # Узнать имя пользователя
            Auth::user()->name;

    # Пагинация
        # Контроллер
            # Разбить информацию по 3
                $users = Users::paginate(3);
            # Простай пагинация (из кнопок только вперёд и назад)
                $users = Users::simplePaginate(3);
    
        # Шаблонизатор
            # Добавить ссылки-переключатели страниц
                {{ $users->link(); }}
        

    # Почта
        /* Конфигурация
            (config/mail.php)
            'stream' => [
               'ssl' => [
                  'allow_self_signed' => true,
                  'verify_peer' => false,
                  'verify_peer_name' => false,
               ],
            ],
        
            (.env)
                MAIL_HOST=smtp.gmail.com
                MAIL_PORT=587
                MAIL_USERNAME=hom.ander23@gmail.com
                MAIL_PASSWORD=null
                MAIL_ENCRYPTION=tls
        */
            Mail::send(
                # Ссылка на шаблонизатор
                ['text'=>'mail'],
                ['name', 'Andrew'],
                function($message) {
                    $message->to('hom.ander23@gmail.com', 'To Andrew')
                        ->subject('Test Email');
                    $message->from('hom.ander23@gmail.com', 'Andrew');
                }
            );

    # БД
        /* Конфигурация
            (.env)
                DB_CONNECTION=mysql
                DB_HOST=127.0.0.1
                DB_DATABASE=app
                DB_USERNAME=root
                DB_PASSWORD=1111
        */

        # Миграции
            Schema::create('tasks', function(Blueprint $table){
                $table->increments('id');
                $table->text('body');
                $table->integer('user_id');
                $table->string('user_id');
                $table->boolean('user_id');
                $table->timestamps();
            });
        # Модели
            class Model {
                public static function incimpleted() {
                    return static::where('completed', 0)->get();
                }
            }

    # Шаблонизатор Blade([name].blade.php)
?>
        <ul>
            <!-- Использование ключевых слов PHP -->
                @foreach ($arr as $a)
                    <!-- Использование переменных -->
                        <li>{{ $a }}</li>
                @endforeach

            <!-- Вывод секции Content -->
                @yield('content')
            <!-- Наследование файда Layout -->
                @extends('layout')
            <!-- Установка секции -->
                @section('content')
                @endsection
            <!-- include путей -->
                @include('folder.index')

            <!-- Условные операторы -->
                @if (count($records) === 1)
                    Здесь есть одна запись!
                @elseif (count($records) > 1)
                    Здесь есть много записей!
                @else
                    Здесь нет записей!
                @endif

                @unless (Auth::check())
                    Вы не вошли в систему.
                @endunless

            <!-- Циклы -->
                @for ($i = 0; $i < 10; $i++)
                    Текущее значение: {{ $i }}
                @endfor

                @foreach ($users as $user)
                    <p>Это пользователь{{ $user->id }}</p>
                @endforeach

                @forelse($users as $user)
                    <li>{{ $user->name }}</li>
                @empty
                    <p>No users</p>
                @endforelse

                @while (true)
                    <p>Это будет длиться вечно.</p>
                @endwhile
        </ul>



<?php

# Symfony 4

    # Шаблонизатор Twig
        # composer require twig/twig
    
    # Подключение
        $loader = new \Twig\Loader\FilesystemLoader('/path/to/templates');
        $twig = new \Twig\Environment($loader, [
            'cache' => '/path/to/compilation_cache',
        ]);
?>
    <ul>
        {# Коментарий #}
        <li>{{ var }}</li>
        <li>{{ arr.name }}</li>

        <li>{{ arr.name|upper }}</li>

        {% include "nav.html" %}

        {% extands "base.html" %}

        {% block title %}
        {% endblock %}

        {% if arr.name != '' %}
            {% else %}
        {% endif %}

        {% for user in users %}
        {% endfor %}
    </ul>


<?php
# Шаблонизатор Smarty
    # composer require smarty/smarty

# Подключение
    # Простое
        $smarty = new Smarty();
        $smarty->template_dir = getcmd();
        $smarty->compile_dir = '/tmp';

    # Наследованием
        class MySmarty extends Smarty {
            function __construct()
            {
                    $this->Smarty();

                    $this->template_dir = 'templates/';
                    $this->compile_dir  = 'templates_c/';
                    $this->config_dir   = 'configs/';
                    $this->cache_dir    = 'cache/';

                    $this->caching = true;
                    $this->assign('app_name', 'Guest Book');
            }
        }

# Использование
    # Создание переменных
        $smatry->assign('news', 'hello world');

    # Прогрузка страницы
        $smarty->display('news.tpl');
?>
    <ul>
        {$var}
        {$smarty.now}
        {$arr.title}

        {* Коментарий *}

        {include file="inc/header.tpl" title="Последние новости"}

        {if}

        {else}

        {/if}

        {foreach from=$arr item="n" key="k"}
        {/foreach}
    </ul>



<?php
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
