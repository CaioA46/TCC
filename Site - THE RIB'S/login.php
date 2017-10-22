<?php

  if(isset($_GET['modo'])){

    $modo = $_GET['modo'];
    $status = $_GET['status'];

    if($modo == 'cadastrar'){

      if($status == "1"){
          ?>
            <script type="text/javascript">
              alert("Parabéns!, Você foi cadastrado, agora faça o login a aproveite nossa plataforma.");
            </script>
          <?php
      }else if($status == "0"){
        ?>
        <script type="text/javascript">
          alert("Ops!, Deu ruim, verifique seus dados e tente novemente");
        </script>
        <?php
      }

    }elseif($modo == 'logar'){

      if($status == "1"){
          ?>
            <script type="text/javascript">
              alert("Parabéns!, Você foi logado.");
            </script>
          <?php
      }else if($status == "0"){
        ?>
        <script type="text/javascript">
          alert("Ops!, Deu ruim, verifique seus dados e tente novemente");
        </script>
        <?php
      }
    }

  }


    if(isset($_GET['erro'])){

        if($_GET['erro'] == 'senha'){
            ?>
                <script>
                    window.alert('Senhas não conferem.');
                </script>
            <?php
        }else if($_GET['erro'] == 'termos'){
            ?>
                <script>
                    window.alert('Aceite os termos para poder se cadastrar');
                </script>
            <?php
        }
    }

?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title> Login </title>
    <?php require_once('estilo/estilo.php'); ?>
    <?php require_once('estilo/estilo_login.php'); ?>
    <script type="text/javascript" src="js/js.js"></script>
    <script type="text/javascript">

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


        /**========== Suavização da ancora ==================*/
        $(document).ready(function() {
			function filterPath(string) {
					return string
					.replace(/^\//,'')
					.replace(/(index|default).[a-zA-Z]{3,4}$/,'')
					.replace(/\/$/,'');
				}
			$('a[href*=#]').each(function() {
				if ( filterPath(location.pathname) == filterPath(this.pathname)
				&& location.hostname == this.hostname
				&& this.hash.replace(/#/,'') ) {
					var $targetId = $(this.hash), $targetAnchor = $('[name=' + this.hash.slice(1) +']');
					var $target = $targetId.length ? $targetId : $targetAnchor.length ? $targetAnchor : false;
					if ($target) {
						var targetOffset = $target.offset().top;
						$(this).click(function() {
						$('html, body').animate({scrollTop: targetOffset},200);
						return false;
						});
					}
				}
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

      <?php require_once('view/login_view.php'); ?>

    </section>
    <footer>

        <?php require_once('view/footer.php');  ?>

    </footer>
  </body>
</html>
