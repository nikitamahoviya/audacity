@REM wiki2htm without the xcopy.  The results stay in the temp directory.  
@REM Can be convenient when testing/modifying the script.
python3 mw2html.py https://alphamanual.audacityteam.org/man ..\..\help\temp -s


@echo off
set "$py=0"
call:construct

for /f "delims=" %%a in ('python #.py ^| findstr "3"') do set "$py=3"
del #.py
goto:%$py%

echo python is not installed or python's path Path is not in the %%$path%% env. var
exit/b


:3
echo running with PY 3

exit/b

:construct
echo import sys; print('{0[0]}.{0[1]}'.format(sys.version_info^)^) >#.py
