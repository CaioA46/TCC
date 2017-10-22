<div id="principal">
   
    <div id="header">
        Histórico de reservas
    </div>
    <div id="identf_cliente">
        <p>
            Nome: Cliente pessoa - 
            Telefone: (11) 98654-8754 
        </p>
        <img src="imagens/usuario.jpg" alt="imagem cliente" class="foto_cliente">
    </div>
    <div id="detalhes_reserva">
        <div id="content_detalhes1">
            <p> E-mail: Cliente@email.com </p>
            <p> CPF: 45454545454 </p>
            
            <p>Mesa para: 5 pessoas</p>

            <p>Em: 26/08/2017</p>
            <p>Periodo: Jantar</p>
           
        </div>
        <div id="content_detalhes2">
            <p id="titulo_lst"> Lista de pedidos: </p>
            <ul class="lst_pedidos">
                <li> Entrada </li>
                <li> Prato principal </li>
                <li> Bebida</li>
                <li> Sobremesa </li>
                <li> Salada </li>
                <li> Entrada </li>
                <li> Prato principal </li>
                <li> Bebida</li>
                <li> Sobremesa </li>
                <li> Salada </li>
            </ul>
            
        </div>
        <div id="content_detalhes3">
            <div class="atendimento">
                Atendido por:
                Nome do garçom
            </div>
            <div class="avaliacao_atendimento">
                <p> Avaliação do cliente</p>
                <table>
                    <tr>
                        <td><img src="../imagens/estrela.png"> </td>
                        <td><img src="../imagens/estrela.png"> </td>
                        <td><img src="../imagens/estrela.png"> </td>
                        <td><img src="../imagens/estrela.png"> </td>
                        <td><img src="../imagens/estrela.png"> </td>
                     </tr>
                </table>
            </div>
            
        </div>
        
    </div>
    <div id="todas_reservas">
        <div id="titulo_lista_reservas">
            Todas as reservas anteriores
        </div>
        <div id="lista_reservas">
            <table>
                <thead>
                    <tr>
                        <td> Cliente </td>
                        <td> Data </td>
                        <td> Periodo </td>
                        <td> Avaliacao </td>
                        <td> Telefone </td>
                    </tr>
                </thead>
            <?php
                $cont = 0;
                while($cont <= 5){
            ?>
                <tbody>
                    <tr>
                        <td> Ceverino </td>
                        <td> 24/04/20017 </td>
                        <td> Jantar </td>
                        <td> Avaliacao </td>
                        <td> (11)4554-5544 </td>
                    </tr>
                </tbody>
            <?php
                    $cont++;
                }
            ?>
            </table>
        </div>
    
    </div>
</div>