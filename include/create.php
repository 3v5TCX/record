<?php

/******************************************************************************/
/*   обработка событий формы                                                  */
/******************************************************************************/
  $event = $_POST['event'];
  if ($event=='addnew')
  {    $p = $_POST['p'];
    $date_create = date("Y-m-d H:i:s",time());
    $sql = "INSERT INTO pks_tickets (`prioritet`,       `user_id`,        `worker_id`,    `date_create`,      `subject`,           `user_comment`, `worker_comment`, `progress`, `last_update`, `ok_date`)
                             VALUES ('".$p['prior']."', '".$p['from']."', '".$p['to']."', '".$date_create."', '".$p['subject']."', '".$p['txt']."', NULL,               '0',        NULL,          NULL)";
    mysqli_query($connect, $sql);
    $nom = mysqli_insert_id($connect);

    $vsego = mysqli_num_rows(mysqli_query($connect, "SELECT count(*) FROM pks_tickets WHERE status='open' AND worker_id=".$p['to']),0);

    $create_form = "
    <p>&nbsp;</p>    <p>&nbsp;</p>    <p>&nbsp;</p>
    <h1>Поручение № ".$nom." добавлено</h1>
    <h2>В очереди на исполнение <b>".$vsego."</b> поручений</h2>
    <a href='index.php?do=main&cash=".md5(mt_rand(0,999999999))."'>Главная страница</a>
    <p>&nbsp;</p>    <p>&nbsp;</p>    <p>&nbsp;</p>
    ";
    $FromP = GetPlayer("AND pid = ".$p['from']);
    $ToP = GetPlayer("AND pid = ".$p['to']);

    if ($ToP['pemail']!='0')
    {
       $message = "
       <b>Зарегистрировано новое Поручение</b><br>
       <b>Автор:</b>".$Player['pfio']."<br>
       <b>За:</b> ".$FromP['pfio']."<br>
       <b>Суть поручения:</b><br>
       ".$p['txt']."<br>
       <b>Контроль:</b> <a href='####'>ссылка на сервер</a>
       ";
       smtpmail('Поручения', $ToP['pemail'], 'Новая запись', $message);
    }

    if ($FromP['pemail']!='0')
    {
       $message = "
       <b>Зарегистрировано новое Поручение</b><br>
       <b>Автор:</b>".$Player['pfio']."<br>
       <b>За:</b> ".$FromP['pfio']."<br>
       <b>Суть поручения:</b><br>
       ".$p['txt']."<br>
       <b>Контроль:</b> <a href='####'>ссылка на сервер</a>
       ";
       smtpmail('Поручения', $FromP['pemail'], 'Новая запись', $message);
    }

  }



/******************************************************************************/
/*   От кого поручение                                                           */
/******************************************************************************/
  $u_from.= "<select size='1' name='p[from]' class='form-control' style='width:100%;'>";
  $query = mysqli_query($connect, "SELECT * FROM pks_player WHERE 1=1 ORDER BY pfio");
  while($row = mysqli_fetch_assoc($query))
  {
    if ($row['pid']==$Player['pid'])
    {
      $my_u_from = "<option value='".$row['pid']."' selected style='background-color: #E2FFD9;'>".$row['pfio']." [".$row['pdolzh']."]</option>";
    }
    else
    {
      $no_u_from.= "<option value='".$row['pid']."'>".$row['pfio']." [".$row['pdolzh']."]</option>";
    }
  }
  $u_from.= $my_u_from.$no_u_from."</select>";


/******************************************************************************/
/*   Для кого заявка                                                          */
/******************************************************************************/
  $u_to.= "<select size='1' name='p[to]' class='form-control' style='width:100%;'>";
  $query = mysqli_query($connect, "SELECT * FROM pks_player WHERE 1=1 ORDER BY pfio");
  while($row = mysqli_fetch_assoc($query))
  {
    if ($row['pid']==1)
    {
      $my_u_to = "<option value='".$row['pid']."' selected style='background-color: #E2FFD9;'>".$row['pfio']." [".$row['pdolzh']."]</option>";
    }
    else
    {
      $no_u_to.= "<option value='".$row['pid']."'>".$row['pfio']." [".$row['pdolzh']."]</option>";
    }
  }
  $u_to.= $my_u_to.$no_u_to."</select>";


/******************************************************************************/
/*   вид работ                                                             */
/******************************************************************************/
  $s_from.= "<select size='1' name='p[subject]' class='form-control' style='width:100%;'>";
  $query = mysqli_query($connect, "SELECT * FROM pks_subject WHERE 1=1");
  while($row = mysqli_fetch_assoc($query))
  {
    $s_from.= "<option value='".$row['sid']."' selected style='background-color: #E2FFD9;'>".$row['stitle']."</option>";
  }
  $s_from.= "</select>";


/******************************************************************************/
/*   Собираем форму                                                           */
/******************************************************************************/

  if ($event != 'addnew')
  $create_form = "
  <h1><img src='images/ticket.png'> cоздать новое Поручение</h1>
  <form action='index.php' method='post'>
  <input name='do' type='hidden' value='create'>
  <input name='event' type='hidden' value='addnew'>
  <table width='50%' align='center'>
    <tr>
    <td align='center'>
      <div class='block'>

       <table width='90%' align='center'>
       <tr>
         <td>От кого:</td><td>".$u_from."</td>
       </tr>

       <tr>
         <td>Кому:</td><td>".$u_to."</td>
       </tr>
       <tr>
         <td>Приоритет:</td><td>
         <select size='1' name='p[prior]' class='form-control' style='width:100%;'>
          <option value='1'>Обычный</option>
          <option value='2'>Высокий</option>
          <option value='3'>Обеспечивающий</option>
         </select>
         </td>
       </tr>
       <tr>
         <td>Направление:</td><td>
         ".$s_from."
         </td>
       </tr>
       <tr>
         <td colspan='2'>
           Суть обращения:<br>
           <textarea name='p[txt]' rows=5 cols=20 class='form-control' placeholder='Подробно опишите суть поручения' style='width:100%; height:200px;'></textarea>
           


           


           <a href='#'><h3>[Тут запись звука - интегрировать речевик сюда]</h3>           </a>




         </td>
       </tr>
       <tr>
         <td colspan='2' align='center'>
            <input type='submit' value='Отправить' class='btn-blue' style='width:50%; height:50px;'><br><br>
         </td>
       </tr>
       <tr>
         <td colspan='2' align='center'>
            <a href='index.php?cach=".md5(mt_rand(1,999999999))."'><div class='btn-gray' style='width:50%;'>Отмена</div></a>
         </td>
       </tr>

       </table>
      </div>
    </td>
    </tr>
  </table>
  </center>
  </div>";



  $CONTENT .= "
  <div style='background:#ffffff; height:100%; width:100%'>
    <center>
      ".$create_form."
    </center>
  </div>  ";





?>



