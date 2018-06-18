<?php
header("Access-Control-Request-Method: *");
header("Access-Control-Request-Headers: *");
header("Access-Control-Allow-Origin: *");

$json = $HTTP_RAW_POST_DATA;

$obj = json_decode($json);
$json='';
echo $json;

$awardNameUpdate =$obj->AWARDNAME;
$awardDescriptionUpdate = $obj->AWARDDESCRIPTION;
$dateReceivedUpdate = $obj->DATERECEIVED;
$applicantEmailInsert = $obj->APPLICANTEMAIL;

  // $hobbyNameUpdate ='booooo'; //testing
// Create connection to Oracle
$conn = oci_connect("ora_s3z0b", "a16599169", "dbhost.ugrad.cs.ubc.ca:1522/ug");

//TODO: add exception handling? (when the hobby is already in the database, will it crash? return error message?)

$insertAward = "INSERT INTO Award VALUES(:awardDescriptionUpdate, :awardNameUpdate, :dateReceivedUpdate)";
$insertHaveAward = "INSERT INTO HaveAward VALUES(:awardNameUpdate, :dateReceivedUpdate, :applicantEmailInsert)";

// $select= "SELECT hobbyName from Hobby where Hobby.hobbyName = 'booooo'"; //testing

$stidAward = oci_parse($conn, $insertAward);
oci_bind_by_name($stidAward, ':awardNameUpdate', $awardNameUpdate);
oci_bind_by_name($stidAward, ':dateReceivedUpdate', $dateReceivedUpdate);
oci_execute($stidAward);

$stidHaveAward = oci_parse($conn, $insertHaveAward);
oci_bind_by_name($stidHaveAward, ':awardNameUpdate', $awardNameUpdate);  //just in case
oci_bind_by_name($stidHaveAward, ':dateReceivedUpdate', $dateReceivedUpdate); //just in case
oci_bind_by_name($stidHaveAward, ':applicantEmailInsert', $applicantEmailInsert);
oci_execute($stidHaveAward);


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
