<?php

  /*
  Objetivo: Criação do Fale conosco e crud de filiais
  Data: 26/09/2017
  Autor: Marcelo Bruno
  Ultima Modificação: Hoje
  Obervações: Nada ainda
  Arquivos Relacionados: router.php e
                         views/contato.php
                        models/filial_class.php
  */


    class ControllerFilial{

        public function MostrarFiliais(){

            if(!isset($_GET['modo'])){
              require('model/filial_class.php');
            }


            $listaFilial_controller = new Filial();

            return $listaFilial_controller->ListarFiliais();
        }

        public function CadastrarFilial(){
          if($_SERVER['REQUEST_METHOD'] == 'POST'){

            $nome = $_POST['txtNomeFilial'];
            $telefone = $_POST['txtTelefoneFilial'];
            $cep = $_POST['txtCEPFilial'];
            $numero = $_POST['txtNumeroFilial'];
            $tipo = $_POST['tipo_filial'];

            $controller_filial = new Filial();

            $controller_filial->nome = $nome;
            $controller_filial->cep = $cep;
            $controller_filial->numero = $numero;
            $controller_filial->telefone = $telefone;
            $controller_filial->tipo_restaurante = $tipo;


            if($controller_filial->CadastrarFial($controller_filial)){
              header('location:adm_filiais.php?sucesso=1');
            }else{
              header('location:adm_filiais.php?sucesso=0');
            }

          }
        }

        public function ExcluirFilial(){
          require_once('model/filial_class.php');
          $controller_filial = new Filial();
          $controller_filial->id_restaurante = $_GET['id'];

          if($controller_filial->ExcluirFilial($controller_filial)){
            header('location:adm_filiais.php?sucessoExcluir=1');
          }else{
            header('location:adm_filiais.php?sucessoExcluir=0');
          }


        }

        public function BuscarFilial(){

          $filial_controller = new Filial();

          $filial_controller->id_restaurante = $_GET['id'];

          //$filial = new Filial();
          $filial = $filial_controller->BuscarFilial($filial_controller);

          require_once('adm_filiais.php');
        }

        public function AlterarFilial(){
          $id = $_GET['id'];
          if($_SERVER['REQUEST_METHOD'] == 'POST'){

              $nome = $_POST['txtNomeFilial'];
              $telefone = $_POST['txtTelefoneFilial'];
              $cep = $_POST['txtCEPFilial'];
              $numero = $_POST['txtNumeroFilial'];
              $tipo = $_POST['tipo_filial'];


              $filial_controller = new Filial();

              $filial_controller->nome = $nome;
              $filial_controller->telefone = $telefone;
              $filial_controller->cep = $cep;
              $filial_controller->numero = $numero;
              $filial_controller->tipo_restaurante = $tipo;
              $filial_controller->id_restaurante = $id;

              if($filial_controller->AlterarFilial($filial_controller)){
                header('location:adm_filiais.php?erroAlterar=0');
              }else{
                echo($filial_controller->AlterarFilial($filial_controller));
                header('location:adm_filiais.php?erroAlterar=1');
              }
          }
        }
    }

?>
