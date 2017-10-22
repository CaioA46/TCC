<?php
/*
  Objetivo: Manipulação dos sliders
  Data de criação: 17/10/2017
  Última alteração: -
  Feito por: Paulo Henrique

  Arquivos Relacionados:
    router.php
    model/slider_class.php
*/

class ControllerSlider{
  public function novoSlider(){
    $slider = new Slider();
    $slider->id_slider = $_GET['idslider'];
    $slider->novoSlider();
  }

  public function excluirSlider(){
    $slider = new Slider();
    $slider->id_slider = $_GET['idslider'];
    $slider->excluirSlider();
  }

  public function updateSlider(){
    if($_SERVER['REQUEST_METHOD']=='POST'){
      $slider = new Slider();
      $slider->id_slider = $_GET['idslider'];
      $slider->updateSlider();
    }
  }
}


 ?>
