<?php
$address = $_POST['recherche'];

recherche($address);

//La fonction qui verifie si l'adresse est dans la base ou non.
function recherche($address) {

  try
		{
			$pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
			$bdd = new PDO('mysql:host=;dbname=kofaviv', 'root', 'fleurderose', $pdo_options);
							
			$req = $bdd->query("SELECT longitude, latitude FROM commune where name like '%$address%'");
			$json = array();
						
			//Si l'adresse se trouve dans la base, nous recuperons les coordonnees (Latitude, longitude)...
			if($donnees = $req->fetch())
				{
					$json[]=$donnees;
					$array['lat'] = $json[0][0];
					$array['lon'] = $json[0][1];
					echo json_encode($array);
					
				}
	
			$req->closeCursor();	
							
		}
	catch(Exception $e)
		{
			die('Erreur : '.$e->getMessage());
		}
}
?>