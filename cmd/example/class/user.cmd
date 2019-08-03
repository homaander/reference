:user [var][login][pass][name][age]
    setlocal
        set var=%1

    endlocal & (
        :: Свойства объекта
        if not '%2'=='' ( set %var%.login=%2 ) else ( call user.error "Login is not defined" )
        if not '%3'=='' ( set %var%.pass=%3 ) else ( call user.error "Password is not defined" )
        if not '%4'=='' set %var%.name=%4
        if not '%5'=='' set %var%.age=%5

        :: Статические свойства
        set /a user.count+=1

        if not defined logins.array (
            call :array logins
            call :array passwords
        )

        call :logins.add %2
        call :passwords.add %3

        :: Методы
        >> %app% (
            echo.
            echo :%var%.set [name][age]
            echo.    if not '%%1'=='' set %var%.name=%%1
            echo.    if not '%%2'=='' set %var%.age=%%2
            echo exit /b

            echo.
            echo :%var%.print
            echo.    echo Name:  %%%var%.name%%
            echo.    echo Age:   %%%var%.age%%
            echo exit /b
        )

    )
exit /b

:user.isset [login][var]
    call :logins.find %1 user.is
    if not '!user.is!'=='' (
        set %2=1
    ) else set %2=0
exit /b

:user.enter [var]
    set %1=getMethods
exit /b

:user.error [msg]
    cls
    color FC
    echo User: %~1
exit /b
