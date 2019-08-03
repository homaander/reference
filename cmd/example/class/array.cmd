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
            echo.    set %var%.array=%%%var%.array%%%%1,
            echo.    set /a %var%.lenght+=1
            echo exit /b
        )

    )
exit /b
