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

// $awardNameUpdate ='hellooooo';
// $awardDescriptionUpdate = 'bob';
// $dateReceivedUpdate ='duck';
// $applicantEmailInsert = 'Sharon_6686@alumni.ubc.ca';

  // $hobbyNameUpdate ='booooo'; //testing
// Create connection to Oracle
$conn = oci_connect("ora_f5x0b", "a40858169", "dbhost.ugrad.cs.ubc.ca:1522/ug");

//TODO: add exception handling? (when the hobby is already in the database, will it crash? return error message?)

$insertAward = "INSERT INTO Award VALUES('$awardDescriptionUpdate', '$awardNameUpdate', '$dateReceivedUpdate')";
$insertHaveAward = "INSERT INTO HaveAward VALUES('$awardNameUpdate', '$dateReceivedUpdate', '$applicantEmailInsert')";

// $select= "SELECT awardName from Award where Award.awardName = 'booooo'"; //testing

// $select= "SELECT awardName from Award where Award.awardName = 'hellooooo'"; //testing

$stidAward = oci_parse($conn, $insertAward);
oci_execute($stidAward);

$stidHaveAward = oci_parse($conn, $insertHaveAward);
oci_execute($stidHaveAward);

//
// $stid = oci_parse($conn, $select); //testing
// $result = oci_execute($stid);

//to remember the entire json string
$json = array(); //hailin

// Fetch each row in an associative array
//print '<table border="1">'

// while ($row = oci_fetch_array($stid, OCI_RETURN_NULLS+OCI_ASSOC)) {
//
//      //to concatenate a ',' after every json object. used to split before parsing.
// 	    $json [] = $row ;
//
// }
// $response = (json_encode($json));
//
//
// echo $response;



OCICommit($conn);
oci_close($conn);
?>
