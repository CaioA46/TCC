
<div id="conteinner-header">
  <?php

    require_once('cms/controller/cabecalho_controller.php');

    $cabecalho = new ControllerCabecalho();

    $rs = $cabecalho->MostrarCabecalho();
    $contador = 0;
    while($contador < count($rs)){

        $foto = $rs[$contador]->foto;
        $texto = $rs[$contador]->texto_boas_vindas;
        $usuario = $rs[$contador]->foto_usuario;

  ?>
    <a href="index.php">
      <div id="img-logo">
          <img src="fotos/<?php echo($foto); ?>" alt="logo" />
      </div>
    </a>

<nav id="menu-desktop">
<ul>
    <a href="index.php"> <li> Home </li> </a>
    <a href="destaque.php"> <li> Destaque </li> </a>
    <a href="galeria.php" > <li> Galeria </li> </a>
    <a href="eventos.php"> <li> Eventos </li> </a>
    <a href="cardapio.php"> <li> Cardápio </li> </a>
    <a href="contato.php" > <li> Contato </li> </a>
    <a href="sobre.php"> <li> Sobre </li> </a>
  <li> Filiais </li>
</ul>
</nav>


    <div id="conteinner-login">
        <div id="entre">
            <h1> <?php echo($texto); ?> </h1>

            <a href="login.php"> <span class="text" > Entre </span></a><br>
            <a href="login.php"> <span class="text" > Cadastre-se </span></a>


        </div>
        <div id="user">
            <img src="fotos/<?php echo($usuario); ?>" alt="Usuario" />
        </div>
    </div>

  <?php
      $contador += 1;
    }
   ?>
</div>
