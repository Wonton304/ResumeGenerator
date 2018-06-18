<?php

header("Access-Control-Request-Method: *");
header("Access-Control-Request-Headers: *");
header("Access-Control-Allow-Origin: *");

$json = $HTTP_RAW_POST_DATA;
echo $json;
$obj = json_decode($json);

// Create connection to Oracle
$conn = oci_connect("ora_f5x0b", "a40858169", "dbhost.ugrad.cs.ubc.ca:1522/ug");

$id = $obj->ID;
$technologyName = $obj->TECHNOLOGYNAME;
$technologyRole = $obj->TECHNOLOGYROLE;
$minimumProficiency = $obj->MINIMUMPROFICIENCY;
$technologyType = $obj->TECHNOLOGYTYPE;

// $id = '5cd07';
// $technologyName = 'yoyo';
// $technologyRole = 'web';
// $minimumProficiency = '4';
// $technologyType = 'framework';

// $id = 'hello';
// $technologyName = 'asdfasd';
// $technologyRole = 'asdfasdfas';
// $minimumProficiency = -10;
// $technologyType = 'asdfasdfsadfsad';


$insert1 = "INSERT INTO RequiredTechnology VALUES(:technologyName, :technologyRole, :minimumProficiency, :technologyType)";

$insert2 = "INSERT INTO Requires VALUES(:id, :technologyName)";

$stid1 = oci_parse($conn, $insert1);
oci_bind_by_name($stid1, ':technologyName', $technologyName);
oci_bind_by_name($stid1, ':technologyRole', $technologyRole);
oci_bind_by_name($stid1, ':minimumProficiency', $minimumProficiency);
oci_bind_by_name($stid1, ':technologyType', $technologyType);
$r1 = oci_execute($stid1);

if (!$r1) {
    echo "Error: please make sure job id is valid";
}


$stid2 = oci_parse($conn, $insert2);
oci_bind_by_name($stid2, ':id', $id);
oci_bind_by_name($stid2, ':technologyName', $technologyName);
$r2 = oci_execute($stid2);


OCICommit($conn);
oci_close($conn);

?>
