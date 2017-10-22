<?php
/*
Objetivo: Criação do CRUD de funcinários
Data: 26/09/2017
Autor: Marcelo Bruno
Ultima Modificação: Hoje
Obervações: Nada ainda
Arquivos Relacionados: router.php e
                       views/contato.php
                      models/filial_class.php
*/

  class Funcionario{

    public $id_funcionario;
    public $nome;
    public $celular;
    public $email;
    public $id_restaurante;
    public $id_funcao;
    public $senha;

    function __construct()
    {
      require_once('model/db_class.php');

      $conexao = new Mysql_db();
      $conexao->conectar();
    }

    public function Logar($funcionario){
      $sql = "select * from tbl_funcionario where id_funcionario = '".$funcionario->id_funcionario."' and ";
      $sql = $sql."senha = '".$funcionario->senha."'";

      $select = mysql_query($sql);

      if ($rs = mysql_fetch_array($select)) {
        $funcionario = new Funcionario();

        $funcionario->id_funcionario = $rs['id_funcionario'];
        $funcionario->nome = $rs['nome'];
        $funcionario->celular = $rs['celular'];
        $funcionario->email = $rs['email'];
        $funcionario->id_restaurante = $rs['id_restaurante'];
        $funcionario->id_funcao = $rs['id_funcao'];
        $funcionario->senha = $rs['senha'];

        return $funcionario;
      }else{
        return false;
      }
    }

  }

 ?>
