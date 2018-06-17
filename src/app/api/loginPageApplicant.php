<?php


header("Access-Control-Request-Method: *");
header("Access-Control-Request-Headers: *");
header("Access-Control-Allow-Origin: *");

$json = $HTTP_RAW_POST_DATA;
echo $json;
$obj = json_decode($json);
$applicantName = $obj->APPLICANTCNAME;
$applicantEmail = $obj->APPLICANTCEMAIL;
$applicantAddress = $obj->APPLICANTCADDRESS;
$applicantCity = $obj->APPLICANTCITY;
$applicantProvince = $obj->APPLICANTPROVINCE;
$githubAccount = $obj->GITHUBACCOUNT;
$personalDescription = $obj->PERSONDESCRIPTION;
$phoneNumber = $obj->APPLICANTPHONENUMBER;

// Create connection to Oracle
$conn = oci_connect("ora_e0w0b", "a22288161", "dbhost.ugrad.cs.ubc.ca:1522/ug");

$insert1 = "INSERT INTO Applicant1 VALUES(:phoneNumber:, :applicantCity)";

$insert6 = "INSERT INTO Applicant2 VALUES(applicantName, :applicantEmail, :applicantAddress,
:githubAccount, :personalDescription, :phoneNumber)";

$insert7 = "INSERT INTO Applicant3 VALUES(:phoneNumber, :applicantProvince)";

$insert2 = "INSERT INTO HaveHobby VALUES(:applicantEmail)";

$insert3 = "INSERT INTO HaveAward VALUES(:applicantEmail)";

$insert4 = "INSERT INTO HaveExperience VALUES(:applicantEmail)";

$insert5 = "INSERT INTO HaveProject VALUES(:applicantEmail)";

// $select = "SELECT * FROM Company WHERE Company.companyName = 'Google'";

$stid1 = oci_parse($conn, $insert1);
oci_bind_by_name($stid1, ':phoneNumber', $phoneNumber);
oci_bind_by_name($stid1, ':applicantCity', $applicantCity);
oci_execute($stid1);

$stid6 = oci_parse($conn, $insert6);
oci_bind_by_name($stid1, ':applicantName', $applicantName);
oci_bind_by_name($stid1, ':applicantEmail', $applicantEmail);
oci_bind_by_name($stid1, ':applicantAddress', $applicantAddress);
oci_bind_by_name($stid1, ':githubAccount', $githubAccount);
oci_bind_by_name($stid1, ':personalDescription', $personalDescription);
oci_bind_by_name($stid1, ':phoneNumber', $phoneNumber);

$stid7 = oci_parse($conn, $insert7);
oci_bind_by_name($stid1, ':phoneNumber', $phoneNumber);
oci_bind_by_name($stid1, ':applicantProvince', $applicantProvince);

$stid2 = oci_parse($conn, $insert2);
oci_bind_by_name($stid2, ':applicantEmail', $applicantEmail);
oci_execute($stid2);

$stid3 = oci_parse($conn, $insert3);
oci_bind_by_name($stid3, ':applicantEmail', $applicantEmail);
oci_execute($stid3);

$stid4 = oci_parse($conn, $insert4);
oci_bind_by_name($stid4, ':applicantEmail', $applicantEmail);
oci_execute($stid4);

$stid5 = oci_parse($conn, $insert5);
oci_bind_by_name($stid5, ':applicantEmail', $applicantEmail);
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
