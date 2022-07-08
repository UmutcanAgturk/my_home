<?php
require("connection.php");

$userName = $_POST["UserName"];
$Pass = $_POST["Pass"];
$Phone = $_POST["Phone"];
$eMail = $_POST["eMail"];

$userName = "Umutcan Ağtürk2";
$Pass = "123456";
$Phone="05494406653";
$eMail="umutcan.atrk2@gmail.com";

$querySt = "UPDATE User SET UserName = '".$userName."',eMail = '".$eMail."',Phone = '".$Phone."',Pass = '".$Pass."' WHERE UserName ='Umutcan Ağtürk'" ;
$statement = $db->prepare($querySt);
$statement->execute();

echo json_encode("Güncellendi");

?>