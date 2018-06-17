<?php


header("Access-Control-Request-Method: *");
header("Access-Control-Request-Headers: *");
header("Access-Control-Allow-Origin: *");

$json = $HTTP_RAW_POST_DATA;

$obj = json_decode($json);
$json='';
echo $json;
<<<<<<< HEAD
=======

>>>>>>> 99993cb0633d2598729a9cf8faca796877d61b16
$companyName = $obj->COMPANYNAME;
$companyDescription = $obj->COMPANYDESCRIPTION;
$companyDomain = $obj->COMPANYDOMAIN;
$address = $obj->ADDRESS;
$postalCode = $obj->POSTALCODE;
$province = $obj->PROVINCE;
$city = $obj->CITY;

// Create connection to Oracle
$conn = oci_connect("ora_s3z0b", "a16599169", "dbhost.ugrad.cs.ubc.ca:1522/ug");

$insert1 = "INSERT INTO Company VALUES(:companyName, :companyDescription, :companyDomain)";

$insert2 = "INSERT INTO Location2 VALUES(:address, :postalCode)";

$insert3 = "INSERT INTO Location1 VALUES(:city, :postalCode)";

$insert4 = "INSERT INTO Location3 VALUES(:postalCode, :province)";

$insert5 = "INSERT INTO SituatedIn VALUES(:postalCode, :address, :companyName)";

// $select = "SELECT * FROM Company WHERE Company.companyName = 'Google'";

$stid1 = oci_parse($conn, $insert1);
oci_bind_by_name($stid1, ':companyName', $companyName);
oci_bind_by_name($stid1, ':companyDescription', $companyDescription);
oci_bind_by_name($stid1, ':companyDomain', $companyDomain);
oci_execute($stid1);

$stid2 = oci_parse($conn, $insert2);
oci_bind_by_name($stid2, ':address', $address);
oci_bind_by_name($stid2, ':postalCode', $postalCode);
oci_execute($stid2);

$stid3 = oci_parse($conn, $insert3);
oci_bind_by_name($stid3, ':city', $city);
oci_bind_by_name($stid3, ':postalCode', $postalCode);
oci_execute($stid3);

$stid4 = oci_parse($conn, $insert4);
oci_bind_by_name($stid4, ':postalCode', $postalCode);
oci_bind_by_name($stid4, ':province', $province);
oci_execute($stid4);

$stid5 = oci_parse($conn, $insert5);
oci_bind_by_name($stid5, ':postalCode', $postalCode);
oci_bind_by_name($stid5, ':address', $address);
oci_bind_by_name($stid5, ':companyName', $companyName);
oci_execute($stid5);


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
