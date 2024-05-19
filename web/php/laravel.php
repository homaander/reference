# Установка
    composer global require laravel/installer
    laravel new blog
# или
    composer create-project --prefer-dist laravel/laravel blog "5.8.*"

# Запустить лок. сервер (по умолчанию localhost:8000)
    php artisan serve

# Очистить кеш (в основнои после изменения .env)
    php artisan cache:clear

# Обновить Composer
    composer dumpautoload

# Регистрация
    php artisan make:auth

# Письма
    php artisan make:mail newMail --markdown=email

    # Кастомизация
        php artisan vendor:publish --tag=laravel-mail

# Модели
    #Создать модель +миграцию [ +контроллер ]
        php artisan make:model Task -m[c]


# Контроллеры
    php artisan make:controller TasksController

# Миграции
    # Создать системные миграции:
        php artisan migrate
    # Удалить все миграции:
        php artisan migrate:reset
    # Переустановить системные файлы:
        php artisan migrate:fresh
    # Обновить миграции:
        php artisan migrate:refresh
    # Создать миграцию:
        php artisan make:migration create_tasks_table --create=tasks

<?php
# Lavarel
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
        /* КонфигурацияЫ
            (.env)
                DB_CONNECTION =mysql
                DB_HOST       =127.0.0.1
                DB_DATABASE   =app
                DB_USERNAME   =root
                DB_PASSWORD   =1111
        */

        # Миграции
            Schema::create('tasks', function(Blueprint $table) {
                $table->increments('id');
                $table->text('body');
                $table->integer('user_id');
                $table->string('user_id');
                $table->boolean('user_id');
                $table->timestamps();
            });
        # Модели
            class Model
            {
                public static function incimpleted()
                {
                    return static::where('completed', 0)->get();
                }
            }
?>

<!-- Шаблонизатор Blade([name].blade.php) -->
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

