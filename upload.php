<?php
/* Для отладки 
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
/**/


include "config.php";

$pid  = $_COOKIE['pid'];
$pwd  = $_COOKIE['pwd'];



$Player = GetPlayer(" AND pid=".$pid." AND ppassw='".$pwd."'");

$size = $_FILES['audio_data']['size']; //the size in bytes
$input = $_FILES['audio_data']['tmp_name']; //temporary name that PHP gave to the uploaded file
$output = $_FILES['audio_data']['name'].".wav"; //letting the client control the filename is a rather bad idea

$t = intval($_POST['t']);
$event = $_POST['event'];

/**
 * Скрипт обрабатывающий POST запрос на добавление голосового коментария
 * Принимает форму содержащую BLOB объект записи голоса пользователя
 * Возвращает JSON бъект в зависимоти от результата обработки
 */
$uploadDir = '';

$uploadFile = $uploadDir . "inputRR.wav";

if (move_uploaded_file($input, $uploadFile)) {

    //Ниже преобразование к нужно битрейту и формату, в будущем предусмотреть тонкую настроку путей в конфигах
    $sox = "sox /web/belonogov.com/www/inputRR.wav -b 16 /web/belonogov.com/www/outputRR.wav gain -1 rate 8000 dither -s";


    exec($sox); // Тонкое место, обеспечить защиту от загрузки эксплоитов и т.п.



	/*	Распозновалка прямо тут
	use WebSocket\Client;

	$client = new Client("ws://localhost:2700/", array('timeout' => 2000));
	$myfile = fopen("/web/belonogov.com/www/outputRR.wav", "r");
	while(!feof($myfile)) {
	   $data = fread($myfile, 8000);
	   $client->send($data, 'binary');
	   echo $client->receive() . "\n";
	}
	$client->send("{\"eof\" : 1}");
	$response =  $client->receive() . "\n";
	fclose($myfile);
	/**/

    /* Редиректим на распозновалку и ждем ответа */
    //$Player['pid'] = 1;
    header('Location: ./kaldi.php?pid='.$Player['pid']."&t=".$t."&event=".$event,true, 301);

} else { // что - то пошло не так
    $response = ['result'=>'ERROR', 'data'=>''];
}
echo json_encode($response);


?>