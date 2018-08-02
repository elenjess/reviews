<?php 

function callAPI($method, $url, $data){
   $curl = curl_init();
   switch ($method){
      case "POST":
         curl_setopt($curl, CURLOPT_POST, TRUE);
         if ($data)
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
         break;
   }
   // OPTIONS:
   curl_setopt($curl, CURLOPT_URL, "https://api.content.market.yandex.ru/v2.1.2/shops/opinions/");
   curl_setopt($curl, CURLOPT_HTTPHEADER, array(
      'APIKEY: 06fc63f7-4062-484e-86c4-e52c85edfd87',
   ));
   curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
   curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);

   $result = curl_exec($curl);
   if(!$result){die("Connection Failure");}
   curl_close($curl);
   return $result;
}