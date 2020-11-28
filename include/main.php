<?php
global $connect;


  $event = $_GET['event']; if (empty($event)) $event = $_POST['event'];
  $id    = $_GET['id'];    if (empty($id))    $id = $_POST['id'];
  $page = $_GET['page'];   if (empty($page))  $page = $_POST['page'];
  $type = $_GET['type'];   if (empty($type))  $type = $_POST['type'];

  if ($event=="stop")
  {    
    $data = date("Y-m-d H:i:s",time());
    $comment = $_POST['comment'];
    $sql = "UPDATE pks_tickets SET worker_comment='".$comment."', status='close', progress='99', last_update='".$data."' WHERE id=".$id;
    mysqli_query($connect,$sql);
  }

  if ($event=="no")
  {
    $data = date("Y-m-d H:i:s",time());
    $comment = $_POST['comment'];
    $sql = "UPDATE pks_tickets SET worker_comment='".$comment."', status='close', progress='50', last_update='".$data."' WHERE id=".$id;
    mysqli_query($connect,$sql);

    if ($User['pemail']!='0')
    {
       $time = getTime($User['date_create'], $User['last_update']);
       $message = "
       <b>Поручение № ".$User['id']." не выполнено.</b><br>
       <b>Исполнитель:</b>".$Worker['pfio']."<br><br>
       <b>Время исполнения:</b> ".$time."<br><br>
       <b>Суть поручения:</b><br>
       ".$User['user_comment']."<br>
       <b>Решение:</b><br>
       ".$User['worker_comment']."<br><br>
       
       ";
       smtpmail($User['pfio'], $User['pemail'], 'Поручение не выполнено', $message);
    }
  }

  if ($event=="yes")
  {
    $data = date("Y-m-d H:i:s",time());
    $comment = $_POST['comment'];
    $sql = "UPDATE pks_tickets SET worker_comment='".$comment."', status='close', progress='100', last_update='".$data."', ok_date='".$data."' WHERE id=".$id;
    mysqli_query($connect,$sql);

    $sql = "SELECT * FROM pks_player, pks_tickets WHERE pks_tickets.user_id = pks_player.pid AND pks_tickets.id=".$id;
    $rez = mysqli_query($connect,$sql);
    $User = mysqli_fetch_array($rez);

    $sql = "SELECT * FROM pks_player, pks_tickets WHERE pks_tickets.worker_id = pks_player.pid AND pks_tickets.id=".$id;
    $rez = mysqli_query($connect,$sql);
    $Worker = mysqli_fetch_array($rez);

    if ($User['pemail']!='0')
    {       $time = getTime($User['date_create'], $User['ok_date']);
       $message = "
       <b>Поручение № ".$User['id']." выполнено.</b><br>
       <b>Исполнитель:</b>".$Worker['pfio']."<br><br>
       <b>Время исполнения:</b> ".$time."<br><br>
       <b>Суть поручения:</b><br>
       ".$User['user_comment']."<br>
       <b>Решение:</b><br>
       ".$User['worker_comment']."<br><br>
       
       ";
       smtpmail($User['pfio'], $User['pemail'], 'Поручение выполнено', $message);
    }
  }


  $order_by = "ORDER BY pks_tickets.status DESC, pks_tickets.id  DESC ";
  $where = "(worker_id=".$Player['pid']." OR user_id=".$Player['pid'].") AND 1=1 ";


  //OR worker_id = 1

  if (empty($pagesort)) $pagesort = $_COOKIE['pagesort'];
  if (empty($pagesort)) $pagesort = "out";

  $in = "gray"; $out="gray"; $arc="gray";
  if ($pagesort=="in")
  {
    $where = "(worker_id=".$Player['pid'].") AND 1=1 ";
    $in = "blue";
    //echo "in !!!!!!!!!!!!!!!!!!!!!!";
  }

  if ($pagesort=="out")
  {
    $where = "(user_id=".$Player['pid'].") AND 1=1 ";
    $out = "blue";
    //echo "out !!!!!!!!!!!!!!!!!!!!!!";
  }

  if ($pagesort=="arc")
  {
    $where = "(worker_id=".$Player['pid']." OR user_id=".$Player['pid'].") AND 1=1 ";
    //setcookie("page","arc",time()+600000);
    $arc="blue";
  }

