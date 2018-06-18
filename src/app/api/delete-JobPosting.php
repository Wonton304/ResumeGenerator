<?php
header("Access-Control-Request-Method: *");
header("Access-Control-Request-Headers: *");
header("Access-Control-Allow-Origin: *");

$json = $HTTP_RAW_POST_DATA;

$obj = json_decode($json);
$json='';
echo $json;

  $id = $obj->ID;

  // $hobbyNameUpdate ='booooo'; //testing
  // Create connection to Oracle
  $conn = oci_connect("ora_f5x0b", "a40858169", "dbhost.ugrad.cs.ubc.ca:1522/ug");

  $delete = "DELETE FROM JobPostingPosts
             WHERE id = :id";

  $stid = oci_parse($conn, $delete);
  oci_bind_by_name($stid, ':id', $id);
  oci_execute($stid);


OCICommit($conn);
oci_close($conn);
?>
