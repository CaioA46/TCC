
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
header{
    height: 0px;
}
section{
  width: auto;
  min-height: 2850px;
  margin-top: -130px;
}

#conteinner-home{
    width: 100%;
    height: 950px;
}

#conteinner-menu{
    width: 100%;
    height: 950px;
    clear: both;
    float: left;
}

#conteinner-mapa{
    width: 100%;
    height: 950px;
    background-color: bisque;
    float: left;
}

/*============ Formatação slider ==================*/


#slider-show{
  width: 100%;
  height: 950px;
}

#slider{
  width:100%;
  height:950px;
  overflow:hidden;
    z-index: 9;
}

#slider ul{
  float:right;
  width:100%;
  list-style-type:none;

}

#slider li{
  float:right;
  width:480px;
  height:950px;
  background-size:100% auto !important;
    padding-top: 320px;
    z-index:1;
}

#slider li.one{background:#069;}

#slider #prev, #slider #next{
  position:absolute;
  width:60px;
  height:60px;
  top:50%;
    border-radius: 30px;
  margin-top:-30px;
    margin-left: 15px;
    margin-right: 15px;
    text-decoration: none;
    font-size: 30px;
    font-family: aller_lightregular;
    text-align: center;
}

.marcador{
    margin-top: 12px;
}

#slider #next{

  right:0;
}

#slider #prev{
  left:10;
}


#prev img{
    width: 100%;
    height: 100%;
    transform: rotate(180deg);
}

#next img{
    width: 100%;
    height: 100%;
}

.row p{
  margin-top: 45px;
  color:#fff;
  font-size: 30px;
  font-family: aller_lightregular;
  text-shadow: 4px 4px 2px rgba(0, 0, 0, 1);
}

.row h1{
  font-family: allerbold ;
  color: <?php echo($corrgb); ?>;
  font-size:47px;
  margin-top:15px;
}

button{
    height: 70px;
    width: 200px;
  display:inline-block;
  padding:5px 8px;
  border:2px solid #fff;
  margin:0 5px;
  text-decoration:none;
  color:#fff;
  font-weight:bold;
    margin-top: 30px;
    font-family: aller_lightregular;
    font-size: 18px;
    background-color: rgba(0,0,0,0.2);
}

button:hover{
  background-color: #fff;
  color:<?php echo($corrgb); ?>;
   transition: 0.2s ease all;
}

#indicador{
    width: 50px;
    height: 48px;
    position: absolute;
    margin-left: 49%;
    margin-top: 40%;
    z-index: 10;
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: 150px;
    padding-top: 2px;
}

#indicador img{
    width: 50px;
    height: 50px;
}


/*================= formatação mennu ===========================*/
#coisas-conteinner-menu{
    width: 1500px;
    height: 980px;
    margin: auto;
    padding: auto;
}

#menu{
    width: 1400px;
    height: 680px;
    padding-top: 10px;
    padding-left: 100px;
}

#mini-galeria{
    width: 1400px;
    height: 300px;
}
/* Formatação galeria */

#content {
    margin: auto;
    width: 1350px;
    height: 270px;
    background-color: white;
    margin-left: 85px;

}

#carrossel {
    float: left;
    width: 1380px;
    height: 250px;
    overflow: hidden;
}

#carrossel ul li {
    width: 230px;
    height: 230px !important;
    float: left;
    padding: 5px 5px 5px 5px;
    margin: 0 2px;
}

#carrossel ul li img{
  width: 230;
  height: 230px !important;
  margin: 0 2px;
}

#menu-carrossel {
    float: left;
    width: 40px;
    height:250px;
    font-size: 20px;
    line-height: 250px;
    border:solid 1px transparent;
    text-align: center;
}
#menu-carrossel a img{
    width: 35px;
}


/* formatação dos menus */

#menu-filiais{
    width: 550px;
    height: 250px;
    background-image: url('imagens/back-filial.png');
    clear: both;
    float: left;
    margin-bottom:15px;
    margin-right: 15px;
}

