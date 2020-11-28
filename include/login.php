<?php

  $a = $_GET['a'];
  
  $MESS = "Авторизация пользователя";
  switch ($a)
  {
     case "err":
     {
       $MESS = "<div class='alertdanger' style='width:80%;'><p>Ошибка авторизации.<br>Проверьте логин и пароль.</p></div>";
       break;
     }

     case "denied":
     {
       $MESS = "<p>err1:  Не достаточно полномочий</p>";
       break;
     }
  }

  $login_form = "<p>&nbsp;</p>
  <form action='index.php' method='post'>
  <input name='do' type='hidden' value='auth'>
  <table width='30%' align='center'>
    <tr>
    <td align='center'>
            <div class='block'>
                     <img src='images/help-desk-icon.png' width='150'><br>
                     <h1>Система обработки поручений</h1>
                      <br>".$MESS."<br>
                     <input type='text' name='login' autocomplete='off' class='form-control' placeholder='Табельный номер' style='width:50%;'><br>
                     <input type='password' name='passw' class='form-control' placeholder='Пароль' style='width:50%;'><br>
                     <br>
                     <input type='submit' value='Войти' class='btn-blue' style='width:50%; height:50px;'>
            </div>
          </td>
    </tr>
  </form>  ";


  $CONTENT .= $login_form;



?>



