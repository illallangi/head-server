<?php

// Scan the images directory, remove the folder indicators and reset the index.
$files = array_values(array_diff(scandir('./images'), array('.', '..')));

// Get a random file from the array.
$int = rand(0, (count($files) - 1));
$file = $files[$int];

// Serve the file as JPG content.
header('Content-Type: image/jpeg');
readfile('./images/' . $file);

?>