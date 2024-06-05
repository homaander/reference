@echo off

setlocal enableExtensions
setlocal enableDelayedExpansion

chcp 65001 > nul

set App=%~dpnx0
set App.name=%~n0
set App.path=%~dp0

title Game
color F0

:: Safc
set Safc.libs=Array

:: Run
safc\autoload 2> nul

:App
    call :Array.add arr Andrew
    call :Array.add arr Vitya
    call :Array.add arr Vanya

    call :Array.set arr 0 Test
    echo array: %arr.array% (%arr.count%)


    call :Array.get arr 1 value
    echo 1: %value%

    call :Array.get arr 1 "{App.print Value:}"

    call :Array.find arr Vitya index
    echo Vitya: %index%

    call :Array.find arr Vitya "{App.print Index:}"

    pause > nul
exit /b

:App.print [msg][var]
    echo --%*--
exit /b
