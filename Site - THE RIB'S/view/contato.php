    <link rel="stylesheet" type="text/css" href="estilo/estilo_contato.css">
    <script type="text/javascript" src="js/jqueryui/jquery-ui.min.js"></script>

    <div id="principal">
        <div id="introd_contatos">
            <div class="introd">
                <p><span class="titulo_introd"> Bem vindo a página de contato! </span></p>
                Esta é a página onde você pode entrar em contato conosco <br>e mandar sugestões, criticas e tirar suas dúvidas, fique à vontade!
            </div>
        </div>
        <div id="perguntas_frequentes">
            <div id="perguntas_centro">
                <div class="titulo">
                    <div id="margin-titulo-perguntas">

                    </div>
                    <div class="titulo-perguntas">
                        Perguntas frequentes:
                    </div>
                </div>
                <ul class="lst_perguntas">
                    <li><a href="#"> Como faço para reservar uma mesa? </a></li>
                    <li><a href="#"> Como confirmar uma reserva? </a></li>
                    <li><a href="#"> Onde se localizam o restaurantes? </a></li>
                    <li><a href="#"> Exemplo exemplo exemplo </a></li>
                    <li><a href="#"> Pergunta 5 detalhes? </a></li>
                    <li><a href="#"> Pergunta 6 detalhes? </a></li>
                    <li><a href="#"> Pergunta 7 detalhes? </a></li>
                </ul>
                <ul class="lst_perguntas">
                    <li><a href="#"> Como faço para reservar uma mesa? </a></li>
                    <li><a href="#"> Pergunta 2 detalhes? </a></li>
                    <li><a href="#"> Pergunta 3 detalhes? </a></li>
                    <li><a href="#"> Pergunta 4 detalhes? </a></li>
                    <li><a href="#"> Pergunta 5 detalhes? </a></li>
                </ul>
            </div>
        </div>
        <div id="faleconosco">
            <form action="router.php?controller=contato&modo=enviar" method="post" id="frmcontato">
                <div class="titulo_faleconosco"> Ainda está com duvidas? Quer fazer uma critica ou sugestão? Mande aqui a sua mensagem! </div>
                <div class="campos_contato">
                    <div class="grupo-text-pesquisa">
                        <input name="txtNome" class="login_senha2" type="text" maxlength="50" required/>
                        <label> Nome: </label>
                        <span class="bar"> </span>
                    </div>
                     <div class="grupo-text-pesquisa">
                        <input name="txtTelefone" class="login_senha2" type="text" maxlength="50" />
                        <label> Telefone: </label>
                        <span class="bar"> </span>
                    </div>
                     <div class="grupo-text-pesquisa">
                        <label> Filial: </label><br>
                         <select name="filial">
                             <option value="0"> Escolha uma filial </option>
                            <?php

                               require_once('controller/filial_controller.php');

                                $listaFiliais = new ControllerFilial();

                                $rs = $listaFiliais->MostrarFiliais();

                                $contador = 0;


                                while($contador < count($rs)){

                                    ?>
                                        <option value="<?php echo($rs[$contador]->id_restaurante); ?>">
                                            <?php echo($rs[$contador]->nome); ?>
                                        </option>
                                    <?php

                                    $contador += 1;
                                }

                             ?>
                         </select>
                        <span class="bar"> </span>
                    </div>
                </div>
                <div class="campos_contato">
                    <div class="grupo-text-pesquisa">
                        <input name="txtEmail" class="login_senha2" type="text" maxlength="50" />
                        <label> Email: </label>
                        <span class="bar"> </span>
                    </div>
                    <div class="grupo-text-pesquisa">
                        <input name="txtCelular" class="login_senha2" type="text" maxlength="50" required/>
                        <label> Celular: </label>
                        <span class="bar"> </span>
                    </div>
                    <div class="grupo-text-pesquisa">
                        <label> Ocorrencia: </label><br>
                        <select name="ocorrencia">
                            <option value="0"> Escolha uma opção </option>

                            <?php

                                require_once('controller/ocorrencia_controller.php');

                                $listaOcorrencias = new ControllerOcorrencia();

                                $resultSet = $listaOcorrencias->MostrarOcorrencias();

                                $contador = 0;

                                while($contador < count($resultSet)){
                                ?>

                                    <option value="<?php echo($resultSet[$contador]->id_tipo_ocorrencia); ?>">
                                        <?php echo($resultSet[$contador]->tipo_ocorrencia); ?>
                                    </option>

                                <?php

                                    $contador += 1;
                                }

                            ?>
                        </select>

                    </div>
                </div>
                <div class="margem_esquerda">
                    <textarea name="txtMensagem" rows="1" cols="100" placeholder="Digite sua mensagem"></textarea>
                </div>
                <div class="margem_esquerda">
                    <button name="btnEnviar"> Enviar </button>
                    <button name="btnLimpar"> Limpar </button>
                </div>

            </form>
        </div>
    </div>
