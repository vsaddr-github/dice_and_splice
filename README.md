# dice_and_splice

### Dice and splice image files using Image Magick on Windows

Windows batch file in this repo:  `dice_n_splice.bat`

### Install Image Magick

Download IM from  https://imagemagick.org/script/download.php#window and install on your computer. 

Make sure magick.exe is on your path. Otherwise replace "magick" in the batch file with the full pathname like "D:\Program Files\ImageMagick-7.1.0-Q16-HDRI\magick.exe" (quotes are needed if path contains spaces). The command may look like this:

`"D:\Program Files\ImageMagick-7.1.0-Q16-HDRI\magick.exe" %fin% -background blue  ......`

The script at the moment is configured for Canon EOS R image dimensions and the specific image file. It is used to remove unnecessary parts of image of 35 mm "Vlads Test Target" scan for the sharpness analysis. "Vlads Test Target" in varios popular photographic formats as a _real strips of film_ is available at https://www.etsy.com/shop/SilverKnits

### Image samples
Visit https://www.facebook.com/VladsTestTarget/posts/pfbid0PuD38k9M5zCSXWL2m2apjPwdknxVGvkRofpjsvngCjoLhHYABASSFRKnzLq5HtKql for details and see images. GitHub cannot host large image files.

### How script works
See https://imagemagick.org/Usage/crop/#chop for general sampleas and explanations and see the comments inside batch file for the details.

### Limitations

Only png, tiff, jpeg, gif file types are supported (IM supported formats) -- but **NOT** camera RAW files. 

### Usage 
The easiest way to use on Windows : drop  the input file via "drag and drop"  on the batch file and output will appear in sliced directory underneaf the folder where input file is located. Via drag-n-drop you can run any number of conversions simultaneosly.

or 

Run from DOS/CMD prompt

`dice_n_splice.bat <input_file_name>`

note onle one file is accepted as input in one invokation from the command line.

