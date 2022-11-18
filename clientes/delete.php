<?php 

	include 'database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM clientes WHERE id = '".$id."'");

	?>