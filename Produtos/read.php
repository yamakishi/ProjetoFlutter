<?php 

// Cabeçalho para receber API
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header("Access-Control-Allow-Methods: PUT, POST, GET, DELETE, OPTIONS");
header("Content-Type: application/json");
header("Acess-Control-Allow-Headers: Acess-Control-Allow-Headers,Content-Type, Acess-Control-Allow-Methods, Authorization");

// Recebendo os valores via API
//$data = json_decode(file_get_contents("php://input"), true);

	
include 'database.php';

	$query = $link->query("SELECT * FROM produtos");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);



// include 'database.php';

// 	$query = $link->query('SELECT * FROM person');
// 	$result = array();

// 	while ($rowdata = $query->fetch_assoc()) {
// 		$result[] = $rowdata;
// 	}
// 	echo json_encode($result);