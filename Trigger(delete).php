<?php
 $db = new mysqli('localhost', 'root', '', 'evidence');
if(isset($_POST['btnmfg']))
{
    $mn = $_POST['mfg'];
    if (!empty($mn) )
     {
        $db->query("delete from manufecture where id='$mn'");
        echo "Delete Successfully!";
    } 
    else
     {
        echo "Please fill in both fields.";
    }
}




?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>
		Trigger after Delete
	</title>
</head>
<body>
	<form action="#" method="POST">
		<div>
			Id<br>
			<input type="number" name="mfg">
			
		</div>
	
		<br>
	
			<button type="submit" name="btnmfg" value="Insert">Insert</button>
			
	
	</form>
	<br>
<?php

$db = new mysqli('localhost', 'root', '', 'evidence');

$result = $db->query("SELECT name, price FROM products");

echo "<table border='1' style='border-collapse: collapse;'>";
echo 
"<tr>
<th>Product Name</th>
<th>Price</th>
</tr>";

while (list($name, $price) = $result->fetch_row()) {
    echo "<tr>";
    echo "<td>$name</td>";
    echo "<td>$price</td>";
    echo "</tr>";
}

echo "</table>";
?>



</body>
</html>