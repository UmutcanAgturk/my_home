<?php
require('connection.php');

$userName = $_POST["kulad"];
$Pass = $_POST["email"];
$Phone = $_POST["telefon"];
$eMail = $_POST["sifre"];


$query = $db->prepare("INSERT INTO users SET kulad=?, email=?, telefon=?, sifre=?");
$insert = $query->execute(array($UserName,$eMail,$Phone,$Pass));

if ( $insert ){
    $sonid = $db->lastInsertId();
    //echo $sonid." id li kayıt eklendi";
}
else{
    echo "Kayıt eklenemedi";
}
?>