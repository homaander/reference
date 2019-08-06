:Array [var]
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
