:: Работа с текстовыми изображениями
:: Вывод на экран
:Render.print [name]
    set /a Render.i = !Render.i.%1.length! - 1

    for /l %%i in (0,1,%Render.i%) do (
        echo !Render.i.%1%%i!
    )
exit /b
