@echo off

setlocal enableExtensions
setlocal enableDelayedExpansion

chcp 65001 > nul

set App=%~dpnx0
set App.name=%~nx0
set App.path=%~dp0

title Game
color F0

:: Safc
set Safc.libs=Render Array

:: Option
set Render.path=img
set Render.files=logo test

:: Run
safc\autoload 2> nul

:App
    :: Render
    call :Render.start
    call :Render.print logo
    call :Render.print test

    pause > nul
exit /b

:Debug [level][msg]
    cls

    if '%1'=='notice' color F1
    if '%1'=='warn'   color F6
    if '%1'=='error'  color FC

    echo Debug:
    echo.    Message: %2

    pause > nul
exit /b

:Render.start

    set Render.i.logo0=   ####  #####  #####   ####
    set Render.i.logo1=  #      #   #  #      #
    set Render.i.logo2=   ##    #####  ###    #
    set Render.i.logo3=     #   #   #  #      #
    set Render.i.logo4= ####    #   #  #       ####
    set Render.i.logo.length=5

    set Render.i.test0=1234    8421
    set Render.i.test1=4432    3243
    set Render.i.test2=3234 -- 2323
    set Render.i.test3=1232    0412
    set Render.i.test4=2343    6421
    set Render.i.test.length=5

exit /b

:: Работа с текстовыми изображениями
:: Вывод на экран
:Render.print [name]
    set /a Render.i = !Render.i.%1.length! - 1

    for /l %%i in (0,1,%Render.i%) do (
        echo !Render.i.%1%%i!
    )
exit /b

:: Работа с массивами
:: Создание
:Array [array][count][empty?]
    if "%3" == "1" (
        set %1.array=0 & set %1.count=%2
    ) else (
        set /a %1.count+=%2
    )

    for /l %%i in (1, 1, %2) do set %1.array=!%1.array!0,
exit /b

:: Добовление элемента
:Array.add [array][value]
    set %1.array=!%1.array!%2,
    set /a %1.count+=1
exit /b

:: Изменение элемента
:Array.set [array][index][value]
    setlocal
        
        set Array.var=%1
        set Array.serch=!%Array.var%.array:,= !

        set Array.index=%2
        set Array.value=%3

    endlocal & (
        set Array.loop=0
        set Array.result=

        for %%i in (%Array.serch%) do (

            if "!Array.loop!" == "%Array.index%" (
                set Array.result=!Array.result!%Array.value%,
            ) else (
                set Array.result=!Array.result!%%i,
            )

            set /a Array.loop+=1
        )
        set %Array.var%.array=!Array.result!
    )
exit /b

:: Получить элемент в переменную или послать как аргумент функции 
:Array.get [array][index][var\callback]
    setlocal

        set    Array.var=%1
        set /a Array.index=%2 + 1
        set    Array.out=%~3

    endlocal & (
        for /f "tokens=%Array.index% delims=," %%i in ("!%Array.var%.array!") do (
            if "%Array.out:~0,1%" == "{" (
                call :%Array.out:~1,-1% %%i
            ) else (
                set %Array.out%=%%i
            )
        )
    )
exit /b

:: Найти элемент в массиве
:Array.find [array][value][var\callback]
    setlocal

        set Array.var=%1
        set Array.index=0
        set Array.out=%~3

        set Array.serch=!%Array.var%.array:,= !

    endlocal & (
        set Array.count=0
        for %%i in (%Array.serch%) do (
            if "%%i" == "%2" (
                if "%Array.out:~0,1%" == "{" (
                    call :%Array.out:~1,-1% !Array.count!
                ) else (
                    set %Array.out%=!Array.count!
                )
            )
            set /a Array.count+=1
        )
        set %3=null
    )
exit /b

