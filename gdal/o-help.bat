@echo off
:: Osgeo4w Quick Help -- report available executables in o4w bin directory
::
:: 2012-02(Feb)-06, Matt Wilkie <maphew@gmail.com>
:: License: Open source MIT, http://www.opensource.org/licenses/mit-license
::
setlocal enabledelayedexpansion

:Main
  echo.                   -={ OSGeo4W Shell Commands }=-
  if "%OSGEO4W_ROOT%"=="" goto :NoEnv

      rem Generate executables list
      pushd %OSGEO4W_ROOT%\bin
      for %%a in (exe com bat) do (
        echo. >> "%temp%\o-help-list.txt"
        if exist *.%%a dir /d *.%%a |find ".%%a" >>"%temp%\o-help-list.txt"
        )
      popd

      rem Strip extensions and report just names
      rem c.f. http://ss64.com/nt/syntax-replace.html
      for /f "usebackq delims=?" %%g in ("%temp%\o-help-list.txt") do (
        set _s=%%g
        set _s=!_s:.exe=!
        set _s=!_s:.com=!
        set _s=!_s:.bat=!
        echo.       !_s!
        )
      echo.
      del "%temp%\o-help-list.txt"

      rem Report gdal version, if present
      for %%g in (gdalinfo.exe) do if not "%%~dp$PATH:g"=="" gdalinfo --version

  goto :EOF

:NoEnv
  echo    ERROR: OSGEO4W_ROOT is not set
  echo.
