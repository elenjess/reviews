<?php 

$API = "06fc63f7-4062-484e-86c4-e52c85edfd87"; //ваш ключ
$shopid = "5018"; //нам нужен id страницы с отзывов о магазине, например https://market.yandex.ru/shop/18433/reviews тут будет ID 18433
$url = "https://api.content.market.yandex.ru/v2/shops/".$shopid."/opinions.json?sort=date&how=desc&count=5"; //я выбрал получить последние по дате 10 отзывов, как редактировать ссылку смотрите тут https://tech.yandex.ru/market/content-data/doc/dg/reference/shop-id-opinion-docpage/
 $headers = array(
 "Host: api.content.market.yandex.ru",
 "Accept: */*",
 "Authorization: {$API}"
 );

 $ch = curl_init();
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
 curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
 curl_setopt($ch, CURLOPT_URL, $url);
 curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
 $string = curl_exec($ch);
 curl_close($ch);
            
$data = json_decode($string);
 
echo $data->shopOpinions->total;
?>
<meta charset="UTF-8">
<div class="customer-reviews">Отзывы о магазине Фотоcклад.ру </>
 <div class="list-reviews">
<?php
 
    if( $val->visibility == 'ANONYMOUS' ) $author = 'Анонимный комментарий'; //проверяем анонимный ли пользователь или нет
    else $author = $val->author;
 
    if( $val->pro ) $pro = "<b>Достоинства:</b><br />".$val->pro."<br /><br />";
    else $pro = "";
    if( $val->contra ) $contra = "<b>Недостатки:</b><br />".$val->contra."<br /><br />";
    else $contra = "";
    if( $val->text ) $text = "<b>Комментарий:</b><br />".$val->text;
    else $text = "";
 
 
 echo $author;
 echo $date;
 echo $pro.$contra.$text;

var_dump($data);
?>    