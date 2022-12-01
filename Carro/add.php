<?php 
// Cabeçalho para receber API
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header("Access-Control-Allow-Methods: PUT, POST, GET, DELETE, OPTIONS");
header("Content-Type: application/json");
header("Acess-Control-Allow-Headers: Acess-Control-Allow-Headers,Content-Type, Acess-Control-Allow-Methods, Authorization");


	include 'database.php';

	
	$nomeCarro = $_POST['nomeCarro'];
	$kmPorLitroAlcool = $_POST['kmPorLitroAlcool'];
	$kmPorLitroGasolina = $_POST['kmPorLitroGasolina'];


	$link->query("INSERT INTO carro(nomeCarro,kmPorLitroAlcool,kmPorLitroGasolina)VALUES('".$nomeCarro."','".$kmPorLitroAlcool."','".$kmPorLitroGasolina."')");

?>

