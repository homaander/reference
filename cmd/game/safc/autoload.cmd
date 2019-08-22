:: Соединение проектов и библиотек
:Autoload [path]

    > safc\bin\%App.name% (
        type %App.name%
        echo.
    )

    for %%i in (%Safc.libs%) do (
        if exist safc\lib\%%i_load.cmd call safc\lib\%%i_load

        >> safc\bin\%App.name% (
            type safc\lib\%%i.cmd
            echo.
        )
    )

    for %%i in (%Safc.use%) do (
        >> safc\bin\%App.name% (
            type %%i.cmd
            echo.
        )
    )

    cd safc\bin
    %App.name%

exit /b
