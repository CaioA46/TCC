
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
/*
	CSS da página de reservas
	Feito por: Larissa Oliveira
	Data:11/09/2017
 */

 #principal{
    height: 690px;
    background-color: #000;
    margin-top: 20px;
 }

#slide{
		width:100%;
		height:690px;
    margin-top: -20px;
}

#slide img{
  width: 100%;
  height: 680px;
}

#campos_reserva{
	z-index:999;
		width:900px;
		height:200px;
		padding:20px;
	margin:-500px auto 0px auto;
	position:relative;
		border:solid 1px transparent;
}
#tbl_campos{
		width:800px;
		height:200px;
		padding:25px;
		padding-left:40px;
		padding-right:40px;
		border:solid 3px #fff;
}
#tbl_campos tr td{
		font-size: 20px;
		border:solid 1px transparent;
}
#tr_maior{
		width:500px;
}
#tr_menor{
		max-width:150px;
}

td{
  font-family: allerregular;
  color: #fff;
}

.botao{
		width:150px;
		height:20px;
		float:right;
		cursor:pointer;
		background-color: white;
		padding-bottom: 30px !important;
		padding-top: 5px !important;
		border-radius: 5px;
		border:solid 1px transparent !important;
		border-bottom:solid 1px transparent !important;
		box-shadow: 2px 2px 15px #505050;
}
select{
		margin:0;
		padding:0;
		width:auto;
		font-size: 18px;
		font-family: aller_lightregular;
}

button{
  background-color: rgba(0,0,0,0.3);
  border: 3px solid #fff;
  color: #fff;
  font-family: allerregular;
  float:right;
  width: 150px;
  height: 40px;

}

button:hover{
  background-color: #fff;
  color:<?php echo($corrgb); ?>;
  transition: 0.2s ease all;

}

.lightbox{
  color:#fff;
  font-size: 16px;
}


</style>
