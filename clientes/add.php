<?php 

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

