// Clear any previous measurements
run("Clear Results");

// Measure whatever is on the current image before proceeding
run("Measure");

// Split the image into its channels
run("Split Channels");

// Get the list of all open windows (which now includes the split channels)
allWindows = getList("image.titles");

// Variables to store the green and red window titles
greenWindow = "";
redWindow = "";

// Loop through all windows to find the Green and Red channels
for (i = 0; i < allWindows.length; i++) {
    windowTitle = allWindows[i];

    // Convert the window title to lowercase for comparison
    lowerTitle = toLowerCase(windowTitle);

    // Identify the Green channel
    if (indexOf(lowerTitle, "(green)") != -1) {
        greenWindow = windowTitle; // Store the Green window title
    }

    // Identify the Red channel
    if (indexOf(lowerTitle, "(red)") != -1) {
        redWindow = windowTitle; // Store the Red window title
    }
}

// Ensure the Green channel is measured first
if (greenWindow != "") {
    selectWindow(greenWindow);
    setThreshold(75, 255);
    run("Measure");
}

// Then measure the Red channel
if (redWindow != "") {
    selectWindow(redWindow);
    setThreshold(100, 255);
    run("Measure");
}
