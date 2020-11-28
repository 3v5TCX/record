<?php

$db_host = '77.222.63.167';
$db_user = 'user570_tik';
$db_pass = 'k4hvd711';
$db_name = 'user570_tik';

/********************************************************************************************************************************/

$connect = mysqli_connect($db_host, $db_user, $db_pass) or die("На сервере ведутся технические работы!");
mysqli_select_db($connect, $db_name) or die("На сервере ведутся технические работы с базой данных!");
mysqli_query($connect, "SET NAMES 'utf8'");


function navigation($all,$napage,$page,$url,$total)
{
  $echo='<center><div class="str">';
  if($page-1>0) $echo.='<a href="'.$url.'&page='.($page-1).'">&laquo;</a>';
  if($page-2>0) $first='<a href="'.$url.'&page=">1</a> .. ';
  if($page-1>0) $page1left='<a href="'.$url.'&page='.($page-1).'">'.($page-1).'</a>';
  if($page+1<=$total) $page1right='<a href="'.$url.'&page='.($page+1).'">'.($page + 1).'</a>';
  if($page+2<=$total) $page2right=' .. <a href="'.$url.'&page='.($total).'">'.($total).'</a>';
  $echo.= $first.''.$page1left.'<span class="nav">'.$page.'</span>'.$page1right.''.$page2right;
  if($page+1>0 && $page < $total)$echo.='<a href="'.$url.'&page='.($page+1).'">&raquo;</a>';
  $echo.='</div></center>';
  return $echo;
}
/******************************************************************************/
function sTime($datetime2)
{

}

/******************************************************************************/


function GetPlayer($sql = "")
{
  global $connect;
  $rez = mysqli_query($connect,"SELECT * FROM  pks_player  WHERE 1=1 ".$sql);


  if (empty($rez))  return "";

  $Player = mysqli_fetch_array($rez);
  mysqli_query($connect,"UPDATE pks_player SET plastup=".time().", pagent='".$_SERVER['HTTP_USER_AGENT']."', pip='".$_SERVER['REMOTE_ADDR']."'  WHERE pid=".$Player['pid']);
  $Player['plastup'] = time();

  return $Player;
}

function online ($t)
{
  global $connect;
  $html = "";
  $query = mysqli_query($connect,"SELECT * FROM pks_player WHERE plastup >= ".$t);
  while($res = mysqli_fetch_assoc($query))
  {
    $html.= " <a href='mailto:".$res['pemail']."'>".$res['pfio']."</a>";
  }
  return $html;
}

/********************************************************************************************************************************/
/*
/*  Часто используемые функции
/*
/**/

function getSslPage($url) { // заставляем работать с ssl
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($ch, CURLOPT_HEADER, false);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_REFERER, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
    $result = curl_exec($ch);
    curl_close($ch);
    return $result;
}

function fresh($text)
{
  global $connect;
  $text = trim(htmlspecialchars(mysqli_real_escape_string($connect,$text)));
  return $text;
}

/*
function GetPlayer($sql = "")
{
  $rez = mysqli_query($connect,"SELECT * FROM  pks_player WHERE 1=1 ".$sql);
  if (empty($rez))  return "";
  $Player = mysqli_fetch_array($rez);
  return $Player;
}
/**/


/******************************************************************************/
/*  Отправка письма SMTP                                                      */

$config['smtp_username'] = 'mail@mail.ru';  //Смените на адрес своего почтового ящика.
$config['smtp_port'] = '465'; // Порт работы.
$config['smtp_host'] =  'ssl://mail.nic.ru';  //сервер для отправки почты
$config['smtp_password'] = 'pass';  //Измените пароль
$config['smtp_debug'] = true;  //Если Вы хотите видеть сообщения ошибок, укажите true вместо false
$config['smtp_charset'] = 'utf-8';  //кодировка сообщений. (windows-1251 или utf-8, итд)
$config['smtp_from'] = 'Рабочий журнал'; //Ваше имя - или имя Вашего сайта. Будет показывать при прочтении в поле "От кого"

