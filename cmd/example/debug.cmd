@echo off

setlocal EnableExtensions
setlocal EnableDelayedExpansion

> nul chcp 65001
title App
color f0

:: mode con: cols=120 lines=25

set app=%~dpnx0
set app.name=%~nx0

if not '%1'=='s' (
    call autoload init
    call autoload class\array
    call autoload class\user
    call autoload close
    exit /b
)

:: App
:app [args...]
    set app.args=%*

    :: Local func
    call :app.print "Hello world!!!"

    :: User
    echo.
    echo User----

    call :user obj root 1111 Admin -1

    call :user.isset root a
    echo root is !a!

    call :user.isset lol b
    echo lol is !b!


    echo --------

    :: Array
    echo.
    echo Array---

    call :array arr

    call :arr.add Andrew
    call :arr.add Vitya
    call :arr.add Vanya
    call :arr.add Iliya
    call :arr.add Vova

    call :arr.get 0 tt
    echo Index 0: %tt%

    call :arr.find Vova hh
    echo Index of Vova: %hh%

    echo Count items: %arr.lenght%
    echo Array: %arr.array%

    echo --------

    :: AutoLoad
    call :autoload.debug
    echo count: %autoload.count%
    echo list: %autoload.modules%

    > nul pause
exit /b

:: Function
:app.print [msg]
    setlocal
        set msg=%~1

        echo -----
        echo %msg%
        echo -----

    endlocal
exit /b

:array [var]
    setlocal
        set var=%1

    endlocal & (
        :: Свойства объекта
        set %var%.lenght=0
        set %var%.array=

        :: Методы
        >> %app% (
            echo.
            echo :%var%.get [index][var]
            echo.    set /a array.index=%%1 + 1
            echo.    for /f "tokens=%%array.index%% delims=," %%%%i in ^("%%%var%.array%%"^) do ^(
            echo.        set %%2=%%%%i
            echo.    ^)
            echo exit /b

            echo.
            echo :%var%.add [value]
            echo.    if defined %var%.array set dot=,
            echo.    set %var%.array=%%%var%.array%%%%dot%%%%1
            echo.    set /a %var%.lenght+=1
            echo exit /b

            echo.
            echo :%var%.find [value][var]
            echo.    set array.serch=%%%var%.array:,= %%
            echo.    set array.count=0
            echo.    for %%%%i in ^(%%array.serch%%^) do ^(
            echo.        if '%%%%i'=='%%1' ^(
            echo.            set %%2=^^!array.count^^!
            echo.            exit /b
            echo.        ^)
            echo.        set /a array.count+=1
            echo.    ^)
            echo.    set %%2=
            echo exit /b
        )

    )
exit /b

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

:autoload.debug
    type C:\Users\A4F7~1\AppData\Local\Temp\app.cmd > D:\reference\cmd\example\debug.cmd
exit /b

:logins.get [index][var]
    set /a array.index=%1 + 1
    for /f "tokens=%array.index% delims=," %%i in ("%logins.array%") do (
        set %2=%%i
    )
exit /b

:logins.add [value]
    if defined logins.array set dot=,
    set logins.array=%logins.array%%dot%%1
    set /a logins.lenght+=1
exit /b

:logins.find [value][var]
    set array.serch=%logins.array:,= %
    set array.count=0
    for %%i in (%array.serch%) do (
        if '%%i'=='%1' (
            set %2=!array.count!
            exit /b
        )
        set /a array.count+=1
    )
    set %2=
exit /b

:passwords.get [index][var]
    set /a array.index=%1 + 1
    for /f "tokens=%array.index% delims=," %%i in ("%passwords.array%") do (
        set %2=%%i
    )
exit /b

:passwords.add [value]
    if defined passwords.array set dot=,
    set passwords.array=%passwords.array%%dot%%1
    set /a passwords.lenght+=1
exit /b

:passwords.find [value][var]
    set array.serch=%passwords.array:,= %
    set array.count=0
    for %%i in (%array.serch%) do (
        if '%%i'=='%1' (
            set %2=!array.count!
            exit /b
        )
        set /a array.count+=1
    )
    set %2=
exit /b

:obj.set [name][age]
    if not '%1'=='' set obj.name=%1
    if not '%2'=='' set obj.age=%2
exit /b

:obj.print
    echo Name:  %obj.name%
    echo Age:   %obj.age%
exit /b

:arr.get [index][var]
    set /a array.index=%1 + 1
    for /f "tokens=%array.index% delims=," %%i in ("%arr.array%") do (
        set %2=%%i
    )
exit /b

:arr.add [value]
    if defined arr.array set dot=,
    set arr.array=%arr.array%%dot%%1
    set /a arr.lenght+=1
exit /b

:arr.find [value][var]
    set array.serch=%arr.array:,= %
    set array.count=0
    for %%i in (%array.serch%) do (
        if '%%i'=='%1' (
            set %2=!array.count!
            exit /b
        )
        set /a array.count+=1
    )
    set %2=
exit /b
