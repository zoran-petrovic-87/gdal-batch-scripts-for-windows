CLS
@ECHO OFF
COLOR f1
ECHO ************************************************************
ECHO *          - SET GDAL_DATA ENVIRONMENT VARIABLE -          *
ECHO ************************************************************
ECHO * Author: Zoran Petrovic                                   *
ECHO * Email: zoran@zoran-software.com                          *
ECHO * License: MIT License                                     *
ECHO ************************************************************
PAUSE
CLS
ECHO The environment variable GDAL_DATA will be set to:
ECHO "%~dp0gdal\gdal-data"
ECHO * If you wish to cancel, just close this window.
ECHO * If you wish to proceed press any key.
PAUSE
setx GDAL_DATA "%~dp0gdal\gdal-data"
pause
CLS
ECHO ************************************************************
ECHO *                           DONE                           *
ECHO ************************************************************
PAUSE