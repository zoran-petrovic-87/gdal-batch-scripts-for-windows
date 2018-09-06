CLS
@ECHO OFF
COLOR f1
ECHO ************************************************************
ECHO *                  - COMPRESS TIF FILES -                  *
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
IF NOT EXIST "%dir_out%" MD "%dir_out%"
CLS
ECHO Select compression profile:
ECHO * Enter 1 for a low compression.
ECHO * Enter 2 for a high compression.
ECHO * Enter 3 for a JPEG compression (lossy compression).
ECHO * 
ECHO * Warning: Lossy compression reduces a file by permanently
ECHO * eliminating certain information, especially redundant 
ECHO * information.
SET /P type=: 
CLS
if %type% == 1 SET type_val=-co COMPRESS=PACKBITS -co BIGTIFF=YES
if %type% == 2 SET type_val=-co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -co BIGTIFF=YES
if %type% == 3 SET type_val=-co COMPRESS=JPEG -co JPEG_QUALITY=75 -co BIGTIFF=YES

FOR %%a IN ("%dir_in%\*.tif") DO (
	.\gdal\gdal_translate.exe -of GTiff %type_val% "%%a" "%dir_out%\%%~na.tif"
)
ECHO ************************************************************
ECHO *                           DONE                           *
ECHO ************************************************************
PAUSE