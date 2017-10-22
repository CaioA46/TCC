

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
p{
    margin-top: 10px;
}

#texto{
    width:100%;
    font-family:alleritalic;
    text-align: center;
	font-size:25px;
    padding-bottom:20px;
	border:solid 1px transparent;
}

.conteudo{
    width:1400px;
    height:2500px;
    margin-right:auto;
    margin-left: auto;
	border:solid 1px transparent;
}
#galeria{
    width:1200px;
    height:950px;
	padding:30px;
    margin-right:auto;
    margin-left: auto;
    border: solid 1px transparent;
}

.conteudoSuperior{
    width:520px;
    height:450px;
    float:left;
    margin:30px 30px 0px 30px;
    border:solid 1px transparent;
}
.texto{
    height: 30px;
    font-size: 25px;
}

.contImg1{
    width: 220px;
    height: 400px;
    border:solid 1px #C0C0C0;
    margin-left: 10px;
    float: left;
}
.contImg1 img{
    width: 220px;
    height: 400px;
}

.contImg2{
    width: 250px;
    height: 196px;
    border:solid 1px #C0C0C0;
    margin-left: 10px;
    float:left;
    margin-bottom: 5px;
}
.contImg2 img{
    width: 250px;
    height: 196px;
}
    
.contImg02{
    width: 250px;
    height: 230px;
    border:solid 1px #C0C0C0;
    margin-left: 10px;
    float:left;
}
.contImg02 img{
    width: 250px;
    height: 230px;
}
    
.contImg3{
    width: 120px;
    height: 150px;
    border:solid 1px #C0C0C0;
    margin-left: 10px;
    margin-top: 15px;
    float:left;
}
.contImg3 img{
    width: 120px;
    height: 150px;
}

.contImg4{
    width: 240px;
    height: 410px;
    border:solid 1px grey;
    float: left;
    margin-left: 10px;
}
.contImg4 img{
    width: 240px;
    height: 410px;
}

    
/* Inicio do carrossel */
#content_carrossel{
    width:100%;
    height:300px;
    margin-top:30px;
    margin-bottom:50px;
}


#content {
    margin: 0 auto;
    width: 1350px;
    height: 300px;
    background-color: white;
}

#carrossel {
    float: left;
    width: 1370px;
    height: 295px;
    padding-right: 8px;
    overflow: hidden;
    border: solid 1px black;
}

#carrossel ul li {
    width: 230px;
    height: 230px !important;
    float: left;
    padding: 20px 5px 10px 5px;
    margin: 0 2px;
}

#carrossel ul li img{
    width: 235px !important;
    height: 240px !important;
    float: left;
    margin: 0 2px;
}

#menu-carrossel {
    float: left;
    width: 40px;
    height:300px;
    font-size: 20px;
    line-height: 280px;
    border:solid 1px transparent;
    text-align: center;
}
#menu-carrossel a img{
    width: 35px;
}


/* Fim da formatação do carrossel */
.contInferior{
    width:1260px;
    height:400px;
    margin:auto;
    border:solid 1px transparent;
}

.conteudo1{
    width: 600px;
    height: 330px;
    border:solid 1px #C0C0C0;
    margin-left: 7px;
    margin-top: 30px;
    float: left;
}
.conteudo1 img{
    width: 600px;
    height: 330px;
}

.conteudo2{
    width: 270px;
    height: 330px;
    border:solid 1px #C0C0C0;
    margin-left: 40px;
    margin-top: 30px;
    float: left;
}
.conteudo2 img{
    width: 270px;
    height: 330px;
}

#contDivisao2{
    width: 915px;
    height: 380px;
    border:solid 1px #C0C0C0;
    margin-left: 5px;
    margin-top: 10px;
    float: left;
}
#contDivisao2 img{
    width: 915px;
    height: 380px;
}

#cont2{
    width: 270px;
    height: 380px;
    margin-left: 40px;
    margin-top: 10px;
    border:solid 1px #C0C0C0;
    float: left;
}
#cont2 img{
    width: 270px;
    height: 380px;
}


</style>
