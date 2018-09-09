# GDAL batch scripts for Windows
These scripts are very useful when you need to process multiple files that are stored in the same folder.

![Alt Text](https://raw.githubusercontent.com/zoran-petrovic-87/gdal-batch-scripts-for-windows/master/examples/resize_tif.gif)

How to use:

* Download the entire project to your PC (Clone or download > Download ZIP).
* Extract the .zip file.
* Run .bat file and follow the instructions.
* Note: if you get an error about GDAL_DATA variable, just run the **_set_gdal_data.bat** script.

## assign_projection_to_tif.bat
Assigns projection to TIF files without re-projecting.

## compress_tif.bat
Compresses TIF files. You can select one of three predefined compression types.

## remove_compression_from_tif.bat
Removes the compression from TIF files.

## resize_tif.bat
Resizes TIF files. You can specify exact dimensions in pixels or relative dimensions as percentage.
