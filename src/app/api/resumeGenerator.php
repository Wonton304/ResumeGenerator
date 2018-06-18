<?php
  header("Access-Control-Request-Method: *");
  header("Access-Control-Request-Headers: *");
  header("Access-Control-Allow-Origin: *");

  $json = $HTTP_RAW_POST_DATA;
  $obj = json_decode($json);
  $json='';
  echo $json;

  $applicantEmailDiv = $obj->APPLICANTEMAIL;
  $jobidDiv = $obj->ID;

// Create connection to Oracle

$conn = oci_connect("ora_f5x0b", "a40858169", "dbhost.ugrad.cs.ubc.ca:1522/ug");


$division1 = "SELECT R.technologyName
from Requires R
where R.id = :jobidDiv
intersect
select distinct H.language
from HaveProject H
where H.applicantEmail = :applicantEmailDiv";

$division2 = "SELECT distinct R.technologyName
from Requires R
where R.id = :jobidDiv
minus
select distinct H.language
from HaveProject H
where H.applicantEmail = :applicantEmailDiv";

$stid1 = oci_parse($conn, $division1);
oci_bind_by_name($stid1, ':jobidDiv', $jobidDiv);
oci_bind_by_name($stid1, ':applicantEmailDiv', $applicantEmailDiv);
oci_execute($stid1);

$stid2 = oci_parse($conn, $division2);
oci_bind_by_name($stid2, ':jobidDiv', $jobidDiv);
oci_bind_by_name($stid2, ':applicantEmailDiv', $applicantEmailDiv);
oci_execute($stid2);


//to remember the entire json string
$json1 = array();

// Fetch each row in an associative array
//print '<table border="1">'

while ($row = oci_fetch_array($stid1, OCI_RETURN_NULLS+OCI_ASSOC)) {

     //to concatenate a ',' after every json object. used to split before parsing.
	    $json1 [] = $row ;

}

$response1 = (json_encode($json1));

//to remember the entire json string
$json2 = array();

// Fetch each row in an associative array
//print '<table border="1">'

while ($row = oci_fetch_array($stid2, OCI_RETURN_NULLS+OCI_ASSOC)) {

     //to concatenate a ',' after every json object. used to split before parsing.
	    $json2 [] = $row ;

}

$response2 = (json_encode($json2));


echo $response1;
echo $response2;

OCICommit($conn);
oci_close($conn);

?>
