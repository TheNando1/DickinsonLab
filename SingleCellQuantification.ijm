// Clear previous measurements
run("Clear Results");

// Save the current image name
originalImage = getTitle();

// Check if there is an active selection by attempting to add it to the ROI Manager
run("ROI Manager...");
roiManager("Add");
roiCount = roiManager("count");
if (roiCount == 0) {
    exit("Error: Please make a selection before running the macro.");
}

// Measure the area of the currently encircled region
roiManager("Select", 0);
run("Measure");

// Split the channels
run("Split Channels");

// Automatically find the green channel
greenImage = originalImage + " (green)";
selectWindow(greenImage);

// Restore the saved ROI
roiManager("Select", 0);

// Set threshold for the green channel (100, 255)
setThreshold(100, 255);
run("Measure");

// Reset ROI Manager to clear it
roiManager("reset");

// Close all open images
run("Close All");

// Reopen the original image from the file
open(originalImage);
