<?php
require('connection.php');

$eMail = $_POST["eMail"]

$query ="SELECT * FROM User WHERE eMail = $eMail";
$stm = $db->prepare($query);
$stm->execute();
$row=$stm->fetch(PDO::FETCH_ASSOC);
    echo json_encode($row);

?>