<?php
  header("Access-Control-Request-Method: *");
  header("Access-Control-Request-Headers: *");
  header("Access-Control-Allow-Origin: *");

  $json = $HTTP_RAW_POST_DATA;
  echo $json;
  $obj = json_decode($json);

  $categoryUpdate =$obj->CATEGORY; //category is one of personal or academic right?
  $projectNameUpdate = $obj->PROJECTNAME;
  $projectDescriptionUpdate = $obj->PROJECTDESCRIPTION;
  $languageUpdate = $obj->LANGUAGE;
  $complexityUpdate = $obj->COMPLEXITY;
  $applicantEmailInsert = $obj->APPLICANTEMAIL;

  // $hobbyNameUpdate ='booooo'; //testing
// Create connection to Oracle
$conn = oci_connect("ora_f5x0b", "a40858169", "dbhost.ugrad.cs.ubc.ca:1522/ug");

//TODO: add exception handling? (when the hobby is already in the database, will it crash? return error message?)

$insertCodingProject = "INSERT INTO CodingProject1 VALUES(:languageUpdate,
                          :projectNameUpdate, :complexityUpdate, :projectDescriptionUpdate, :categoryUpdate)";
$insertHaveProject = "INSERT INTO HaveProject VALUES(:applicantEmailInsert, :projectNameUpdate, :languageUpdate)";

// $select= "SELECT hobbyName from Hobby where Hobby.hobbyName = 'booooo'"; //testing

$stidProject = oci_parse($conn, $insertCodingProject);
oci_bind_by_name($stidProject, ':languageUpdate', $languageUpdate);
oci_bind_by_name($stidProject, ':projectNameUpdate', $projectNameUpdate);
oci_bind_by_name($stidProject, ':projectDescriptionUpdate', $projectDescriptionUpdate);
oci_bind_by_name($stidProject, ':complexityUpdate', $complexityUpdate);
oci_bind_by_name($stidProject, ':categoryUpdate', $categoryUpdate);
oci_execute($stidProject);

$stidHaveProject = oci_parse($conn, $insertHaveProject);
oci_bind_by_name($stidHaveProject, ':projectNameUpdate', $projectNameUpdate);
oci_bind_by_name($stidHaveProject, ':applicantEmailInsert', $applicantEmailInsert);
oci_bind_by_name($stidHaveProject, ':languageUpdate', $languageUpdate);
oci_execute($stidHaveProject);

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
