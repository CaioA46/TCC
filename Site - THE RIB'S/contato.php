<?php

  if(isset($_GET['sucesso'])){

      $sucesso = $_GET['sucesso'];

      if($sucesso == "1"){
        ?>
        <script type="text/javascript">
          window.alert("Muito Obrigado por entrar em contato! retornaremos em breve.");
        </script>
        <?php
      }else{
        ?>
        <script type="text/javascript">
          window.alert("Ops!, deu um gato no envio do seu contato, tente novamente ou pegue nosso contato no rodapé e nos ligue =)");
        </script>
        <?php
      }
  }

?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title> Página Inicial </title>
    <?php require_once('estilo/estilo.php'); ?>
    <?php require_once('estilo/estilo_contato.php'); ?>
  	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
  	<script type="text/javascript">

    /*======== script para abrir o formulário de pesqusa*/
  		$(document).ready(function(){
  			$(".pesquisa-form").hide();
  			$("#pesquisa").click(function(){
  				$(this).toggleClass("active").next().slideToggle("slow");
  				return false;
  			});

  			$("#close-pesquisa").click(function(){
  				$(".pesquisa-form").hide();
  			});
  		});

      /*===== script para fechar o formulário de pesquisa =======*/
      $(document).ready(function() {
        $('input').blur(function() {
          if ($(this).val())
            $(this).addClass('used');
          else
            $(this).removeClass('used');
        });
      });

  	</script>
  </head>
  <body>
    <header>
         <?php require_once('view/redes-sociais.php') ?>
         <?php require_once('view/header.php'); ?>
    </header>
    <section>
        <?php require_once('view/contato.php') ?>
    </section>
    <footer>
      <?php require_once('view/footer.php'); ?>
    </footer>
  </body>
</html>
