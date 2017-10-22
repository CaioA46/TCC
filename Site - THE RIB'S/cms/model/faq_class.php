<?php


/**
 *
 */
class Faq{

  public $id_faq;
  public $pergunta;
  public $resposta;



  function __construct(){
    require_once('model/db_class.php');

    $conexao = new Mysql_db();
    $conexao->conectar();

  }

  public function InserirFaq(){

    $sql = "insert into tbl_faq(pergunta,resposta)";
    $sql = $sql."values('".$this->pergunta."','".$this->resposta."')";

    if(mysql_query($sql)){
      return true;
    }else{
      return false;
    }


  }

  public function MostrarFaq(){

    $sql = "select * from tbl_faq";

    if(mysql_query($sql)){
      return true;
    }else{
      return false;
    }


  }





}




 ?>
