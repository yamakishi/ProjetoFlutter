<?php 
// Cabeçalho para receber API
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header("Access-Control-Allow-Methods: PUT, POST, GET, DELETE, OPTIONS");
header("Content-Type: application/json");
header("Acess-Control-Allow-Headers: Acess-Control-Allow-Headers,Content-Type, Acess-Control-Allow-Methods, Authorization");

	include 'database.php';

	$nome = $_POST['nome'];
	$data_nascimento = $_POST['data_nascimento'];
	$data_compra = $_POST['data_compra'];
	

	$link->query("INSERT INTO clientes(nome,data_nascimento,data_compra)VALUES('".$nome."','".$data_nascimento."', '".$data_compra."')");

?>





	// include 'database.php';

	// $fistname = $_POST['fistname'];
	// $lastname = $_POST['lastname'];
	// $phone = $_POST['phone'];
	// $address = $_POST['address'];

	// $link->query("INSERT INTO person(fistname,lastname,phone,address)VALUES('".$fistname."','".$lastname."','".$phone."','".$address."')");

