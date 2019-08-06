:Autoload [file]
    if '%1'=='start'  (
        >> %temp%\%app.name%.cmd (
            echo.
            echo :Autoload.debug
            echo.    echo --Autoload.debug--
            echo.    echo List: %Autoload.list%
            echo.    echo Count: %Autoload.count%
            echo.    type %temp%\%app.name%.cmd ^> %~dp0debug.cmd
            echo exit /b
        )

        %temp%\%app.name%
        exit /b
    )

    if '%1'=='' (
        > %temp%\%app.name%.cmd type %app.name%.cmd
        exit /b
    )

    >> %temp%\%app.name%.cmd (
        echo.
        type %1.cmd

        set /a Autoload.count += 1
        set Autoload.list=%Autoload.list%%1 
    )
exit /b