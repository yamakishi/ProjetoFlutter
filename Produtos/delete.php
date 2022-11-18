<?php 

	include 'database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM produtos WHERE id = '".$id."'");

	?>