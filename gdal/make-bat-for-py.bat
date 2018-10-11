@echo off
echo.
echo.    Generating .bat files for all .py files in %OSGEO4W_ROOT%\bin
echo.

pushd "%OSGEO4W_ROOT%\bin"
for %%g in (*.py) do (
	echo @echo off >%%~ng.bat
	echo call "%%OSGEO4W_ROOT%%\bin\o4w_env.bat" >>%%~ng.bat
	echo python "%%OSGEO4W_ROOT%%\bin\%%g" %%* >>%%~ng.bat
)
popd
