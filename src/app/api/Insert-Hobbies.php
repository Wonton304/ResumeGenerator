<?php
  header("Access-Control-Request-Method: *");
  header("Access-Control-Request-Headers: *");
  header("Access-Control-Allow-Origin: *");

  $json = $HTTP_RAW_POST_DATA;
  echo $json;
  $obj = json_decode($json);

  $hobbyNameUpdate =$obj->HOBBYNAME;
  $applicantEmail = $obj->APPLICANTEMAIL;

  // $hobbyNameUpdate ='booooo'; //testing
// Create connection to Oracle
$conn = oci_connect("ora_e0w0b", "a22288161", "dbhost.ugrad.cs.ubc.ca:1522/ug");

//TODO: add exception handling? (when the hobby is already in the database, will it crash? return error message?)

$insert1 = "INSERT INTO Hobby VALUES(:hobbyNameUpdate)";
$insert2 = "INSERT INTO HaveHobby VALUES(:applicantEmail, :hobbyNameUpdate)";

// $select= "SELECT hobbyName from Hobby where Hobby.hobbyName = 'booooo'"; //testing

$stid1 = oci_parse($conn, $insert1);
oci_bind_by_name($stid1, ':hobbyNameUpdate', $hobbyNameUpdate);
oci_execute($stid1);

$stid2 = oci_parse($conn, $insert2);
oci_bind_by_name($stid2, ':applicantEmail', $applicantEmail);
oci_bind_by_name($stid2, ':hobbyNameUpdate', $hobbyNameUpdate);
oci_execute($stid2);

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
