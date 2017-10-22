<?php


  $action = "inserir";
  $ocorrencia = "";
  $lista_ocorrencia = "";
  $id_ocorrencia = "";


  if(isset($_GET['modo'])){
    if($_GET['modo'] == 'editarPeloID'){

      $id_ocorrencia = $ocorrencia->id_ocorrencia;
      $ocorrencia = $ocorrencia->ocorrencia;
      $action = "alterar&id=".$id_ocorrencia;


    }
  }


 ?>

<div class="conteudo">

  <form class="" action="router.php?controller=ocorrencia&modo=<?php echo($action); ?>" method="post">

    <div class="area_ocorrencia">

      <p class="titulo_nova_ocorencia">Nova Ocorrência</p>

      <div class="nome">
          <input name="txtOcorrencia" class="login_senha" placeholder="titulo" value="<?php echo($ocorrencia); ?>" type="text" />
          <span class="bar_nome"> </span>
      </div>

      <button class="btn_cadastrar" type="submit" name="btn_alterar" > Cadastrar </button>

    </div>

  </form>


  <div class="ocorrencias_cadastradas">

    <p class="titulo_ocorencia_cadastrada">Ocorrências Cadastradas</p>

    <?php

      require_once("controller/ocorrencia_controller.php");

      $lista_ocorrencia = new ControllerOcorrencia();
      $result_set = $lista_ocorrencia->MostarOcorrencias();

      $contador = 0;

      while($contador < count($result_set)){
    ?>




        <div class="campo_ocorrencias">


          <a href="router.php?controller=ocorrencia&modo=excluir&id=<?php echo($result_set[$contador]->id_ocorrencia ); ?>">
              <img class="excluir" src="imagens/close-icon.png" alt="deletar" />
          </a>

          <a href="router.php?controller=ocorrencia&modo=editarPeloID&id=<?php echo($result_set[$contador]->id_ocorrencia ) ?>">

            <label class="nome_ocorrencia"> Nome :</label>

            <label class="vem_do_banco" value="<?php echo($ocorrencia); ?>"> <?php echo($result_set[$contador]->ocorrencia); ?></label>

          </a>
        </div>



    <?php
      $contador++ ;
      }
     ?>

  </div>

</div>
