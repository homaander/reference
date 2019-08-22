:Render
    setlocal
        for %%a in (%Render.img%) do (
            set var=%%a
            >> %App.name% (
                echo :!var!.print
                echo.    echo hello world!
                echo exit /b
                echo.
            )
        )  

    endlocal
exit /b

:Render.end
    pause > nul
    echo.
    for %%a in (%Render.begins%) do (
        set /a %%a.line+=1
    )  
exit /b
