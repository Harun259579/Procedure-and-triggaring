<?php
$db = new mysqli('localhost', 'root', '', 'evidence');

$result = $db->query("SELECT id,product_name,mfg_name FROM v_product_list");

echo "<table border='1' style='border-collapse: collapse;'>";
echo "<tr>
<th>ID</th>
<th>Product Name</th>
<th>Menufecture Name</th>
</tr>";

while (list($id,$product_name, $mfg_name) = $result->fetch_row()) {
    echo "<tr>";
    echo "<td>$id</td>";
    echo "<td>$product_name</td>";
    echo "<td>$mfg_name</td>";

    echo "</tr>";
}

echo "</table>";

?>