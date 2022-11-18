<?php 
// Cabeçalho para receber API
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header("Access-Control-Allow-Methods: PUT, POST, GET, DELETE, OPTIONS");
header("Content-Type: application/json");
header("Acess-Control-Allow-Headers: Acess-Control-Allow-Headers,Content-Type, Acess-Control-Allow-Methods, Authorization");

	include 'database.php';

	$id = $_POST['id'];
	$id_produto = $_POST['id_produto'];
	$id_cliente = $_POST['id_cliente'];
	$id_cupom = $_POST['id_cupom'];
	$qtd = $_POST['qtd'];
	$data_venda = $_POST['data_venda'];



	$link->query("UPDATE vendas SET id_produto = '".$id_produto."', id_cliente = '".$id_cliente."', id_cupom = '".$id_cupom."', qtd = '".$qtd."', data_venda = '".$data_venda."' WHERE id = '".$id."'");


?>