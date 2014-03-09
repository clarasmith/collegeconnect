<html>
<head>
<title>WMDBCollegeConnect</title>
<link rel="stylesheet" type="text/css" <!-- href="wmdb-style.css"--> >
</head>

<body>
<h1>CollegeConnect</h1>

<h2>Search the WMDB</h2>
<form method=GET action="wmdb-search.php">
   <select name="tables">
   <option>Both
   <option>Titles
   <option>Names
   </select>
   </br>
   <input type="text" name="input"> <br>
   <input type="submit" value="SEARCH!">
</form>

<!-- Did not need the above -->





<?php
   
require_once("MDB2.php");
require_once("/students/vbrown/public_html/cs304/MDB2-functions.php");

require_once("fscott-dsn.inc");

$dbh = db_connect($fscott-dsn);
$data = $_GET['uid'];
$name = "SELECT username,email  from user where uid = ?;";
$resultsetN = prepared_query($dbh,$name,array($data));

echo"<p>We are looking for entries in user  matching $data:\n";

$credit = "SELECT name,date,time,address from  study where eid in (select eid from connection where uid= ?) order by tme;";
$resultsetC = prepared_query($dbh,$credit,array($data));
$searchTitleURL = "<a href=\"findevents.php?eid=";

while($row = $resultsetN->fetchRow(MDB2_FETCHMODE_ASSOC)){
  $name = $row['name'];
  $email = $row['email'];
  echo "<li>$name
        <li>$email";
}
echo"<h3> Study</h3>";

while($row = $resultsetC->fetchRow(MDB2_FETCHMODE_ASSOC)){
  $tme = $row['tme'];
  $department = $row['department'];
  $course = $row['course'];
  
}
?>
</body>
</html>
