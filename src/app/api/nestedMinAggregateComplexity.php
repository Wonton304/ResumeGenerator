<?php
 header("Access-Control-Request-Method: *");
  header("Access-Control-Request-Headers: *");
  header("Access-Control-Allow-Origin: *");
// Create connection to Oracle
$conn = oci_connect("ora_f5x0b", "a40858169", "dbhost.ugrad.cs.ubc.ca:1522/ug");



$delete= "SELECT min(avg(minimumProficiency))
FROM RequiredTechnology
Group by techologyType";
$stid = oci_parse($conn, $delete);
$result = oci_execute($stid);
//to remember the entire json string
$json = array(); //hailin

// Fetch each row in an associative array
//print '<table border="1">'

while ($row = oci_fetch_array($stid, OCI_RETURN_NULLS+OCI_ASSOC)) {

     //to concatenate a ',' after every json object. used to split before parsing.
	    $json [] = $row ;

}
$response = (json_encode($json));


echo $response;

// Fetch each row in an associative array

//0cy27
?>
