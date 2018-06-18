<?php
header("Access-Control-Request-Method: *");
header("Access-Control-Request-Headers: *");
header("Access-Control-Allow-Origin: *");
$json = $HTTP_RAW_POST_DATA;

$obj = json_decode($json);
$json='';
echo $json;

$jobID =$obj->JOBID;
$applicantEmailInsert = $obj->APPLICANTEMAIL;

  // $hobbyNameUpdate ='booooo'; //testing
// Create connection to Oracle
$conn = oci_connect("ora_f5x0b", "a40858169", "dbhost.ugrad.cs.ubc.ca:1522/ug");

//TODO: add exception handling? (when the hobby is already in the database, will it crash? return error message?)

$insertAppliesTo = "INSERT INTO AppliesTo VALUES('$jobID', '$applicantEmailInsert')";


// $select= "SELECT hobbyName from Hobby where Hobby.hobbyName = 'booooo'"; //testing

$stidAppliesTo = oci_parse($conn, $insertAppliesTo);
oci_execute($stidAppliesTo);

$stidHaveAward = oci_parse($conn, $insertHaveAward);
oci_execute($stidHaveAward);

//
// while ($row = oci_fetch_array($stidAppliesTo, OCI_RETURN_NULLS+OCI_ASSOC)) {
//      //to concatenate a ',' after every json object. used to split before parsing.
// 	    $json [] = $row ;
// }
// $response = (json_encode($json));
// echo $response;
// // Fetch each row in an associative array
//
// //0cy27



OCICommit($conn);
oci_close($conn);
?>