function smtpmail($to='', $mail_to, $subject, $message, $headers='') 
{

  return true; // Заглушка, почту пок не отправляем

  global $config;
  global $connect;
  $SEND =  "Date: ".date("D, d M Y H:i:s") . " UT\r\n";
  $SEND .= 'Subject: =?'.$config['smtp_charset'].'?B?'.base64_encode($subject)."=?=\r\n";
  if ($headers) $SEND .= $headers."\r\n\r\n";
  else
  {
      $SEND .= "Reply-To: ".$config['smtp_username']."\r\n";
      $SEND .= "To: \"=?".$config['smtp_charset']."?B?".base64_encode($to)."=?=\" <$mail_to>\r\n";
      $SEND .= "MIME-Version: 1.0\r\n";
      $SEND .= "Content-Type: text/html; charset=\"".$config['smtp_charset']."\"\r\n";
      $SEND .= "Content-Transfer-Encoding: 8bit\r\n";
      $SEND .= "From: \"=?".$config['smtp_charset']."?B?".base64_encode($config['smtp_from'])."=?=\" <".$config['smtp_username'].">\r\n";
      $SEND .= "X-Priority: 3\r\n\r\n";
  }
  $SEND .=  $message."\r\n";
   if( !$socket = fsockopen($config['smtp_host'], $config['smtp_port'], $errno, $errstr, 30) ) {
    if ($config['smtp_debug']) echo $errno."<br>".$errstr;
    return false;
   }

  if (!server_parse($socket, "220", __LINE__)) return false;

  fputs($socket, "HELO " . $config['smtp_host'] . "\r\n");
  if (!server_parse($socket, "250", __LINE__)) {
    if ($config['smtp_debug']) echo '<p>Не могу отправить HELO!</p>';
    fclose($socket);
    return false;
  }
  fputs($socket, "AUTH LOGIN\r\n");
  if (!server_parse($socket, "334", __LINE__)) {
    if ($config['smtp_debug']) echo '<p>Не могу найти ответ на запрос авторизаци.</p>';
    fclose($socket);
    return false;
  }
  fputs($socket, base64_encode($config['smtp_username']) . "\r\n");
  if (!server_parse($socket, "334", __LINE__)) {
    if ($config['smtp_debug']) echo '<p>Логин авторизации не был принят сервером!</p>';
    fclose($socket);
    return false;
  }
  fputs($socket, base64_encode($config['smtp_password']) . "\r\n");
  if (!server_parse($socket, "235", __LINE__)) {
    if ($config['smtp_debug']) echo '<p>Пароль не был принят сервером как верный! Ошибка авторизации!</p>';
    fclose($socket);
    return false;
  }
  fputs($socket, "MAIL FROM: <".$config['smtp_username'].">\r\n");
  if (!server_parse($socket, "250", __LINE__)) {
    if ($config['smtp_debug']) echo '<p>Не могу отправить комманду MAIL FROM: </p>';
    fclose($socket);
    return false;
  }
  fputs($socket, "RCPT TO: <" . $mail_to . ">\r\n");

  if (!server_parse($socket, "250", __LINE__)) {
    if ($config['smtp_debug']) echo '<p>Не могу отправить комманду RCPT TO: </p>';
    fclose($socket);
    return false;
  }
  fputs($socket, "DATA\r\n");

  if (!server_parse($socket, "354", __LINE__)) {
    if ($config['smtp_debug']) echo '<p>Не могу отправить комманду DATA</p>';
    fclose($socket);
    return false;
  }
  fputs($socket, $SEND."\r\n.\r\n");

  if (!server_parse($socket, "250", __LINE__)) {
    if ($config['smtp_debug']) echo '<p>Не смог отправить тело письма. Письмо не было отправленно!</p>';
    fclose($socket);
    return false;
  }
  fputs($socket, "QUIT\r\n");
  fclose($socket);
  return TRUE;
}

function server_parse($socket, $response, $line = __LINE__) {
  global $config;
  while (@substr($server_response, 3, 1) != ' ') {
    if (!($server_response = fgets($socket, 256))) {
      if ($config['smtp_debug']) echo "<p>Проблемы с отправкой почты!</p>$response<br>$line<br>";
       return false;
     }
  }

  if (!(substr($server_response, 0, 3) == $response)) {
    if ($config['smtp_debug']) echo "<p>Проблемы с отправкой почты!</p>$response<br>$line<br>";
    return false;
  }
  return true;
}

//smtpmail('Имя получателя', 'email-получателя@mail.ru', 'Тема письма', 'HTML или обычный текст письма');


/******************************************************************************/
function getTime($start, $end)
{
     //= '';
    $endTime = strtotime($end);
    $startTime = strtotime($start);

    $time = $endTime - $startTime;

    $chas = intval($time / 3600);
    $min  = intval($chas * 3600);
    $min  = intval(($time - $min) / 60);

    $sec = $time - ($chas * 3600) - ($min*60);

    if ($chas<10) $chas = "0".$chas;
    if ($min<10)  $min = "0".$min;
    if ($sec<10)  $sec = "0".$sec;


    $echo.= "<b>".$chas."</b>ч. <b>".$min."</b>м. <b>".$sec."</b>с. ";

    return $echo;
}

?>