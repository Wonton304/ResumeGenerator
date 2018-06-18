<?php
header("Access-Control-Request-Method: *");
header("Access-Control-Request-Headers: *");
header("Access-Control-Allow-Origin: *");

$json = $HTTP_RAW_POST_DATA;

$obj = json_decode($json);
$json='';
echo $json;

// Create connection to Oracle
$conn = oci_connect("ora_f5x0b", "a40858169", "dbhost.ugrad.cs.ubc.ca:1522/ug");

$technologyName = $obj->TECHNOLOGYNAME;
$technologyRole = $obj->TECHNOLOGYROLE;
$minimumProficiency = $obj->MINIMUMPROFICIENCY;
$technologyType = $obj->TECHNOLOGYTYPE;

$update1 = "UPDATE RequiredTechnology
            SET technologyRole = :technologyRole, minimumProficiency = :minimumProficiency, technologyType = :technologyType
            WHERE technologyName = :technologyName";

$find = "SELECT *
         FROM RequiredTechnology
         WHERE technologyRole = :technologyRole and minimumProficiency = :minimumProficiency and technologyType = :technologyType
         and technologyName = :technologyName";

// the Requires table will not be updated because both the ID and technologyNames are primary keys (cannot be updated)

$stid1 = oci_parse($conn, $update1);
oci_bind_by_name($stid1, ':technologyName', $technologyName);
oci_bind_by_name($stid1, ':technologyRole', $technologyRole);
oci_bind_by_name($stid1, ':minimumProficiency', $minimumProficiency);
oci_bind_by_name($stid1, ':technologyType', $technologyType);
$result = oci_execute($stid1);

$stid2 = oci_parse($conn, $find);
oci_bind_by_name($stid1, ':technologyName', $technologyName);
oci_bind_by_name($stid1, ':technologyRole', $technologyRole);
oci_bind_by_name($stid1, ':minimumProficiency', $minimumProficiency);
oci_bind_by_name($stid1, ':technologyType', $technologyType);
oci_execute($stid2);
$result2 = oci_fetch_array($stid2);

if (!$result2) {
    echo "Error";
}



if (!$result) {
    echo "Error";
}


OCICommit($conn);
oci_close($conn);

?>
