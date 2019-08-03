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
    echo User:
    echo.

    call :user obj foo 123

    echo %user.count%

    echo %obj.name%
    echo %obj.age%

    call :obj.set Andrew 17
    call :obj.print

    :: Array
    echo.
    echo Array:
    echo.

    call :array arr

    call :arr.add Andrew
    call :arr.add Vitya

    call :arr.get 0 tt
    echo Index 0: %tt%

    echo %arr.lenght%
    echo %arr.array%

    :: AutoLoad
    call :autoload.debug
    :: echo %autoload.count%
    :: echo %autoload.modules%

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
