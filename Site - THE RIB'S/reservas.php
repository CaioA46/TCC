<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title> Página Inicial </title>
    <?php require_once('estilo/estilo.php'); ?>
    <?php require_once('estilo/estilo_reservas.php'); ?>
  	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
    <?php require_once('js/javascript.js'); ?>

    </script>
  </head>
  <body>
    <header>
        <?php require_once('view/redes-sociais.php'); ?>
        <?php require_once('view/header.php'); ?>
    </header>
    <section>
        <?php require_once('view/reservas_view.php'); ?>
    </section>
    <footer>
      <?php require_once('view/footer.php'); ?>
    </footer>
  </body>
</html>
