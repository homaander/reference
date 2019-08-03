:autoload [file]
    if '%1'=='init' (
        set autoload.flag=0
        exit /b
    )

    if '%1'=='close'  (
        >> %temp%\%app.name% (
            echo.
            echo :autoload.debug
            echo.    type %temp%\%app.name% ^> %~dp0debug.cmd
            echo exit /b
        )

        %temp%\%app.name% s
    )

    if not '%autoload.flag%'=='1' (
        set autoload.flag=1
        > %temp%\%app.name% type %app.name%
    )

    >> %temp%\%app.name% (
        echo.
        type %1.cmd

        set /a autoload.count += 1
        set autoload.modules=%autoload.modules%%1 
    )
exit /b