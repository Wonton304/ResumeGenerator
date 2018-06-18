<?php
header("Access-Control-Request-Method: *");
header("Access-Control-Request-Headers: *");
header("Access-Control-Allow-Origin: *");

$json = $HTTP_RAW_POST_DATA;

$obj = json_decode($json);
$json='';
echo $json;


$field = $obj->FIELD;
$positionTitle = $obj->POSITIONTITLE;
$id = $obj->ID;
$description = $obj->DESCRIPTION;
$companyName = $obj->COMPANYNAME;


// Create connection to Oracle
$conn = oci_connect("ora_f5x0b", "a40858169", "dbhost.ugrad.cs.ubc.ca:1522/ug");

$update1 = "UPDATE JobPostingPosts
            SET field = :field, positionTitle = :positionTitle, description = :description
            WHERE id = :id and companyName = :companyName";


$stid1 = oci_parse($conn, $update1);
oci_bind_by_name($stid1, ':field', $field);
oci_bind_by_name($stid1, ':positionTitle', $positionTitle);
oci_bind_by_name($stid1, ':description', $description);
oci_bind_by_name($stid1, ':id', $id);
oci_bind_by_name($stid1, ':companyName', $companyName);
$result = oci_execute($stid1);

if (!$result) {
    $error = oci_error($stid1);
}

echo $error;



// //to remember the entire json string
// $jsonresp = array();

// // Fetch each row in an associative array
// //print '<table border="1">'

// while ($row = oci_fetch_array($stid2, OCI_RETURN_NULLS+OCI_ASSOC)) {

//      //to concatenate a ',' after every json object. used to split before parsing.
// 	    $jsonresp [] = $row ;

// }

// $response = (json_encode($jsonresp));


// echo $response;

OCICommit($conn);
oci_close($conn);

?>
