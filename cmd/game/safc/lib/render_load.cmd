:Render_Load
    >> safc\bin\%App.name% (
        echo :Img
        for %%a in (%Render.img%) do (
            echo.    set %%a=hello world
        )
        echo exit /b
        echo.
    )
exit /b