@echo off
for /D %%i in ( * ) do @( cd %%i & ( if exist dores.bat .\dores.bat ) & cd .. )
