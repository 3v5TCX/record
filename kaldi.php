<?php

/* Для отладки
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
/**/

require_once("./vendor/autoload.php");
use WebSocket\Client;
$client = new Client("ws://localhost:2700/", array('timeout' => 2000));
$myfile = fopen("outputRR.wav", "r");
while(!feof($myfile)) 
{
   $data = fread($myfile, 8000);
   $client->send($data, 'binary');
   //echo $client->receive() . "\n";
   $client->receive();
}
$client->send("{\"eof\" : 1}");

$receive = $client->receive() . "\n";


$json = json_decode($receive, true);

/**/
// Самое интересное тут, пробуем понять что сказал пользователь и записать в базу

include "config.php"; // Подключили наши конфики и БД

$pid = intval($_GET['pid']); // Кто отправил поручение
//$pid = 1; // заглушка на время разработки

$t = intval($_GET['t']);
$event = $_GET['event'];

$text = $json['text']; // то что сказал
$command = explode(" ", $text);


  if ($event=="yes")
  {
    $data = date("Y-m-d H:i:s",time());
    $comment = $json['text'];
    $sql = "UPDATE pks_tickets SET worker_comment='".$comment."', status='close', progress='100', last_update='".$data."', ok_date='".$data."' WHERE id=".$t;
    mysqli_query($connect,$sql);
    echo "ВЫПОЛНЕНО. В журнал записано: ".$comment;
    exit;
  }

  if ($event=="stop")
  {    
    $data = date("Y-m-d H:i:s",time());
    $comment = $json['text'];
    $sql = "UPDATE pks_tickets SET worker_comment='".$comment."', status='close', progress='99', last_update='".$data."' WHERE id=".$t;
    mysqli_query($connect,$sql);
	echo "ОТМЕНА. В журнал записано: ".$comment;    
	exit;
  }

  if ($event=="no")
  {
    $data = date("Y-m-d H:i:s",time());
    $comment = $json['text'];
    $sql = "UPDATE pks_tickets SET worker_comment='".$comment."', status='close', progress='50', last_update='".$data."' WHERE id=".$t;
    mysqli_query($connect,$sql);
    echo "НЕ ВЫПОЛНЕНО. В журнал записано: ".$comment;
    exit;
  }

/* Решаем влоб (дублируем код) ! */

  if ($event=="resend")
  {

	$PlayerTo = GetPlayer(" AND hotword LIKE '%".$command[0]."%'");
	if (intval($PlayerTo['pid']) > 0) // получатель поручения в БД найден, записываем для него
	{
		$prior = 1;
		$subject = 1;

		$to = $PlayerTo['pid']; 
		$date_create = date("Y-m-d H:i:s",time());
		$sql = "INSERT INTO pks_tickets (`parent_id`, `prioritet`,       `user_id`,        `worker_id`,    `date_create`,      `subject`,           `user_comment`, `worker_comment`, `progress`, `last_update`, `ok_date`)
		VALUES (".$t.", '".$prior."', '".$pid."', '".$to."', '".$date_create."', '".$subject."', '".$text."', NULL, '0', NULL, NULL)";
	    
		mysqli_query($connect, $sql);
		echo $sql."Создано перепоручение для <u style='color:blue'>".$PlayerTo['pfio']."</u>: ".$text; // на возврат для вебморды, инфа о том, что у нас получилось
		exit;
	}
	else 
	{
		echo "<font color=red>Исп???</font> ".$text; // на возврат для вебморды, инфа о том, что у нас получилось	
		exit;	
	}

    

  }



$PlayerTo = GetPlayer(" AND hotword LIKE '%".$command[0]."%'");
if (intval($PlayerTo['pid']) > 0) // получатель поручения в БД найден, записываем для него
{
	$prior = 1;
	$subject = 1;

	$to = $PlayerTo['pid']; 
	$date_create = date("Y-m-d H:i:s",time());
	$sql = "INSERT INTO pks_tickets (`prioritet`,       `user_id`,        `worker_id`,    `date_create`,      `subject`,           `user_comment`, `worker_comment`, `progress`, `last_update`, `ok_date`)
	VALUES ('".$prior."', '".$pid."', '".$to."', '".$date_create."', '".$subject."', '".$text."', NULL, '0', NULL, NULL)";
    
	mysqli_query($connect, $sql);
	echo "Создано поручение для <u style='color:blue'>".$PlayerTo['pfio']."</u>: ".$text; // на возврат для вебморды, инфа о том, что у нас получилось
	exit;
}
else 
{
	echo "<font color=red>Исп???</font> ".$text; // на возврат для вебморды, инфа о том, что у нас получилось	
	exit;	
}





/**/


fclose($myfile);

?>