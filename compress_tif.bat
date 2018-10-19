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
ECHO Search for TIF files in subfolders 
ECHO and replace existing files?
ECHO * yes or no
ECHO *
ECHO * Warning: Be careful when using this option 
ECHO * (especially with JPEG compression)!.
ECHO * In case of an error you could lose your data!
SET /P search_subfolders=: 

CLS
IF /I "%search_subfolders%"=="yes" GOTO skip_output_dir
ECHO Enter the path to the output directory
ECHO * The path should not be surrounded with double quotes.
ECHO * If the directory does not exist yet, it will be created.
ECHO * Example: C:\Users\Zoran\Desktop\temp files\output
SET /P dir_out=: 
CLS
IF NOT EXIST "%dir_out%" MD "%dir_out%"
:skip_output_dir

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
IF %type% == 1 SET type_val=-co COMPRESS=PACKBITS -co BIGTIFF=YES
IF %type% == 2 SET type_val=-co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -co BIGTIFF=YES
IF %type% == 3 SET type_val=-co COMPRESS=JPEG -co JPEG_QUALITY=75 -co BIGTIFF=YES

IF /I "%search_subfolders%"=="yes" GOTO search_subfolders
FOR %%a IN ("%dir_in%\*.tif") DO (
	ECHO "%%~nxa"
	.\gdal\gdal_translate.exe -of GTiff %type_val% "%%a" "%dir_out%\%%~na.tif" -co "TFW=YES"
)
GOTO end

:search_subfolders
FOR /R "%dir_in%\" %%a IN (*.tif) DO (
	.\gdal\gdal_translate.exe -of GTiff %type_val% "%%a" "%%atemp" -co "TFW=YES"
	echo "%%~nxa"
	DEL "%%a"
	rename "%%atemp" "%%~nxa"
)
:end
ECHO ************************************************************
ECHO *                           DONE                           *
ECHO ************************************************************
PAUSE