<?php 

	include 'database.php';

	$id = $_POST['id'];
	$descricao = $_POST['descricao'];
	$valor = $_POST['valor'];


	$link->query("UPDATE produto SET descricao = '".$descricao."', valor = '".$valor."' WHERE id = '".$id."'");


?>