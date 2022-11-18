<?php 

	include 'database.php';

	$nome = $_POST['nome'];
	$data_nascimento = $_POST['data_nascimento'];
	$data_compra = $_POST['data_compra'];


	$link->query("UPDATE clientes SET nome = '".$nome."', data_nascimento = '".$data_nascimento."', data_compra = '".$data_compra."' WHERE id = '".$id."'");


?>