<?php

header("Access-Control-Request-Method: *");
header("Access-Control-Request-Headers: *");
header("Access-Control-Allow-Origin: *");

$json = $HTTP_RAW_POST_DATA;
echo $json;
$obj = json_decode($json);

// Create connection to Oracle
$conn = oci_connect("ora_e0w0b", "a22288161", "dbhost.ugrad.cs.ubc.ca:1522/ug");

$id = $obj->ID;
$technologyName = $obj->TECHNOLOGYNAME;
$technologyRole = $obj->TECHNOLOGYROLE;
$minimumProficieny = $obj->MINIMUMPROFICIENCY;
$technologyType = $obj->TECHNOLOGYTYPE;

$insert1 = "INSERT INTO RequiredTechnology VALUES(:technologyName, :technologyRole, :minimumProficiency, :technologyType)";

$insert2 = "INSERT INTO Requires VALUES(:id, :technologyName)";

$stid1 = oci_parse($conn, $insert1);
oci_bind_by_name($stid1, ':technologyName', $technologyName);
oci_bind_by_name($stid1, ':technologyRole', $technologyRole);
oci_bind_by_name($stid1, ':minimumProficiency', $minimumProficieny);
oci_bind_by_name($stid1, ':technologyType', $technologyType);
oci_execute($stid1);

$stid2 = oci_parse($conn, $insert2);
oci_bind_by_name($stid2, ':id', $id);
oci_bind_by_name($stid2, ':technologyName', $technologyName);
oci_execute($stid2);

OCICommit($conn);
oci_close($conn);

?>