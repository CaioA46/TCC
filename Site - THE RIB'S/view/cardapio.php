<div id="principal">
    <div id="content_pratos">
        <div class="titulo_cardapio">
            Nossas Categorias
        </div>

        <div class="divisao_imagens">
            <div class="img_pratos">

                <img src="imagens/img1.jpg" alt="prato">

            </div>
            <div class="img_pratos">

                <img src="imagens/img2.jpg" alt="prato">

            </div>
            <div class="img_pratos">

                <img src="imagens/img3.jpg" alt="prato">

            </div>

        </div>
        <div class="divisao_imagens">
            <div class="img_pratos">

                <img src="imagens/img1.jpg" alt="prato">

            </div>
            <div class="img_pratos">

                <img src="imagens/img2.jpg" alt="prato">

            </div>
            <div class="img_pratos">

                <img src="imagens/img3.jpg" alt="prato">

            </div>

        </div>
    </div>
    <div id="content_prato_categoria">

		<!-- Exibir através do slide um prato de cada categoria -->
		<div id="slide_categoria-pratos">

				<!-- Começo dos Slides-->
            <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">
                <img src="imagens/seta1.png"/>
            </button>
            <div class="w3-content w3-display-container">
				<div class="mySlides">
                    <div class="titulo_categoria_prato">
                        Steaks
                    </div>
                    <div class="w3_content_imagem">
                        <img src="imagens/img9.jpg">
                    </div>
                    <div class="w3_titulo">
                        ROCKHAMPTON RIBEYE

                    </div>
                    <div class="w3_content_detalhes">
                        <div class="w3_descricao_prato">
                            325g da parte mais gostosa da rib bovina, com o bold flavour inconfundível da nossa mistura secreta de temperos. Na chapa, com tempero tradicional, ou em chama aberta, com o tempero Chargrill condimentado com toque de café.
                        </div>
                        <div class="w3_ingredientes">
                            <p>Ingredientes:</p>
                            O prato é composto por carne bovina
                        </div>
                        <div class="w3_avaliacao">
                            <p> Avalie este prato!</p>
                            <table class="avaliar_prato">
                                <tr>
                                    <td><img src="imagens/estrela.png"> </td>
                                    <td><img src="imagens/estrela.png"> </td>
                                    <td><img src="imagens/estrela.png"> </td>
                                    <td><img src="imagens/estrela.png"> </td>
                                    <td><img src="imagens/estrela.png"> </td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </div>
                <div class="mySlides">
                    <div class="titulo_categoria_prato">
                        Bebidas
                    </div>
                    <div class="w3_content_imagem">
                        <img src="imagens/img10.jpg">
                    </div>
                    <div class="w3_titulo">
                        ICED TEAS
                    </div>
                    <div class="w3_content_detalhes">
                        <div class="w3_descricao_prato">
                            Bebida sem alcool
                        </div>
                        <div class="w3_ingredientes">
                            <p>Ingredientes:</p>
                            Limão, Pêssego e Cranberry
                        </div>
                        <div class="w3_avaliacao">
                            <p> Avalie este prato!</p>
                            <table class="avaliar_prato">
                                <tr>
                                    <td><img src="imagens/estrela.png"> </td>
                                    <td><img src="imagens/estrela.png"> </td>
                                    <td><img src="imagens/estrela.png"> </td>
                                    <td><img src="imagens/estrela.png"> </td>
                                    <td><img src="imagens/estrela.png"> </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="mySlides">
                    <div class="titulo_categoria_prato">
                        Lunch
                    </div>
                    <div class="w3_content_imagem">
                        <img src="imagens/img8.jpg">
                    </div>
                    <div class="w3_titulo">
                        SALADA CAESAR

                    </div>
                    <div class="w3_content_detalhes">
                        <div class="w3_descricao_prato">
                            A clássica salada Caesar, servida em todas as nossas filais incrivelmente saborosa.
                        </div>
                        <div class="w3_ingredientes">
                            <p>Ingredientes:</p>
                            <p> -Alface</p>
                            <p> -Filés de anchovas</p>
                            <p> -Maionese</p>
                            <p> -Suco de limão</p>

                        </div>
                        <div class="w3_avaliacao">
                            <p> Avalie este prato!</p>
                            <table class="avaliar_prato">
                                <tr>
                                    <td><img src="imagens/estrela.png"> </td>
                                    <td><img src="imagens/estrela.png"> </td>
                                    <td><img src="imagens/estrela.png"> </td>
                                    <td><img src="imagens/estrela.png"> </td>
                                    <td><img src="imagens/estrela.png"> </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>


            </div>
            <button class="w3-button w3-black w3-display-right" style="margin-left:-55px;" onclick="plusDivs(1)">
                <img src="imagens/seta2.png"/>
            </button>
            <script>/* Slide manual */
				var slideIndex = 1;
				showDivs(slideIndex);

				function plusDivs(n) {
				    showDivs(slideIndex += n);
				}

				function showDivs(n) {
				var i;
				var x = document.getElementsByClassName("mySlides");
				if (n > x.length) {slideIndex = 1}
				if (n < 1) {slideIndex = x.length}
                    for (i = 0; i < x.length; i++) {
                        x[i].style.display = "none";
                    }
				    x[slideIndex-1].style.display = "block";
				}
            </script>

		</div>
    </div>
    <div id="content_categorias">

        <!--_____________________________________-->
        <!--_______*´' Primeiro slide '`*_______ -->

        <div class="titulo_categorias">
            Frangos e peixes
        </div>
        <div class="content">
            <div class="menu-carrossel">
				<a href="#" class="prev" id="prev1" title="Anterior">
                    <img src="imagens/seta1.png" />
                </a>
            </div>
            <div class="carrossel" id="carrossel1">
				<ul>
					<li>
						<img src="imagens/img1.jpg"/>
              <div class="detalhes_prato_carrossel">
                  Prato exemplo la la la na na na
              </div>
					</li>
					<li>
						<img src="imagens/img2.jpg"/>
                        <div class="detalhes_prato_carrossel">
                            Prato exemplo
                        </div>
					</li>
					<li>
						<img src="imagens/img3.jpg"/>
                        <div class="detalhes_prato_carrossel">
                            Prato exemplo
                        </div>
					</li>
					<li>
						<img src="imagens/img4.jpg"/>
                        <div class="detalhes_prato_carrossel">
                            Prato exemplo
                        </div>
					</li>
                    <li>
						<img src="imagens/img5.jpg"/>
                        <div class="detalhes_prato_carrossel">
                            Prato exemplo
                        </div>
					</li>
				</ul>
            </div>
            <div class="menu-carrossel">
				<a href="#" class="next" id="next1" title="Próximo">
                    <img src="imagens/seta2.png" />
                </a>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jcarousellite.js"></script>
        <script>
            $(function() {
				$("#carrossel1"). jCarouselLite({
                    btnPrev: '#prev1',
                    btnNext: '#next1',
                    visible: 5
				})
            })
        </script>

        <!--___________________________________ -->
        <!--_______*´' Segundo slide '`*_______ -->

        <div class="titulo_categorias">
            Burgues e Sandwiches
        </div>
        <div class="content">
            <div class="menu-carrossel">
				<a href="#" class="prev" id="prev2" title="Anterior">
                    <img src="imagens/seta1.png" />
                </a>
            </div>
            <div class="carrossel" id="carrossel2">
				<ul>
					<li>
						<img src="imagens/img4.jpg"/>
                        <div class="detalhes_prato_carrossel">
                            Prato exemplo
                        </div>
					</li>
					<li>
						<img src="imagens/img1.jpg"/>
                        <div class="detalhes_prato_carrossel">
                            Prato exemplo
                        </div>
					</li>
					<li>
						<img src="imagens/img5.jpg"/>
                        <div class="detalhes_prato_carrossel">
                            Prato exemplo
                        </div>
					</li>
					<li>
						<img src="imagens/img3.jpg"/>
                        <div class="detalhes_prato_carrossel">
                            Prato exemplo
                        </div>
					</li>
                    <li>
						<img src="imagens/img7.jpg"/>
                        <div class="detalhes_prato_carrossel">
                            Prato exemplo
                        </div>
					</li>
				</ul>
            </div>
            <div class="menu-carrossel">
				<a href="#" class="next" id="next2" title="Próximo">
                    <img src="imagens/seta2.png" />
                </a>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jcarousellite.js"></script>
        <script>
            $(function() {
				$("#carrossel2"). jCarouselLite({
                    btnPrev: '#prev2',
                    btnNext: '#next2',
                    visible: 5
				})
            })
        </script>
    </div>

</div>
