<?php
$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, "https://api.content.market.yandex.ru/{version}/shops/{id}/opinions/chronological");

if(!$headers) {
       curl_setopt($curl, CURLOPT_HTTPHEADER, array(
          'APIKEY: 06fc63f7-4062-484e-86c4-e52c85edfd87',
       ));
   }
curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
$opinions = json_decode(curl_exec($curl), TRUE);
	
	echo json_encode($opinions);


