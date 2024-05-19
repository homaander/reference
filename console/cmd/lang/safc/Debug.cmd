:Debug [level][msg]
    cls

    if '%1'=='notice' color F1
    if '%1'=='warn'   color F6
    if '%1'=='error'  color FC

    echo Debug:
    echo.    Message: %2

    pause > nul
exit /b
