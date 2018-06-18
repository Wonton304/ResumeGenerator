<?php
header("Access-Control-Request-Method: *");
header("Access-Control-Request-Headers: *");
header("Access-Control-Allow-Origin: *");

$json = $HTTP_RAW_POST_DATA;

$obj = json_decode($json);
$json='';
echo $json;

// Create connection to Oracle
$conn = oci_connect("ora_f5x0b", "a40858169", "dbhost.ugrad.cs.ubc.ca:1522/ug");

$applicantEmail = $obj->APPLICANTEMAIL;

$get = "SELECT hobbyName from HaveHobby where applicantEmail = :applicantEmail";

$stid = oci_parse($conn, $get);
oci_bind_by_name($stid, ':applicantEmail', $applicantEmail);
oci_execute($stid);

//to remember the entire json string
$jsonresp = array();

// Fetch each row in an associative array
//print '<table border="1">'

while ($row = oci_fetch_array($stid, OCI_RETURN_NULLS+OCI_ASSOC)) {

     //to concatenate a ',' after every json object. used to split before parsing.
	    $jsonresp [] = $row ;

}

$response = (json_encode($jsonresp));


echo $response;

OCICommit($conn);
oci_close($conn);

?>
