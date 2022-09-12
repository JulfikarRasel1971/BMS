<html>
<h2>Bus Management System Store Procedure</h2>
<form action="fetch2.php" method="post" enctype="multipart/form-data" class="signup-form">
<input type="submit" value="show" class="btn solid" id="submit" name="show">
</form>
<?php

include("connect.php");

if(isset($_POST['show']))

{

$sql="select * from signup";

$r=mysqli_query($con,$sql);

echo "<table id='Users')";
echo"<tr>
<table>
<head>
<style>
table, th, td {
  border: 1px solid black;
}
</style>
</head>
<body>
<thead>
<tr>
<th>FirstName</th>
<th>LastName</th>

<th>Phone_No</th>

<th>dateofbirth</th>

<th>email</th>


</tr>";

  while($row=mysqli_fetch_array($r))

  {



                  $FirstName=$row['FirstName'];

                  $LastName=$row['LastName'];

                  $Phone_No=$row['Phone_No'];

                  $dateofbirth=$row['dateofbirth'];

                  $email=$row['email'];

                 

   echo "<tr>

   <td>$FirstName</td><td>$LastName</td><td>$Phone_No</td><td>$dateofbirth</td><td>$email</td>

   </tr>";

  }

  echo "</table>","</thead>";

}

?>