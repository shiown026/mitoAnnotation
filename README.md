# mitoAnnotation
The ImageJ macro file provide scripts to automatic annotate mitochondria and analyze its morphology in fluorescent images.
The Segmentation is done by applying K-means clustering algorithm to separate mitochondria and the background by fluorescence intensity.
In the Data forder, we have fluorescent images of mitochondria stained with 100 nM NAO as sample images.
To run this macro, you will need additional plugins listed below.


Requirements:
-  Fiji:
    An Open-Source image processing package
-  IJ Plugins Toolkit:
    Used to 
-  BAR plugin:
    Used to create instant boxplot for mitochondria morphology inspection

References:
1. ij-Plugins Toolkit (https://ij-plugins.sourceforge.net/index.html)
2. BAR Plugins (https://imagej.net/plugins/bar)
