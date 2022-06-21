<?php
$hostname     = "MySQL"; // Enter Your Host Name
$username     = "root";      // Enter Your Table username
$password     = "Corent@123";          // Enter Your Table Password
$databasename = "azureiamportaldb"; // Enter Your database Name


$conn = new mysqli($hostname, $username, $password, $databasename);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


?>

