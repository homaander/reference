:Engin [command][img]
    setlocal
        set command=%1
        set img=%2

    endlocal & (
        :: Объекты
            set map=
            set player=
            call :Render %img%

        :: Методы
            >> %App.name% (
                echo.

            )
    )
exit /b
