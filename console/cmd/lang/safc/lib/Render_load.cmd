:: Вставка изображения в код программы
:Render_Load
    :: Создание метода
    (
        echo :Render.load
        echo.
    ) >> safc\bin\%App.name%.cmd

    :: Создание переменной на каждую линию изображения
    for %%a in (%Render.files%) do (
        set Render.index=0
        for /f "tokens=* delims=" %%b in (safc\%Render.path%\%%a.txt) do (
            echo.    set Render.i.%%a!Render.index!=%%b>> safc\bin\%App.name%.cmd
            set /a Render.index += 1
        )

        (
            echo.    set Render.i.%%a.length=!Render.index!
            echo.
        ) >> safc\bin\%App.name%.cmd
    )

    (
        echo exit /b
        echo.
    ) >> safc\bin\%App.name%.cmd
exit /b