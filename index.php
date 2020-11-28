<?php

/* Для отладки 
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
/**/


  include "config.php";

  $do = fresh($_GET['do']);  if (empty($do)) $do = fresh($_POST['do']);

  $pid  = $_COOKIE['pid'];
  $pwd  = $_COOKIE['pwd'];
  $Player = GetPlayer(" AND pid=".$pid." AND ppassw='".$pwd."'");

  if ($do=='exit')
  {
         setcookie("pid","",time()+60000);
         setcookie("pwd","",time()+60000);
         setcookie("pagesort","",time()+60000);
         header('Location: ./index.php');
  }

  if ($do=='auth')
  {
       $plog = $_POST['login'];
       $ppwd = $_POST['passw'];
       $sql = "SELECT * FROM  pks_player WHERE plogin='".$plog."' AND ppassw='".$ppwd."'";
       $rez = mysqli_fetch_array(mysqli_query($connect,$sql));

       if ($rez['plogin']=="71000318")               // Белоногов И.Ю.
       {
         setcookie("pid",$rez['pid'],time()+600000);
         setcookie("pwd",$rez['ppassw'],time()+600000);
         header('Location: ./index.php?rand='.mt_rand(1000,9999) );
       }

       if (empty($rez))
       {
         header('Location: ./index.php?do=login&a=err');
       }
       /*
       else if ($rez['pstatus']!="1000")
       {
         header('Location: ./index.php?do=login&a=denied2');
       }
       /**/
       else
       {
         setcookie("pid",$rez['pid'],time()+600000);
         setcookie("pwd",$rez['ppassw'],time()+600000);
         header('Location: ./index.php');
       }

  }


  if (empty($Player) && $do!='login' && $do!='auth')
  {

    header('Location: ./index.php?do=login');
  }
  $pagesort = $_GET['pagesort']; if (empty($pagesort)) $pagesort = $_POST['pagesort'];
  if ($pagesort=="in")
  {
    setcookie("pagesort","in",time()+6000000);
    $pagesort = "in";
  }
  if ($pagesort=="out")
  {
    setcookie("pagesort","out",time()+6000000);
    $pagesort = "out";
  }
  if ($pagesort=="arc")
  {
    setcookie("pagesort","arc",time()+6000000);
    $pagesort = "arc";
  }


  include "include/header.php";




switch ($do)
{
  case "login":
  {
    include "include/login.php";
    break;
  }

  case "main":
  {
    include "include/main.php";
    break;
  }

  case "create":
  {
    include "include/create.php";
    break;
  }

  case "record":
  {
    include "include/record.php";
    break;
  }

  default:
  {
    include "include/main.php";
    break;
  }


}


  include("include/footer.php");
  echo $CONTENT;
?>