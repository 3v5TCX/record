<?php

/* Для отладки 
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
/**/


/*

Самое интересне тут, форма для речевика

*/

$t = intval($_GET['t']);
$event = $_GET['event'];

$title = "Записать новое поручение";
if ($event == "yes")
{
  $title = "Записать отчет о выполнении поручения";
}
if ($event == "no")
{
  $title = "Поручение не выполнено";
}
if ($event == "stop")
{
  $title = "Отменить поручение";
}



/******************************************************************************/
/*   Собираем форму                                                           */
/******************************************************************************/

  
  $create_form = "
  <h1><img src='images/ticket.png'> ".$title."</h1>
 
    <h2 style='color:black'>Слушаю вас!</h2>

    <b>Нажмите запись, потом стоп.</b>
    <div id='controls'>
     <button id='recordButton'>Record</button>
     <button id='pauseButton' disabled>Pause</button>
     <button id='stopButton' disabled>Stop</button>
    </div>
    <div id='formats'></div>
    <p><strong>Звукозапись:</strong></p>
    <ol id='recordingsList'></ol>    


<script>


function createDownloadLink(blob) 
{
  
  var url = URL.createObjectURL(blob);
  var au = document.createElement('audio');
  var li = document.createElement('li');
  var link = document.createElement('a');

  //name of .wav file to use during upload and download (without extendion)
  var filename = new Date().toISOString();

  //add controls to the <audio> element
  au.controls = true;
  au.src = url;

  //save to disk link
  link.href = url;
  link.download = filename+\".wav\"; //download forces the browser to donwload the file using the  filename
  

  //add the new audio element to li
  li.appendChild(au);
  
  //add the filename to the li
  li.appendChild(document.createTextNode(filename+\".wav \"))

  //add the save to disk link to li
  li.appendChild(link);
  
  //upload link
  var upload = document.createElement('a');
  upload.href=\"#\";
  upload.innerHTML = \"<b>Распознать</b>\";
  upload.addEventListener(\"click\", function(event){
      var xhr=new XMLHttpRequest();
      xhr.onload=function(e) {
          if(this.readyState === 4) {
              console.log(\"Server returned: \",e.target.responseText);
              upload.innerHTML = \"<b>Результат: \" + e.target.responseText + \"</b>\";
          }
      };
      var fd=new FormData();
      fd.append(\"audio_data\",blob, filename);
      fd.set(\"t\", ".$t.");
      fd.set(\"event\", \"".$event."\");

      xhr.open(\"POST\",\"upload.php\",true);
      xhr.send(fd);
  })
  li.appendChild(document.createTextNode (\" \"))//add a space in between
  li.appendChild(upload)//add the upload link to li

  //add the li element to the ol
  recordingsList.appendChild(li);
}


</script>  ";



  $CONTENT .= "

  <div style='background:#ffffff; height:100%; width:100%'>
    <center>
    <table width='80%' align='center'>
      <tr>
          <td width='33%' valign='top'>
                <b>".$Player['pfio']."</b><br>".$Player['pdolzh']."<br>
                <a href='index.php?do=exit'><b>[ Выход из системы ]</b></a>
          </td>
          <td width='20%' align='center' valign='right'>
                <a href='index.php?do=main&cach=".md5(mt_rand(0,999999999))."'><div class='btn-blue' style='height:32px'>Обновить журнал</div></a>
          </td>
          <td width='25%' align='center' ><a href='index.php?do=create'><div class='btn-green' style='width:100%; height:32px'>Создать</div></a></td>
          

      </tr>
    </table>
    <table width='80%' align='center'>
      <tr>
        <td width='33%' align='center'><a href='index.php?do=main&pagesort=in&cach=".md5(mt_rand(0,999999999))."'><div class='btn-blue' style='width:100%; height:32px'><img src='images/in.png'>&nbsp;Входящие</div></a></td>
        <td width='34%' align='center'><a href='index.php?do=main&pagesort=out&cach=".md5(mt_rand(0,999999999))."'><div class='btn-blue' style='width:100%; height:32px'><img src='images/out.png'>&nbsp;Исходящие</div></a></td>
        <td width='33%' align='center'><a href='index.php?do=main&pagesort=arc&cach=".md5(mt_rand(0,999999999))."'><div class='btn-blue' style='width:100%; height:32px'><img src='images/arc.png'>&nbsp;Аналитика</div></a></td>
      </tr>
    </table>
      ".$create_form."
    </center>
  </div>  ";





?>



