<?php
$url = "https://api.content.market.yandex.ru/v2/shops/153746/opinions.xml";

$headers = array(
	"Host: api.content.market.yandex.ru",
	"Accept: */*",
	"Authorization: 06fc63f7-4062-484e-86c4-e52c85edfd87"
);

$ch = curl_init();

curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
$data = curl_exec($ch);

		
		
		var_dump($data); 
