<?php
header("Access-Control-Request-Method: *");
header("Access-Control-Request-Headers: *");
header("Access-Control-Allow-Origin: *");

$json = $HTTP_RAW_POST_DATA;

$obj = json_decode($json);
$json='';
echo $json;


$applicantEmail = $obj->APPLICANTEMAIL;
// $applicantEmail = 'Vita_9610@alumni.ubc.ca';


// Create connection to Oracle
$conn = oci_connect("ora_f5x0b", "a40858169", "dbhost.ugrad.cs.ubc.ca:1522/ug");



$select= "SELECT DISTINCT Applicant2.applicantName, Applicant2.applicantEmail,
                            Applicant2.applicantAddress, Applicant2.githubAccount,
                            Applicant2.personalDescription, Applicant2.applicantPhoneNumber
from Applicant2
WHERE Applicant2.applicantEmail =: applicantEmail";


$stid = oci_parse($conn, $select);
oci_bind_by_name($stid, ':applicantEmail', $applicantEmail);
$result = oci_execute($stid);
// oci_bind_by_name($stid, ':jobidDiv', $jobidDiv);
// oci_bind_by_name($stid, ':applicantEmailDiv', $applicantEmailDiv);


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
