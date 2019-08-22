@echo off

setlocal enableExtensions
setlocal enableDelayedExpansion

chcp 65001 > nul

set App=%~dpnx0
set App.name=%~nx0
set App.path=%~dp0

title Game
color F0

:: Safc подключение
    set Safc.libs=array
    :: set Safc.use=menu

    :: set Render.path=img\default
    :: set Render.img=map house

    safc\autoload 2> nul

:App
    :: Array
        call :Array.add arr Andrew
        call :Array.add arr Vitya
        call :Array.add arr Vanya

        echo array: %arr.array% (%arr.count%)

        call :Array.get arr 1 value
        echo 1: %value%
        call :Array.get arr 1 "{App.print Value:}"

        call :Array.find arr Vitya index
        echo Vitya: %index%
        call :Array.find arr Vitya "{App.print Index:}"

        :: call :Array.set arr 1 Lol
        :: call :Array arr 10
        :: call :Array arr 5 1


    pause > nul
exit /b

:App.print [msg][var]
    echo --%*--
exit /b

:: Работа с массивами
:Array [array][count][empty?]
    if '%3'=='1' (
        set %1.array=0 & set %1.count=%2
    ) else (
        set /a %1.count+=%2
    )

    for /l %%i in (1,1,%2) do set %1.array=!%1.array!0,
exit /b

:Array.add [array][value]
    set %1.array=!%1.array!%2,
    set /a %1.count+=1

exit /b

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

            if '!Array.loop!'=='%Array.index%' (
                set Array.result=!Array.result!%Array.value%,
            ) else (
                set Array.result=!Array.result!%%i,
            )

            set /a Array.loop+=1
        )

        set %Array.var%.array=!Array.result!
    )
exit /b

:Array.get [array][index][var\callback]
    setlocal

        set    Array.var=%1

        set /a Array.index=%2 + 1
        set    Array.out=%~3

    endlocal & (

        for /f "tokens=%Array.index% delims=," %%i in ("!%Array.var%.array!") do (
            if '%Array.out:~0,1%'=='{' (
                call :%Array.out:~1,-1% %%i
            ) else (
                set %Array.out%=%%i
            )
        )

    )
exit /b

:Array.find [array][value][var\callback]
    setlocal

        set Array.var=%1
        set Array.index=0
        set Array.out=%~3

        set Array.serch=!%Array.var%.array:,= !

    endlocal & (
        set Array.count=0
        for %%i in (%Array.serch%) do (
            if '%%i'=='%2' (
                if '%Array.out:~0,1%'=='{' (
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

