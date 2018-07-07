CLS
@ECHO OFF
COLOR f1
ECHO ************************************************************
ECHO *                - BATCH RESIZE TIF FILES -                *
ECHO ************************************************************
ECHO * Command:                                                 *
ECHO *                                                          *
ECHO *      gdal_translate -outsize -co "TFW=YES"               *
ECHO *                                                          *
ECHO * will be executed on each ".tif" file in the              *
ECHO * specified directory.                                     *
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
ECHO Enter the size of the output file
ECHO * Outsize is in pixels and lines unless '%%' is attached 
ECHO * in which case it is as a fraction of the input image size.
ECHO * Starting with GDAL 2.0, if one of the 2 values is
ECHO * set to 0, its value will be determined from the other one,
ECHO * while maintaining the aspect ratio of the source dataset.
ECHO * Example: 1600 1200
ECHO * Example: 30%% 30%%
SET /P size_in=: 
IF NOT EXIST "%dir_out%" MD "%dir_out%"
CLS
FOR %%a IN ("%dir_in%\*.tif") DO (
	.\gdal\gdal_translate.exe -outsize %size_in% "%%a" "%dir_out%\%%~na.tif" -co "TFW=YES"
)
ECHO ************************************************************
ECHO *                           DONE                           *
ECHO ************************************************************
PAUSE