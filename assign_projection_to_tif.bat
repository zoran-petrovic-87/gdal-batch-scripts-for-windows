CLS
@ECHO OFF
COLOR f1
ECHO ************************************************************
ECHO *         - BATCH ASSIGN PROJECTION TO TIF FILES -         *
ECHO ************************************************************
ECHO * Author: Zoran Petrovic                                   *
ECHO * Email: zoran@zoran-software.com                          *
ECHO * License: MIT License                                     *
ECHO ************************************************************
PAUSE
CLS
ECHO Enter the path to the directory containing the TIF files
ECHO * The path should not be surrounded with double quotes.
ECHO * Example: C:\Users\Zoran\Desktop\temp files\tif
SET /P dir_in=: 
CLS
ECHO Enter the path to the output directory
ECHO * The path should not be surrounded with double quotes.
ECHO * If the directory does not exist yet, it will be created.
ECHO * Example: C:\Users\Zoran\Desktop\temp files\output
SET /P dir_out=: 
CLS
ECHO Enter the EPSG code
ECHO * Example: 4326
SET /P epsg=: 
IF NOT EXIST "%dir_out%" MD "%dir_out%"
CLS
FOR %%a IN ("%dir_in%\*.tif") DO (
	.\gdal\gdal_translate.exe -a_srs EPSG:%epsg% "%%a" "%dir_out%\%%~na.tif"
)
ECHO ************************************************************
ECHO *                           DONE                           *
ECHO ************************************************************
PAUSE