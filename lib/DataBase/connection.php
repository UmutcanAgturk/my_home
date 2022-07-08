<?php
$dns = 'mysql:host=localhost;dbname=id19023517_mysmarthome';
$user = 'id19023517_mysmarthome2';
$pass='KbltD@dW[I-+0V7I';

try {
    $db = new PDO ($dns,$user,$pass);

} catch (PDOEXCEPTION $exc) {
    echo $exc -> getMessage();
    die("Bağlanmadı");
}
?>

