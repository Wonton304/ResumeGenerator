
<?php
 header("Access-Control-Request-Method: *");
  header("Access-Control-Request-Headers: *");
  header("Access-Control-Allow-Origin: *");
//this tells the system that it's no longer just parsing
//html; it's now parsing PHP
// Create connection to Oracle
$conn = oci_connect("ora_g6b1b", "a17492166", "dbhost.ugrad.cs.ubc.ca:1522/ug");

$query = 'select address from Location2';
$stid = oci_parse($conn, $query);
$r = oci_execute($stid);

//to remember the entire json string
$json = ''; //hailin

// Fetch each row in an associative array
//print '<table border="1">'

while ($row = oci_fetch_array($stid, OCI_RETURN_NULLS+OCI_ASSOC)) {
   foreach ($row as $item) {
     //to concatenate a ',' after every json object. used to split before parsing.
	    $json = $json . json_encode($row,JSON_PRETTY_PRINT) . ",";
   }
}
//to remove the , after the last json object. IMPORTANT!!! DO NOT REMOVE THIS, otherwise it will not work!
$json = rtrim($json,", ");
echo $json;


//row = OCI_Fetch_Array($r, OCI_BOTH);
//echo json_encode($row);

?>
