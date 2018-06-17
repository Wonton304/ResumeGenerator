<?php

header("Access-Control-Request-Method: *");
header("Access-Control-Request-Headers: *");
header("Access-Control-Allow-Origin: *");

$json = $HTTP_RAW_POST_DATA;
echo $json;
$obj = json_decode($json);

// Create connection to Oracle
$conn = oci_connect("ora_e0w0b", "a22288161", "dbhost.ugrad.cs.ubc.ca:1522/ug");

$technologyName = $obj->TECHNOLOGYNAME;
$technologyRole = $obj->TECHNOLOGYROLE;
$minimumProficieny = $obj->MINIMUMPROFICIENCY;
$technologyType = $obj->TECHNOLOGYTYPE;

$update1 = "UPDATE RequiredTechnology
            SET technologyRole = :technologyRole, minimumProficiency = :minimumProficiency, technologyType = :technologyType
            WHERE technologyName = :technologyName";

// the Requires table will not be updated because both the ID and technologyNames are primary keys (cannot be updated)

$stid1 = oci_parse($conn, $update1);
oci_bind_by_name($stid1, ':technologyName', $technologyName);
oci_bind_by_name($stid1, ':technologyRole', $technologyRole);
oci_bind_by_name($stid1, ':minimumProficiency', $minimumProficieny);
oci_bind_by_name($stid1, ':technologyType', $technologyType);
oci_execute($stid1);

OCICommit($conn);
oci_close($conn);

?>