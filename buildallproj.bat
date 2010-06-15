call rsvars.bat
msbuild.exe taproj.groupproj /t:Clean;Build /p:"Config=Release Build"
pause