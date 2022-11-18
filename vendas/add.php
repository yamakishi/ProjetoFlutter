<?php 
// Cabeçalho para receber API
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header("Access-Control-Allow-Methods: PUT, POST, GET, DELETE, OPTIONS");
header("Content-Type: application/json");
header("Acess-Control-Allow-Headers: Acess-Control-Allow-Headers,Content-Type, Acess-Control-Allow-Methods, Authorization");


	include 'database.php';

	$id_produto = $_POST['id_produto'];
	$id_cliente = $_POST['id_cliente'];
	$id_cupom = $_POST['id_cupom'];
	$qtd = $_POST['qtd'];
	$data_venda = $_POST['data_venda'];

	$link->query("INSERT INTO vendas(id_produto,id_cliente,id_cupom,qtd,data_venda)VALUES('".$id_produto."','".$id_cliente."','".$id_cupom."','".$qtd."','".$data_venda."')");

?>





	// include 'database.php';

	// $fistname = $_POST['fistname'];
	// $lastname = $_POST['lastname'];
	// $phone = $_POST['phone'];
	// $address = $_POST['address'];

	// $link->query("INSERT INTO person(fistname,lastname,phone,address)VALUES('".$fistname."','".$lastname."','".$phone."','".$address."')");

