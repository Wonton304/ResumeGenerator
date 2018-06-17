<?php
 header("Access-Control-Request-Method: *");
  header("Access-Control-Request-Headers: *");
  header("Access-Control-Allow-Origin: *");
// Create connection to Oracle
$conn = oci_connect("ora_s3z0b", "a16599169", "dbhost.ugrad.cs.ubc.ca:1522/ug");



$division= "SELECT R.technologyName
from Requires R
where R.id = '9ri86'
intersect
select distinct H.language
from HaveProject H
where H.applicantEmail = 'Charlotte_8850@alumni.ubc.ca'";
$stid = oci_parse($conn, $division);
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
