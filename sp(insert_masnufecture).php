<?php
if(isset($_POST['btnmfg']))
{
    $db = new mysqli('localhost', 'root', '', 'evidence');

    $mn = $_POST['mfg'];
    $mnc = $_POST['contact'];

   

  
    if (!empty($mn) && !empty($mnc))
     {
        $db->query("call add_manufecture('$mn','$mnc')");
        echo "Insert Successfully!";
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
		SP Insert Procedure
	</title>
</head>
<body>
	<form action="#" method="POST">
		<div>
			Manufecture<br>
			<input type="text" name="mfg">
			
		</div>
		<div>
			contact<br>
			<input type="text" name="contact">
		</div>
		<br>
	
			<button type="submit" name="btnmfg" value="Insert">Insert</button>
			
		
		
		
	</form>

</body>
</html>