<?php
header("Access-Control-Request-Method: *");
header("Access-Control-Request-Headers: *");
header("Access-Control-Allow-Origin: *");
$json = $HTTP_RAW_POST_DATA;

$obj = json_decode($json);
$json='';
echo $json;

$organizationUpdate =$obj->ORGANIZATION;
$experienceRoleUpdate = $obj->EXPERIENCEROLE;
$durationUpdate = $obj->DURATION;
$experienceTypeUpdate = $obj->EXPERIENCETYPE;
$experienceDescriptionUpdate = $obj->EXPERIENCEDESCRIPTION;
$applicantEmailInsert = $obj->APPLICANTEMAIL;

// Create connection to Oracle
$conn = oci_connect("ora_f5x0b", "a40858169", "dbhost.ugrad.cs.ubc.ca:1522/ug");

//TODO: add exception handling? (when the hobby is already in the database, will it crash? return error message?)

$insertExperience = "INSERT INTO Experience VALUES(:organizationUpdate,
                          :experienceRoleUpdate, :durationUpdate, :experienceTypeUpdate,
                          :experienceDescriptionUpdate)";
$insertHaveExperience = "INSERT INTO HaveProject VALUES(:applicantEmailInsert, :organizationUpdate,
                          :experienceRoleUpdate)";

// $select= "SELECT hobbyName from Hobby where Hobby.hobbyName = 'booooo'"; //testing

$stidExperience = oci_parse($conn, $insertExperience);
oci_bind_by_name($stidExperience, ':organizationUpdate', $organizationUpdate);
oci_bind_by_name($stidExperience, ':experienceRoleUpdate', $experienceRoleUpdate);
oci_bind_by_name($stidExperience, ':durationUpdate', $durationUpdate);
oci_bind_by_name($stidExperience, ':experienceTypeUpdate', $experienceTypeUpdate);
oci_bind_by_name($stidExperience, ':experienceDescriptionUpdate', $experienceDescriptionUpdate);
oci_execute($stidExperience);

$stidHaveExperience = oci_parse($conn, $insertHaveExperience);
oci_bind_by_name($stidHaveExperience, ':organizationUpdate', $organizationUpdate);
oci_bind_by_name($stidHaveExperience, ':experienceRoleUpdate', $experienceRoleUpdate);
oci_bind_by_name($stidHaveExperience, ':applicantEmailInsert', $applicantEmailInsert);
oci_execute($stidHaveExperience);

// $stid = oci_parse($conn, $select); //testing
// $result = oci_execute($stid);

// //to remember the entire json string
// $json = array(); //hailin

// // Fetch each row in an associative array
// //print '<table border="1">'

// while ($row = oci_fetch_array($stid, OCI_RETURN_NULLS+OCI_ASSOC)) {

//      //to concatenate a ',' after every json object. used to split before parsing.
// 	    $json [] = $row ;

// }
// $response = (json_encode($json));


// echo $response;

// Fetch each row in an associative array

//0cy27

OCICommit($conn);
oci_close($conn);
?>
