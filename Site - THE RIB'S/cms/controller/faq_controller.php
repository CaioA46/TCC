<?php


/**
 *
 */
class ControllerFaq{


  public function InserirFaq(){
      require_once('model/faq_class.php');

      if($_SERVER['REQUEST_METHOD'] == 'POST'){

          $pergunta = $_POST['txtPergunta'];
          $resposta = $_POST['textResposta'];

          $faq_controller = new Faq();

          $faq_controller->pergunta = $pergunta;
          $faq_controller->resposta = $resposta;

          if($faq_controller->InserirFaq()){

            header('location:adm_faq.php?sucesso=1');
          }else{
            header('location:adm_faq.php?sucesso=0');

          }
        }

  }


  public function MostrarFaq(){
    require_once('model/faq_class.php');
    $faq = new Faq();
    return $faq->MostrarFaq();

  }








}







 ?>
