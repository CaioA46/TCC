      <link rel = "stylesheet" type = "text/css" href = "estilo/estilo_galeria.css">

      <?php

      require_once('cms/controller/galeria_controller.php');

      $lista_titulo = new ControllerGaleria();
      $result_set = $lista_titulo->listarTitulo();
      $contador = 0;

      while($contador < count($rs)){

          $titulo = $rs[$contador]->titulo;
          $descricao = $rs[$contador]->descricao;


       ?>

			<div class = "conteudo">
				<div id = "texto">

					<?php echo($titulo);  ?>

					<p>

				  <?php echo($descricao);?>

					</p>
				</div>
        <?php

        $contador += 1;
          }

         ?>

				<div id="galeria">
					<div class="conteudoSuperior">
				        <div class="texto"> Sede </div>
						  <div class="contImg1">
                             <img src="imagens/img12.1.jpg">
                          </div>
                          <div class="contImg2">
                            <img src="imagens/chef2.jpg">
                          </div>
                          <div class="contImg2">
                            <img src="imagens/img7.jpg">
                          </div>
					</div>
					<div class="conteudoSuperior">
					<div class="texto"> Filial 1 </div>
					   <div class="contImg1">
                             <img src="imagens/img17.jpg">
                       </div>
                       <div class="contImg02">
                            <img src="imagens/img3.jpg">
                       </div>

                       <div class="contImg3">
                            <img src="imagens/img16.jpg">
                       </div>
                       <div class="contImg3">
                            <img src="imagens/chef3.jpg">
                       </div>


					</div>
					<div class="conteudoSuperior">
					<div class="texto"> Filial 2 </div>

					   <div class="contImg4">
                             <img src="imagens/img1.1.jpg">
                       </div>

                        <div class="contImg4">
                              <img src="imagens/img13.1.jpg">
                        </div>

					</div>
					<div class="conteudoSuperior">
					<div class="texto"> Filial 3 </div>
					      <div class="contImg1">
                             <img src="imagens/img14.jpg">
                          </div>

                          <div class="contImg2">
                                <img src="imagens/chef1.jpg">
                          </div>

                          <div class="contImg2">
                                <img src="imagens/img15.jpg">
                          </div>

					</div>
				</div>
				<div id="content_carrossel">

                    <div id="content">
						<div id="menu-carrossel">
  							<a href="#" class="prev" title="Anterior">
                                <img src="imagens/seta1.png" />
                            </a>
  						</div>
  						<div id="carrossel">
  							<ul>
  								<li>
  									<img src="imagens/costela_assada.jpg"/>
  								</li>
  								<li>
  									<img src="imagens/testeimg.jpg"/>
  								</li>
  								<li>
  									<img src="imagens/costeletas_grelhadas.jpg"/>
  								</li>
                                  <li>
  									<img src="imagens/costelinha_de_porco.jpg"/>
  								</li>
  								<li>
  									<img src="imagens/img3.jpg"/>
  								</li>
  								<li>
  									<img src="imagens/img1.jpg"/>
  								</li>
  								<li>
  									<img src="imagens/img2.jpg"/>
  								</li>
  								<li>
  									<img src="imagens/img5.jpg"/>
  								</li>
  							</ul>
  						</div>
  						<div id="menu-carrossel">
  							<a href="#" class="next" title="Próximo">
                                <img src="imagens/seta2.png" />
                            </a>
  						</div>
  					</div>

				</div>
				<div class="contInferior">
                    <div class="conteudo1">
                        <img src="imagens/img13.jpg"/>
                    </div>
                    <div class="conteudo2">
                        <img src="imagens/steakhouse1.jpg">
                    </div>
                    <div class="conteudo2">
                        <img src="imagens/ribs2.jpg">
                    </div>

				</div>
				<div class="contInferior">
				    <div id="contDivisao2">
                        <img src="imagens/outback.jpg">
                    </div>
                    <div id="cont2">
                        <img src="imagens/img18.jpg">
                    </div>
				</div>
			</div>
