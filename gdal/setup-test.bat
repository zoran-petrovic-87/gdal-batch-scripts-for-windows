@copy "C:\OSGeo4W642\bin\osgeo4w-setup.exe" "C:\OSGeo4W642\bin\osgeo4w-setup-work.exe"
@start /b "Running with setup_test.ini" "C:\OSGeo4W642\bin\osgeo4w-setup-work.exe" -R "C:\OSGeo4W642" -t %*
