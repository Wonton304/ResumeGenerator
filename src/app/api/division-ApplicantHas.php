<?php
$descriptionUpdate = "hi";
$idNum='6xn53';
// Create connection to Oracle
$conn = oci_connect("ora_s3z0b", "a16599169", "dbhost.ugrad.cs.ubc.ca:1522/ug");



$division= "SELECT R.technologyName
from Requires R
where R.id = '9ri86'
intersect
select distinct H.language
from HaveProject H
where H.applicantEmail = 'Charlotte_8850@alumni.ubc.ca'";
$stid = oci_parse($conn, $division);
oci_bind_by_name($stid, ':idNum', $idNum);
$result = oci_execute($stid);
if (!$result) {
  echo 'no';
}else{
	echo ' yes';
}


OCICommit($conn);

oci_close($conn);

function printResult($result) { //prints results from a select statement
	echo "<br>Got data from table tab1:<br>";
	echo "<table>";
	echo "<tr><th>ID</th><th>Name</th></tr>";

	while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
		echo "<tr><td>" . $row["postalCode"] . "</td></tr>"; //or just use "echo $row[0]"
	}
	echo "</table>";

}

printResult($result);
// Fetch each row in an associative array

//0cy27
?>
