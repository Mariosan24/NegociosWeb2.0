<?php
$server = "127.0.0.1";
$user = "farmaUser";
$pswd = "farmacia";
$database = "pharmacare";
$port = "3306";

$emailHost = 'smtp.gmail.com';
$smtpUser = '';
$smtpSecret = '';
$smtpPort = "587";

$host_server = 'http://localhost/mvc/';
if (isset($_SERVER["SERVER_MVC"])) {
    $host_server = $_SERVER["SERVER_MVC"];
}

?>
    