.imagem-menu-filiais{
    height: 190px;.
}

.animation-menu{
    width: 100%;
    height: 60px;
    background-color: rgba(0,0,0,0.7);
    color:#fff;
    font-family: allerregular;
    font-size: 30px;
}

.titulo-animation{
  padding: 10px;
}

.descricao-animation{
    font-size: 24px;
    padding: 10px;
    margin-top: 15px;
    display: none;
}

#menu-filiais:hover .animation-menu{
  height: 100%;
  margin-top: -190px;
  transition: 0.2s ease all;
  z-index: 1;

}

.animation-menu:hover .descricao-animation{
  display: block;
}

#menu-cadastro{
    width: 350px;
    height: 250px;
    background-image: url('imagens/back-cadastro.png');
    float: left;
    margin-bottom: 15px;
    margin-right: 15px;
}

#menu-cadastro:hover .animation-menu{
  height: 100%;
  margin-top: -190px;
  transition: 0.2s ease all;
  z-index: 1;

}

#menu-contato{
    width: 350px;
    height: 250px;
    background-image: url('imagens/back-contato.png');
    margin-bottom: 15px;
    float: left;
}

#menu-contato:hover .animation-menu{
  height: 100%;
  margin-top: -190px;
  transition: 0.2s ease all;
  z-index: 1;

}

#menu-cardapio{
    width: 390px;
    height: 395px;
    float: left;
    background-image: url('imagens/back-cardapio.png');
    margin-right: 15px;
}

.imagem-menu-filiais-cardapio{
    height: 335px;.
}

.animation-menu-cardapio{
    width: 100%;
    height: 60px;
    background-color: rgba(0,0,0,0.7);
    color:#fff;
    font-family: allerregular;
    font-size: 30px;
}

.titulo-animation-cardapio{
  padding: 10px;
}

.descricao-animation-cardapio{
    font-size: 24px;
    padding: 10px;
    margin-top: 15px;
    display: none;
}

.animation-menu-cardapio:hover .descricao-animation-cardapio{
  display: block;
}

#menu-cardapio:hover .animation-menu-cardapio {
  height: 100%;
  margin-top: -335px;
  transition: 0.2s ease all;
}

#menu-sobre{
    width: 430px;
    height: 190px;
    background-image: url('imagens/back-sobre.png');
    float: left;
    margin-right: 15px;
    margin-bottom: 15px;
}

.imagem-menu-filiais-sobre{
    height: 130px;
}

.animation-menu-sobre{
    width: 100%;
    height: 60px;
    background-color: rgba(0,0,0,0.7);
    color:#fff;
    font-family: allerregular;
    font-size: 30px;
}

.titulo-animation-sobre{
  padding: 10px;
}

.descricao-animation-sobre{
    font-size: 24px;
    padding: 10px;
    margin-top: 15px;
    display: none;
}

.animation-menu-sobre:hover .descricao-animation-sobre{
  display: block;
}

#menu-sobre:hover .animation-menu-sobre{
  margin-top: -130px;
  height: 190px;
  transition: 0.2s ease all;
}

#menu-reservas{
    width: 430px;
    height: 190px;
    background-image: url('imagens/back-reservas.png');
    float: left;
    margin-bottom: 15px;
}

#menu-reservas:hover .animation-menu-sobre{
  margin-top: -130px;
  height: 190px;
  transition: 0.2s ease all;
}

#menu-galeria{
    width: 430px;
    height: 190px;
    background-image: url('imagens/back-galeria.png');
    float: left;
    margin-right: 15px;
}

#menu-galeria:hover .animation-menu-sobre{
  margin-top: -130px;
  height: 190px;
  transition: 0.2s ease all;
}

#menu-eventos{
    width: 430px;
    height: 190px;
    background-image: url('imagens/back-eventos.png');
    float: left;
    margin-right: 15px;
}

#menu-eventos:hover .animation-menu-sobre{
  margin-top: -130px;
  height: 190px;
  transition: 0.2s ease all;
}


iframe{
    width: 100%;
    height: 950px;
}
</style>
