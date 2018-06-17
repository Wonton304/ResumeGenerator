<?php
  header("Access-Control-Request-Method: *");
  header("Access-Control-Request-Headers: *");
  header("Access-Control-Allow-Origin: *");
  $json = $HTTP_RAW_POST_DATA;

  $obj = json_decode($json);
  $json='';
  echo $json;
$jobid = $obj->JOBID;

// Create connection to Oracle
$conn = oci_connect("ora_s3z0b", "a16599169", "dbhost.ugrad.cs.ubc.ca:1522/ug");

$join = "SELECT DISTINCT Applicant2.applicantName, HaveProject.language
from Applicant2 inner join HaveProject on Applicant2.applicantEmail = HaveProject.applicantEmail
where Applicant2.applicantEmail in (select AP.applicantEmail
                                    from AppliesTo AP
                                    where AP.id = :jobid)
     and HaveProject.language in (select R.technologyName
                                  from Requires R
                                  where R.id = :jobid)";

$stid = oci_parse($conn, $join);
oci_bind_by_name($stid, ':jobid', $jobid);
$result = oci_execute($stid);
//to remember the entire json string
$json = array();

// Fetch each row in an associative array
//print '<table border="1">'

while ($row = oci_fetch_array($stid, OCI_RETURN_NULLS+OCI_ASSOC)) {

     //to concatenate a ',' after every json object. used to split before parsing.
	    $json [] = $row ;

}

$response = (json_encode($json));


echo $response;

?>
