<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title> Cardápio </title>
    <?php require_once('estilo/estilo.php'); ?>
    <?php require_once('estilo/estilo_cardapio.php'); ?>
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
        <?php
            require_once('view/redes-sociais.php');
            require_once('view/header.php'); ?>

    </header>
    <section>
        <?php

            require_once('view/cardapio.php');

        ?>
    </section>
    <footer>
      <?php require_once('view/footer.php'); ?>
    </footer>
  </body>
</html>
