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
