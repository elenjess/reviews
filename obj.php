<?php

$url = "https://api.content.market.yandex.ru/v2/shops/5018/opinions/chronological";
$headers = array(
	"Host: api.content.market.yandex.ru",
	"Accept: */*",
	"Authorization: 704a3832-f097-4ea2-844d-0be294f2dfbd"
);
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            $data = curl_exec($ch);
            curl_close($ch);

            print_r($data);