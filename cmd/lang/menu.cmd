:Menu
    set return=hello world
exit /b

:Menu.print [text]
    echo %1
exit /b