//  echo $Player['pid'];
  if ($Player['pid'] == 2 || $Player['pid'] == 126)
    $where = "(worker_id=".$Player['pid']." OR user_id=".$Player['pid']." OR worker_id=1) AND 1=1 ";


  //if ()

  $kol = 30; //  Сколько объектов на странице
  $all = mysqli_num_rows(mysqli_query($connect,"SELECT count(*) FROM pks_tickets WHERE ".$where));

  $total = intval(($all-1)/$kol)+1;
  $page = abs(intval($_GET['page']));

  if(empty($page) || $page <= 0)
  {
    $page = 1;
  }
  if($page > $total)
  {
    $page = $total;
  }
  $past = intval($all/$kol);
  $start = $page*$kol-$kol;

  $sql = "SELECT * FROM pks_tickets, pks_subject, pks_player WHERE pks_player.pid=pks_tickets.user_id AND pks_tickets.subject=pks_subject.sid AND ".$where." ".$order_by." LIMIT ".$start.",".$kol."";
  $query = mysqli_query($connect,$sql);

  //echo $sql;

  $bg = "#F9F9F9";
  $TABLE.= "<table width='80%' bgcolor='#E9E9E9' align='center' width='100%' cellSpacing=1 cellPadding=5 border=0'  class='maintab' >
  <tr><td align='center'><b>№</b></td><td ></td>
  <td align='center'><b>Автор</b></td>
  <!---td align='center'><b>Кому</b></td--->
  <td align='center'><b>Суть поручения</b></td> <td align='center'><b>Комментарий</b></td> <td align='center'></td></tr>
  ";
  while($row = mysqli_fetch_assoc($query))
  {
    if ($bg == "#F9F9F9") $bg = "#FFFFFF"; else $bg = "#F9F9F9";

    $toPlayer = GetPlayer("AND pid=".$row['worker_id']);

    if ($row['progress']==100)
    {      $ok = date("d.m.Y [H:i]", strtotime($row['ok_date']));
      $st = date("d.m.Y [H:i]", strtotime($row['date_create']));
      $time = getTime($row['date_create'], $row['ok_date']);      $prioritet = "<img src='images/r/100.png' width='25'><br><small><nobr>".$time."</nobr></small>";
      $bg = "#EAFFEA";
    }

    if ($row['progress']==50)
    {
      $ok = date("d.m.Y [H:i]", strtotime($row['last_update']));
      $st = date("d.m.Y [H:i]", strtotime($row['date_create']));
      $time = getTime($row['date_create'], $row['last_update']);
      $prioritet = "<img src='images/r/50.png' width='25'><br><small><nobr>".$time."</nobr></small>";
      $bg = "#D7FDF5";
    }

    if ($row['progress']==99)
    {
      $ok = date("d.m.Y [H:i]", strtotime($row['last_update']));
      $st = date("d.m.Y [H:i]", strtotime($row['date_create']));
      $time = getTime($row['date_create'], $row['last_update']);
      $prioritet = "<img src='images/r/99.png' width='25'><br><small><nobr>".$time."</nobr></small>";
      $bg = "#EBF9E6";
    }

    if ($row['progress']==0)
    {
      $ok = date("d.m.Y [H:i]", strtotime($row['date_create']));
      //$st = sTime($row['date_create']);
      $prioritet = "<img src='images/r/".$row['prioritet'].".png' width='25'><br><small><nobr><b>Н:</b>".$ok."</nobr><br></small>";
      $bg = "#FFFFFF";
    }

    $panel = "";
    $div = "";
    if ($row['worker_id']==$Player['pid'])
    {      $div = "
      <div id=\"YesDiv".$row['id']."\" style=\"display:none; margin:0 auto; left:65%; position: absolute;  background: #ffffff; border:solid #C1C1C1 5px; padding:10px;\">
       <center>
       <form acton=\"index.php?do=main\" method=\"post\">
       <b>Комментарий:</b><br>
       <textarea name=\"comment\" rows=5 cols=20></textarea><br>
       <input name=\"id\" value=\"".$row['id']."\" type=\"hidden\">
       <input name=\"event\" value=\"yes\" type=\"hidden\">
       
      <p><a style='color:red' title=\"ВЫПОЛНЕНО\" href=\"index.php?do=record&t=".$row['id']."&event=yes\" >[== РЕЧЕВИК ==]</a></p>
      
      <input value=\"Поручение выполнено\" type=\"submit\"><br><br>

       <a href=\"#\" onclick=\"closeall('YesDiv".$row['id']."');\"><small>[Отмена]</small></a> <br>
       </form>
       </center>
      </div>
      <a title=\"ВЫПОЛНЕНО\" href=\"#\" onclick=\"closeall('YesDiv".$row['id']."'); document.getElementById('YesDiv".$row['id']."').style.display='block'; return false;\"><img src='images/r/100.png' width='18'></a>



      
      ";
      $panel .= $div."&nbsp;";
    }

    if ($row['user_id']==$Player['pid'])
    {
      $div = "
      <div id=\"stopDiv".$row['id']."\" style=\"display:none; margin:0 auto; left:65%; position: absolute;  background: #ffffff; border:solid #C1C1C1 5px; padding:10px;\">
       <center>
       <form acton=\"index.php?do=main\" method=\"post\">
       <b>Комментарий:</b><br>
       <textarea name=\"comment\" rows=5 cols=20></textarea><br>
       <input name=\"id\" value=\"".$row['id']."\" type=\"hidden\">
       <input name=\"event\" value=\"stop\" type=\"hidden\">

      <p><a style='color:red' title=\"ВЫПОЛНЕНО\" href=\"index.php?do=record&t=".$row['id']."&event=stop\" >[== РЕЧЕВИК ==]</a></p>

       <input value=\"Остановить поручение\" type=\"submit\"><br><br>
       <a href=\"#\" onclick=\"closeall('stopDiv".$row['id']."');\"><small>[Отмена]</small></a> <br>
       </form>
       </center>
      </div><a title=\"ОСТАНОВИТЬ\" href=\"#\" onclick=\"closeall('stopDiv".$row['id']."'); document.getElementById('stopDiv".$row['id']."').style.display='block'; return false;\"><img src='images/r/99.png' width='18'></a>
      ";
      $panel .= $div."&nbsp;";

    }

    if ($row['worker_id']==$Player['pid'])
    {
      $div = "
      <div id=\"noDiv".$row['id']."\" style=\"display:none; margin:0 auto; left:65%; position: absolute;  background: #ffffff; border:solid #C1C1C1 5px; padding:10px;\">
       <center>
       <form acton=\"index.php?do=main\" method=\"post\">
       <b>Комментарий:</b><br>
       <textarea name=\"comment\" rows=5 cols=20></textarea><br>
       <input name=\"id\" value=\"".$row['id']."\" type=\"hidden\">
       <input name=\"event\" value=\"no\" type=\"hidden\">

      <p><a style='color:red' title=\"ВЫПОЛНЕНО\" href=\"index.php?do=record&t=".$row['id']."&event=no\" >[== РЕЧЕВИК ==]</a></p>

       <input value=\"Поручение не выполнено\" type=\"submit\"><br><br>




       <a href=\"#\" onclick=\"closeall('noDiv".$row['id']."');\"><small>[Отмена]</small></a> <br>
       </form>
       </center>
      </div><a title=\"НЕ ВЫПОЛНЕНО\" href=\"#\" onclick=\"closeall('noDiv".$row['id']."'); document.getElementById('noDiv".$row['id']."').style.display='block'; return false;\"><img src='images/r/50.png' width='18'></a>
      ";
      $panel .= $div."&nbsp;";
    }

    if ($row['progress']!=0)
    {      $panel = "";
    }

    $TABLE.= "
    <tr>
        <td bgcolor='".$bg."' align='center'>".$row['id']."</td>
        <td bgcolor='".$bg."' align='center'>".$prioritet."</td>
        <td bgcolor='".$bg."'><b>От: ".$row['pfio']."</b><br>
                              <span style='color:#C0C0C0'><b>Для:</b> ".$toPlayer['pfio']."</span>
        </td>
        <td bgcolor='".$bg."'>".$row['user_comment']."<br><span style='color:#C0C0C0'><small>".$row['stitle']."</small></span></td>
        <td bgcolor='".$bg."'>".$row['worker_comment']."</td>
        <td bgcolor='".$bg."' align='center'>
        <nobr>".$panel."</nobr>
        </td>
    </tr>
    ";
  }
  $TABLE.= "</table><br>";
  $TABLE.= navigation($all,$kol,$page,"index.php?do=main",$total);


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
      <td width='25%' align='center' ><a href='index.php?do=record'><div class='btn-rubin' style='width:100%; height:32px'>Речевик</div></a></td>

  </tr>
</table>

  <table width='80%' align='center'>
    <tr>
      <td width='33%' align='center'><a href='index.php?do=main&pagesort=in&cach=".md5(mt_rand(0,999999999))."'><div class='btn-".$in."' style='width:100%; height:32px'><img src='images/in.png'>&nbsp;Входящие</div></a></td>
      <td width='34%' align='center'><a href='index.php?do=main&pagesort=out&cach=".md5(mt_rand(0,999999999))."'><div class='btn-".$out."' style='width:100%; height:32px'><img src='images/out.png'>&nbsp;Исходящие</div></a></td>
      <td width='33%' align='center'><a href='index.php?do=main&pagesort=arc&cach=".md5(mt_rand(0,999999999))."'><div class='btn-".$arc."' style='width:100%; height:32px'><img src='images/arc.png'>&nbsp;Аналитика</div></a></td>
    </tr>
  </table>
  <br>
  ".$TABLE."
    </center>
</div>
  ";







?>



