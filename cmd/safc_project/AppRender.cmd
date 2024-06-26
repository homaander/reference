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
set Safc.libs=Render Array

:: Option
set Render.path=img
set Render.files=logo test

:: Run
safc\autoload 2> nul

:App
    :: Render
    call :Render.load
    call :Render.print logo
    call :Render.print test

    pause > nul
exit /b
