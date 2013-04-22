<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<style type="text/css">
			html { height: 100% }
			body { height: 100%; margin: 0px; padding: 0px }
			#map_canvas { height: 90%; auto }
		</style>
		<link rel="stylesheet" media="screen" type="text/css" title="Design" href="design.css" />
		
		<script src="jquery.js"></script>
		<script type="text/javascript">
			var lat = 0;
			var lon = 0; 
			$(document).ready(function() {
				$('#recherche').on('submit', function() {
					var rech = $('#inRecherche').val();
					if(rech == '') {
						alert('Tu n\'as rien mis dans le champ');
					} else {
						$.ajax({
						url: $(this).attr('action'),
						type: $(this).attr('method'),
						data: $(this).serialize(),
						dataType: 'json',
						success: function(json) {
							var lat = json.lat;
							var lon = json.lon;
							alert(json.lat+" "+json.lon);
							
						}
						});        
					}        
				return false;
				});
			});   
			
		</script>
	</head>

	<body>
	
		<!--==================================================================================================-->
		<!-- Forme pour recherche-->
		<form method="post" id="recherche" action="geocode_fini.php" >
			<table>
				<tr>
					<td><h3>Addresse:</h3></td>
					<td><input type="text" class="in" id="inRecherche" name="recherche" size="60" placeholder=" Addresse"/></td><td><input type="submit" class="bt" value="Rechercher"/></td> 
				</tr>
			</table>
		</form>
		<!--==================================================================================================-->
		
		
		<?php
		
			//==================================================================================================
			// Choix de l'addresse a recherchee
			if(isset($_GET['autre']) and !isset($_POST['recherche']))
				$address = $_GET['autre'];
			else if(isset($_POST['recherche']))
				$address =$_POST['recherche'];
			else
				$address = "50,impasse percier,nazon,Port-au-Prince, Haiti";
		?>
		
		<div id="map_canvas" style="width:100%; height:100%">

		</div>
</body>
</html>