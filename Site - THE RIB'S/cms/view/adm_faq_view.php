<?php

  $id_faq = "";
  $pergunta = "";
  $resposta = "";

 ?>


<div class="conteudo">
    <div class="campo_inputs">

      <p class="titulo_nova_pergunta">Nova Pergunta</p>
      <form class="" action="router.php?controller=faq&modo=inserir" method="post">

        <div class="pergunta">

          <input name="txtPergunta" class="login_senha" type="text" maxlength="50" value="" placeholder="Pergunta" required/>
          <span class="bar"> </span>

        </div>

        <div class="resposta">

          <textarea placeholder="Digite a resposta" name="textResposta" class="caixa_resposta" rows="8" cols="80"></textarea>

        </div>

        <div class="botao">

          <button class="btn_salvar_pergunta" type="submit" name="btn_alterar" > Salvar </button>

        </div>

      </div>
    </form>

    <?php
      require_once("controller/faq_controller.php");

      $faq = new ControllerFaq();
      $result_set = $faq->MostrarFaq();

      $contador = 0;

      while($contador < count($result_set)){
     ?>


      <div class="perguntas_cadastradas">

        <p class="titulo_perguntas_cadastradas">Perguntas Cadastradas</p>

        <div class="campo_perguntas_cadastradas">

          <a href="router.php?controller=categoria&modo=excluir&id=<?php echo($result_set[$contador]->id_tipo_prato ) ?>">
            <div class="delete_pergunta">
              <img class="excluir" src="imagens/close-icon.png" alt="deletar" />
            </div>
          </a>

          <label class="pergunta_banco">Pergunta:</label>
          <label class="pergunta_vem_do_banco"><?php echo($result_set[$contador]->pergunta); ?></label>
          <br>
          <br>
          <label class="resposta_banco">Resposta :</label>
          <label class="resposta_vem_do_banco"><?php echo($result_set[$contador]->resposta); ?></label>


        </div>


      <?php
      $contador++ ;
      }

       ?>




    </div>







</div>
