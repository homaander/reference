:autoload
    if "%Safc.libs%"=="" if "%Safc.use%"=="" call safc\debug notice "Нет подключённых библиотек"

    (
        type %App.name%.cmd
        echo.
        type safc\Debug.cmd
        echo.
    ) > safc\bin\%App.name% .cmd

    for %%i in (%Safc.libs%) do (
        :: Работа с первичной нстройкой библиотеки (если она есть)
        if exist safc\lib\%%i_load.cmd call safc\lib\%%i_load

        (
            type safc\lib\%%i.cmd
            echo.
        ) >> safc\bin\%App.name%.cmd
    )

    for %%i in (%Safc.use%) do (
        (
            type %%i.cmd
            echo.
        ) >> safc\bin\%App.name%.cmd
    )

    cd safc\bin
    %App.name%.cmd
exit /b
