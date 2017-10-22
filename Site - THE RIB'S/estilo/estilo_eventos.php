
<?php


    $corrgb;

    require_once('controller/cores_controller.php');

    $lista_cores = new ControllerCor();

    $rs = $lista_cores->ListarCor();
    $contador = 0;

    while($contador < count($rs)){

      $corrgb = $rs[$contador]->cor.";";


      $contador += 1;
    }


?>



<style media="screen">

@font-face {
    font-family: 'allerbold';
    src: url('fonts/Aller/aller_bd-webfont.woff2') format('woff2'),
         url('fonts/Aller/aller_bd-webfont.woff') format('woff');
    font-weight: normal;
    font-style: normal;

}

@font-face {
    font-family: 'allerbold_italic';
    src: url('fonts/Aller/aller_bdit-webfont.woff2') format('woff2'),
         url('fonts/Aller/aller_bdit-webfont.woff') format('woff');
    font-weight: normal;
    font-style: normal;

}

@font-face {
    font-family: 'alleritalic';
    src: url('fonts/Aller/aller_it-webfont.woff2') format('woff2'),
         url('fonts/Aller/aller_it-webfont.woff') format('woff');
    font-weight: normal;
    font-style: normal;

}

@font-face {
    font-family: 'aller_lightregular';
    src: url('fonts/Aller/aller_lt-webfont.woff2') format('woff2'),
         url('fonts/Aller/aller_lt-webfont.woff') format('woff');
    font-weight: normal;
    font-style: normal;

}

@font-face {
    font-family: 'aller_lightitalic';
    src: url('fonts/Aller/aller_ltit-webfont.woff2') format('woff2'),
         url('fonts/Aller/aller_ltit-webfont.woff') format('woff');
    font-weight: normal;
    font-style: normal;

}

@font-face {
    font-family: 'allerregular';
    src: url('fonts/Aller/aller_rg-webfont.woff2') format('woff2'),
         url('fonts/Aller/aller_rg-webfont.woff') format('woff');
    font-weight: normal;
    font-style: normal;

}

@font-face {
    font-family: 'aller_displayregular';
    src: url('fonts/Aller/allerdisplay-webfont.woff2') format('woff2'),
         url('fonts/Aller/allerdisplay-webfont.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


section{
  width: auto;
  height: 921px;

}

.eventos{
  width: 1900px;
  height: 500px;
  margin: auto;
}

.texto_eventos{
  width: 800px;
  height: 200px;
  margin-left: 100px;
  margin-top: 70px;
  float: left;

}

.textos{
  width: 100%;
  height: 200px;
  -webkit-box-shadow: -2px 4px 5px 1px rgba(212,205,212,1);
  -moz-box-shadow: -2px 4px 5px 1px rgba(212,205,212,1);
  box-shadow: -2px 4px 5px 1px rgba(212,205,212,1);

}

.titulo{
  font-size: 30px;
  font-family: aller_lightregular;
  font-weight: bold;
  margin-left: 15px;
  padding-top: 10px;
  color: <?php echo($corrgb); ?>;

}

.conteudo_texto{
  font-size: 20px;
  font-family: aller_lightregular;
  margin-left: 15px;


}

.botao_cadastrar{
  width: 100%;
  height: 200px;

}

.btn_reservar{
  width: 200px;
  height: 50px;
  margin-left: 80px;
  margin-top: 120px;
  border: 3px solid <?php echo($corrgb); ?>;
  outline: none;
  color: <?php echo($corrgb); ?>;
  background-color: #fff;
  font-size: 18px;
  font-family: aller_lightregular;
  float: left;

}

.btn_reservar:hover{
  background-color: <?php echo($corrgb); ?>;
  color: #fff;
  transition: 0.2s;

}

.imagem_grande_evento{
  width: 700px;
  height: 200px;
  margin-left: 100px;
  margin-top: 70px;
  float: left;

}

.imagem_grande_evento img{
  width: 500px;
  height: 400px;
  margin-left: 100px;
  margin-top: -10px;

}

.eventos_fotos_comentarios{
  width: 1900px;
  height: 330px;
  margin: auto;

}

.imagens_comentarios{
  width: 600px;
  height: 325px;
  background-color: #fff;
  margin-left: 70px;
  float: left;

}

.imagem_grande{
  width: 200px;
  height: 200px;
  background-color: red;
  margin-left: auto;
  margin-right: auto;
  margin-top: 5px;

}

.imagem_grande img{
  width: 200px;
  height: 200px;
}

.imagem_evento1{
  width: 147.5px;
  height: 100px;
  background-color: yellow;
  float: left;
  margin-top: 15px;
  margin-left: 4px;

}

.imagem_evento1 img{
  width: 147.5px;
  height: 100px;

}


.imagem_evento2{
  width: 147.5px;
  height: 100px;
  background-color: black;
  margin-top: 15px;
  float: left;
  margin-left: 1px;

}

.imagem_evento2 img{
  width: 147.5px;
  height: 100px;

}

.imagem_evento3{
  width: 147.5px;
  height: 100px;
  background-color: yellow;
  margin-top: 15px;
  float: left;
  margin-left: 1px;

}

.imagem_evento3 img{
  width: 147.5px;
  height: 100px;

}

.imagem_evento4{
  width: 147.5px;
  height: 100px;
  background-color: black;
  margin-top: 15px;
  float: left;
  margin-left: 1px;

}

.imagem_evento4 img{
  width: 147.5px;
  height: 100px;

}

.mais_texto_do_evento{
  width: 500px;
  height: 325px;
  margin-left: 20px;
  float: left;

}

.mais_texto{
  font-size: 20px;
  font-family: aller_lightregular;
  margin-left: 20px;
  margin-top: 60px;

}


.avaliacao{
  width: 600px;
  height: 325px;
  margin-left: 20px;
  float: left;


}

.texto_avaliacao{
  font-size: 20px;
  font-family: aller_lightregular;
  margin-left: 20px;
  margin-top: 10px;
  margin-right: 31px;

}


.imagem_usuario{
  width: 100px;
  height: 100px;
  margin-left: 490px;
  margin-top: 10px;
  border-radius: 50px;
  float: left;
  position: absolute;
  border: 3px solid #000;
  -webkit-box-shadow: -2px 4px 5px 1px rgba(212,205,212,1);
  -moz-box-shadow: -2px 4px 5px 1px rgba(212,205,212,1);
  box-shadow: -2px 4px 5px 1px rgba(212,205,212,1);

}

.imagem_usuario img{
  width: 100%;
  height: 100%;
  border-radius: 50px;
}

.comentario{
  width: 500px;
  height: 270px;
  margin-left: 50px;
  margin-top: 50px;
  float: left;
  -webkit-box-shadow: -2px 4px 5px 1px rgba(212,205,212,1);
  -moz-box-shadow: -2px 4px 5px 1px rgba(212,205,212,1);
  box-shadow: -2px 4px 5px 1px rgba(212,205,212,1);
  border: 3px solid #ebe6eb;
  float: left;
  -webkit-box-shadow: -2px 4px 5px 1px rgba(212,205,212,1);
  -moz-box-shadow: -2px 4px 5px 1px rgba(212,205,212,1);
  box-shadow: -2px 4px 5px 1px rgba(212,205,212,1);

}

.estrelas{
  width: 200px;
  height: 60px;
  margin-left: 260px;
  margin-top: 10px;

}

</style>
