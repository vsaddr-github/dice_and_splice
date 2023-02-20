echo on

:: "Vlads Test Target", 2023, v 1.0
::  
::  Download Image Magicvk from https://imagemagick.org/script/download.php#window and follow instructions.
::

:: input filename
set fin=%1


for /F "delims=" %%i in ("%fin%") do set dirname=%%~dpi
for /F "delims=" %%i in ("%fin%") do set filename="%%~nxi"
for /F "delims=" %%i in ("%fin%") do set basename=%%~ni


echo %dirname%
echo %filename%
echo %basename%

:: create folder to collect output
if not exist "%dirname%\sliced" mkdir "%dirname%\sliced"

:: Output file name, default format is PNG
set fout="%dirname%\sliced\%basename%-out.png"


:: canon eos r fyi only, not actually used
set imsx=6720
set imsy=4480

:: separator_width -- blue band width 
set separator_width=20

:: We start processing from down to top so the pixel numbering stays intact as we remove pieces of image

:: lower band processed - see script step 1

set  lower_band_start=2850
set  lower_band_cut=400
set /a lower_band_cut_start=lower_band_start+separator_width

:: upper band processed  - see script step 2

set  upper_band_start=1380
set  upper_band_cut=300
set /a upper_band_cut_start=upper_band_start+separator_width

:: ...and right to left so pixel numbering stays intact as we remove pieces of image
::
:: right_band_star  -- where to insert band on the right - step 3

set right_band_start=4200
set /a right_band_cut_start=right_band_start+separator_width
set right_band_cut_length=1350



:: left_band_start where to insert band on the left - step 4

set left_band_start=1450

:: left_band_cut_start -- where to start cut
set /a left_band_cut_start=left_band_start+separator_width

:: left_band_cut_length - how many pixels to cut on left
set left_band_cut_length=1225


:: lets do all steps in one go 

magick %fin% -background blue  ^
-splice 0x%separator_width%+0+%lower_band_start% -chop 0x%lower_band_cut%+0+%lower_band_cut_start% ^
-splice 0x%separator_width%+0+%upper_band_start% -chop 0x%upper_band_cut%+0+%upper_band_cut_start% ^
-splice %separator_width%x0+%right_band_start%+0 -chop %right_band_cut_length%x0+%right_band_cut_start%+0 ^
-splice %separator_width%x0+%left_band_start%+0  -chop %left_band_cut_length%x0+%left_band_cut_start%+0 ^
%fout%

timeout /t 10
