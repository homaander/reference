@echo off

setlocal EnableExtensions
setlocal EnableDelayedExpansion

> nul chcp 65001
title App
color f0

:: mode con: cols=120 lines=25

set App=%~dpnx0
set App.path=%~dp0
set App.name=%~n0

call :Autoload
call :Autoload class\Array
call :Autoload start

:: App
:App [args...]
    set App.args=%*

    :: Local func
    call :App.print "Hello world!!!"

    :: User
    :: echo.
    :: echo User----

    :: call :user obj root 1111 Admin -1

    :: call :user.isset root a
    :: echo root is !a!

    :: call :user.isset lol b
    :: echo lol is !b!

    :: echo --------

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

    :: Autoload
    :: call :Autoload.debug
    > nul pause
exit /b

:App.print [msg]
    setlocal
        set msg=%~1

        echo -----
        echo %msg%
        echo -----

    endlocal
exit /b

:Autoload [name]
    if not '%App.path:~0,-1%'=='%temp%' (
        if '%1'=='' (
            set /a Autoload.count=0
            set Autoload.list=

            > "%temp%\%App.name%.cmd" type "%App.name%.cmd"
        ) else if '%1'=='start' (
            %temp%\"%App.name%.cmd"
            exit /b
        ) else (
            set /a Autoload.count+=1
            set "Autoload.list=%Autoload.list%%1 "

            >> "%temp%\%App.name%.cmd" (
                echo.
                type %1.cmd
            )
        )
    )
exit /b

:Autoload.debug
    echo List:  %Autoload.list%
    echo Count: %Autoload.count%
    > debug.cmd type "%App.path%\%App.name%.cmd"
exit /b
