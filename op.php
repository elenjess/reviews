<?php
$url = "https://api.content.market.yandex.ru/v2.1/shops/5018/opinions.json?sort=date&how=desc&count=3";

$headers = array(
	"Host: api.content.market.yandex.ru",
	"Accept: */*",
	"Authorization: 06fc63f7-4062-484e-86c4-e52c85edfd87"
);

$ch = curl_init();

curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
$data = json_decode(curl_exec($ch), TRUE);


	foreach ($data['message'] as $opinions => $shopopinion) {
		echo "<li>" . $opinions . "</li>";

		};
		
		var_dump($data); 
