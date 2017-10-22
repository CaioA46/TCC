  
    <div class="titulo_historico">
        Cadastro de eventos
    
    </div>
    <form action="router.php?controller=eventos&modo=inserir" method="post" enctype="multipart/form-data" id="cadastrar_evento">
        <div class="margem">
            <div class="lado">
                <p> Titulo:</p>
                <input type="text" name="txtTitulo">
            </div>
            
            <div class="lado">
                <p> Data: </p>
                <input type="text" name="txtData">
            </div>
            
            <div class="clear">
                <p> Descrição: </p>
                <textarea name="txtDescricao" rows="10" cols="60" ></textarea>
            </div>
        
        </div>
        <div class="margem">
            <p> Comentário: </p>
            <textarea name="txtDescricao" rows="14" cols="60" ></textarea>
        
        </div>
        <div class="margem">
            <p> Foto do evento: </p>
            <div class="cadastrar_imagem">
                <img src="" alt="">
            </div>
            <input type="file" name="flComentario">
        
        </div>
        <div class="imagens_evento">
            <ul class="lista_imgs_evento">
                <li>
                    <div class="imgEvento"><img src=""></div>
                    <p> <input type="file" name="flEvento1"> </p>
                </li>
                <li>
                    <div class="imgEvento"><img src=""></div>
                    <p> <input type="file" name="flEvento2"> </p>
                </li>
                <li>
                    <div class="imgEvento"><img src=""></div>
                    <p> <input type="file" name="flEvento3"> </p>
                </li>
                <li>
                    <div class="imgEvento"><img src=""></div>
                    <p> <input type="file" name="flEvento4"> </p>
                </li>
                <li>
                    <div class="imgEvento"><img src=""></div>
                    <p> <input type="file" name="flEvento5"> </p>
                </li>
            </ul>
            
        </div>
        <input type="submit" name="btnSalvar" value="Salvar" class="botao">
    </form>

    <div class="titulo_historico">
        Histórico de eventos:
    </div>
    <div id="historico_evento">
    <?php 
        require_once('controller/eventos_controller.php');
        $eventos_controller = new ControllerEventos();
        $rs = $eventos_controller->ListarEventos();
        
        if($rs != null){
            $cont = 0;
            while($cont < count($rs)){
                $imagem = '../'.$rs[$cont]->imagem;
                $titulo = $rs[$cont]->titulo;
                $data = $rs[$cont]->data;
                $local = $rs[$cont]->local;
        ?>
                <div class="eventos_todos">
                    <div class="img_evento_todos">
                        <img src="<?php echo $imagem ?>" alt="<?php echo $titulo ?>">
                    </div>
                    <div class="detalhes_evento_todos">
                        <p>Titulo:<?php echo $titulo ?></p>
                        <p>Data:<?php echo $data ?></p>
                        <p>Local:<?php echo $local ?></p>
                    </div>
                </div>
        <?php 
                $cont++;
            }
        }else{
            echo 'Não há histórico de eventos';
        }
    ?>
    </div>
