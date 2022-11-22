<?php 
// Cabeçalho para receber API
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header("Access-Control-Allow-Methods: PUT, POST, GET, DELETE, OPTIONS");
header("Content-Type: application/json");
header("Acess-Control-Allow-Headers: Acess-Control-Allow-Headers,Content-Type, Acess-Control-Allow-Methods, Authorization");

	include 'database.php';

	$id = $_POST['id'];
	$nome = $_POST['nome'];
	$data_nascimento = $_POST['data_nascimento'];
	$data_compra = $_POST['data_compra'];


	$link->query("UPDATE clientes SET nome = '".$nome."', data_nascimento = '".$data_nascimento."', data_compra = '".$data_compra."' WHERE id = '".$id."'");


?>