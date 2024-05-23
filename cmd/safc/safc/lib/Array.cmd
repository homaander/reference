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
