


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

/*** CSS da página cardapio ***/
/**
    Feito por: Larissa
    Data: 25/09/2017
**/

body{
    overflow-x: hidden;
    margin: 0;
    padding: 0;
}
#principal{
    width: 100%;
    height:2800px;
    border: solid 0px transparent;
}
.titulo_cardapio{
    width:1295px;
    height:40px;
    font-size: 30px;
    margin-top: 80px;
    margin-left: auto;
    margin-right: auto;
    padding-top: 5px;
    border: solid 1px white;
    font-family: allerbold;
    color: <?php echo($corrgb); ?>;
    text-align: center;
}

/***** Imagens de alguns dos pratos *****/
#content_pratos{
    width: 100%;
    height:900px;
    padding-top:30px;
    border-bottom: 1px solid <?php echo($corrgb); ?>;
}

.divisao_imagens{
    width: 1000px;
    height:343px;
    margin-left:auto;
    margin-right: auto;
    margin-bottom: 10px;
    border: solid 1px transparent;
}
.nova{
    display: none;
}

.img_pratos{
    width: 304px;
    height:305px;
    float: left;
    margin: 20px 10px 10px 14px;
    border: solid 1px black;
}

.img_pratos_detalhes img, .img_pratos img{
    width: 290px;
    height:290px;
    margin-top: 5px;
    margin-left: 5px;
    float: left;
    border: solid 1px black;

}
div.detalhes_prato{
    float: left;
    width: 280px;
    height:280px;
    padding: 5px;
    margin-top: 5px;
    margin-left: 5px;
    border: solid 1px black;
}

button{
  border:2px solid #fff;
}

button:hover{
  background-color: #fff;
  outline: none;
  transition: 0.2 ease all;
}

/****** Mostrar um prato de cada categoria ******/
#content_prato_categoria{
    width: 100%;
    height:840px;
    background-image: url(imagens/steakhouse-00.jpg);
    background-position: no-repeat;
    background-attachment: fixed;
    background-size: 100% 100%;
    border: solid 1px transparent;
}
.titulo_categoria_prato{
    height:60px;
  width:800px;
    margin:auto;
  font-size:40px;
  text-align:center;
    margin-bottom:30px;
    border-bottom:solid 1px black;
}
#slide_categoria-pratos{
    width: 1400px;
    height:890px;
    margin: auto;
    border:solid 1px transparent;
}

/* Slide para mostrar o cardápio */
.w3-content{
  float:left;
  width:1450px;
  height:750px;
  margin-top:5px;
  margin-left:auto;
  margin-right:auto;
  margin-bottom:5px;
    background-color: white;
  border:solid 1px transparent;
}
.w3-button{
  float:left;
  height:70px;
  width:55px;
    padding:5px;
  margin-top:350px;
  color:black;
  position:absolute;
  background-color:rgba(255,255,255, 0.5);
  outline: none;
}
.w3-button img{
    width:50px;
}
.w3-button:hover{
  transition:0.5s;
  color:white;
  cursor: pointer;
  outline: none;
}
.w3_content_imagem{
  margin-left:auto;
  margin-right:auto;
  width:500px;
  height:300px;
    border: solid 1px black;
}
.w3_content_imagem img{
  width:500px;
  height:300px;
}
.w3_titulo{
    width: 700px;
    height:40px;
    padding-top: 5px;
    font-size: 30px;
    text-align: center;
    margin-left: auto;
    margin-right: auto;
    margin-top: 20px;
    margin-bottom: 15px;
    border: solid 1px transparent;
}
.w3_content_detalhes{
    width: 1200px;
    height: 295;
    font-size: 25px;
    margin-left:auto;
  margin-right:auto;
    padding-left:5px;
    padding-right: 5px;
    border: solid 1px transparent;
}
.w3_descricao_prato{
    width: 450px;
    height:270px;
    float:left;
    text-align: justify;
    border:solid 1px transparent;
}
.w3_ingredientes{
    width:380px;
    height:270px;
    float:left;
    margin-left: 30px;
    margin-right: 10px;
    border:solid 1px transparent;
}
.w3_avaliacao{
    width:320px;
    height:270px;
    float:left;
    border:solid 1px transparent;
}
/*
Avaliação do prato
*/
table.avaliar_prato{
    width:290px;
    height:70px;
    margin-top: 5px;
    border:solid 1px transparent;
}
.avaliar_prato tr td{
    padding:2px;

}
.avaliar_prato tr td img{
    width:55px;
    height:auto;
}

.apagada {
  background-image: url('../imagens/estrela-prata.png');
  width: 55px;
  height: 32px;
  cursor: pointer;
}

.destaque {
  background-image: url('../imagens/estrela.png');
  width: 55px;
  height: 32px;
  background-size: 100% 100%;
  cursor: pointer;
}


/************ Todas as categorias de pratos ************/
#content_categorias{
    width: 100%;
    height:900px;
    border-top: 1px solid <?php echo($corrgb); ?>;
}

.titulo_categorias{
    font-size: 35px;
    width:1480px;
    margin-top: 20px;
    margin-left: auto;
    margin-right: auto;
    font-family: allerregular;
    color: <?php echo($corrgb); ?>;
    text-align: center;
}

.detalhes_prato_carrossel{
    width:235px;
    font-size: 25px;
    min-height: 140px;
    text-align: center;
    font-family: aller_lightregular;
}

/*** Primeiro slide ***/
.content{
    margin: 0 auto;
    width: 1480px;
    height: 340px;
    padding-top:20px;
    padding-bottom:5px;
    background-color: white;
}

.carrossel{
    float: left;
    width: 1380px;
    height: 340px;
    overflow: hidden;
    border: solid 1px transparent;
}

.carrossel ul li{
    width: 230px;
    height: 300px !important;
    float: left;
    padding-left: 20px;
    padding-top: 20px;
    padding-right: 20px;
    margin: 0 2px;
    list-style: none;
    background-color: white;
    border: solid 1px black;
}

.carrossel ul li img{
  width: 235px;
  height: 150px !important;
}

.menu-carrossel {
    float: left;
    width: 40px;
    height:340px;
    font-size: 20px;
    line-height: 350px;
    border:solid 1px transparent;
    text-align: center;
}
.menu-carrossel a img{
    width: 35px;
}

</style>
