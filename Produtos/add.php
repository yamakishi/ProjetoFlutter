<?php 

	include 'database.php';

	$descricao = $_POST['descricao'];
	$valor = $_POST['valor'];

	$link->query("INSERT INTO produtos(descricao,valor)VALUES('".$descricao."','".$valor."')");

?>





	// include 'database.php';

	// $fistname = $_POST['fistname'];
	// $lastname = $_POST['lastname'];
	// $phone = $_POST['phone'];
	// $address = $_POST['address'];

	// $link->query("INSERT INTO person(fistname,lastname,phone,address)VALUES('".$fistname."','".$lastname."','".$phone."','".$address."')");

