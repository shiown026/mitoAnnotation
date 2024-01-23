// Set Measurement Parameters.
run("Set Measurements...", "area mean standard min center shape median redirect=None decimal=3");
// Clear records in Results Window.
run("Clear Results");
// Close all Windows
run("Close All");

// Clear records in roiManager.
if (roiManager("count")!= 0) {
	roiManager("show all");
	roiManager("delete");
	};
	
// Import 2D Image. 	
open();
rename("origin");
run("Duplicate...", "title=input");

// Apply Gaussian Blur.
run("Gaussian Blur...", "sigma=1");
// Apply Top Hat.
run("Top Hat...", "radius=2 don't");

// Apply K-means Clustering, to seperate mitochondria from background based on fluorescence intensity.
run("k-means Clustering ...", "number_of_clusters=2 cluster_center_tolerance=0.00010000 enable_randomization_seed randomization_seed=48");
imageCalculator("Multiply create", "input","Clusters");
selectImage("Result of input");

// Mitochondria Morphology Analysis
// In the ROI Manager, each item represent one mitochondrion
setThreshold(1, 65535, "raw");
run("Analyze Particles...", "size=200-5000 pixel show=Outlines display add composite");

// Create Boxplot, this need additional plugin "BAR"
// Find information here: https://imagej.net/plugins/bar
run("Create Boxplot", "use=Results circ. group=*None*");

// Save all ROI information into ROI.zip
// This ROI.zip could be further adjust manully in downstream analysis
selectWindow("ROI Manager");
roiManager("show all")
roiManager("Save","");

// Save Results to .csv
saveAs("Results", "");

