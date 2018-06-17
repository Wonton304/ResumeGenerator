<?php
<<<<<<< HEAD
$descriptionUpdate = "hi";
$idNum='6xn53';
// Create connection to Oracle
$conn = oci_connect("ora_s3z0b", "a16599169", "dbhost.ugrad.cs.ubc.ca:1522/ug");
=======
header("Access-Control-Request-Method: *");
header("Access-Control-Request-Headers: *");
header("Access-Control-Allow-Origin: *");
>>>>>>> 99993cb0633d2598729a9cf8faca796877d61b16

$json = $HTTP_RAW_POST_DATA;
$obj = json_decode($json);
$json='';
echo $json;

$applicantEmailDiv = $obj->APPLICANTEMAIL;
$jobidDiv = $obj->ID;

// Create connection to Oracle
$conn = oci_connect("ora_s3z0b", "a16599169", "dbhost.ugrad.cs.ubc.ca:1522/ug");



$division = "SELECT R.technologyName from Requires R where R.id = :jobidDiv intersect
            select distinct H.language
            from HaveProject H
            where H.applicantEmail = :applicantEmailDiv";


$stid = oci_parse($conn, $division);
oci_bind_by_name($stid, ':jobidDiv', $jobidDiv);
oci_bind_by_name($stid, ':applicantEmailDiv', $applicantEmailDiv);

$result = oci_execute($stid);


while ($row = oci_fetch_array($stid, OCI_RETURN_NULLS+OCI_ASSOC)) {
     //to concatenate a ',' after every json object. used to split before parsing.
	    $json [] = $row ;
}
$response = (json_encode($json));
echo $response;

// Fetch each row in an associative array

//0cy27

OCICommit($conn);
oci_close($conn);
?>
