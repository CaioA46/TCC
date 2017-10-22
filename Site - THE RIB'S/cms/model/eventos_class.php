<?php
/*
    Feito por:Larissa
    Data:18/10/2017
    
*/

class Eventos{
    
    public $titulo;
    public $id;
    public $sobre;
    public $data;
    public $imagem;
    public $restaurante;
    
    function __construct(){
        require_once('model/db_class.php');

        $conexao = new Mysql_db();
        $conexao->conectar();
    }
    
    public function InsertEvento(){
        
    }
        
    public function DeleteEvento(){
        
    }
        
    public function SelectEventos(){
        $sql = "select e.*, img.url as imagem, r.Nome
                from tbl_eventos as e
                inner join tbl_evento_imagem as ei
                on e.id_evento = ei.id_evento
                inner join tbl_imagem as img
                on ei.id_img = img.id_imagem
                inner join tbl_evento_restaurante as er
                on e.id_evento = er.id_evento
                inner join tbl_restaurante as r
                on er.id_restaurante = r.id_restaurante";
        
        $select = mysql_query($sql);
        
        $cont = 0;
        while($rs = mysql_fetch_array($select)){
            
            $evento[] = new Eventos();
            
            $evento[$cont]->id = $rs['id_evento'];
            $evento[$cont]->titulo = $rs['nome'];
            $evento[$cont]->sobre = $rs['sobre'];
            $evento[$cont]->data = $rs['data'];
            $evento[$cont]->imagem = $rs['imagem'];
            $evento[$cont]->restaurante = $rs['restaurante'];

        }
        
        return
    }
        
    public function UpdateEvento(){
        
    }
        
    public function SelectEventoById(){
        
    }
    
    
    public function CadastrarImagem($imagem){
        $arq = basename($_FILES['ftDestaque']['name']);
        $imagem =  'imagens/'.$arq;
        $caminho =  '../'.$imagem;
        
        $extArq = strtolower(substr($arq, strlen($arq)-3, 3));
        
        if($extArq == 'jpg' || $extArq == 'png' || $extArq == 'jpeg'){
            if(move_uploaded_file($_FILES['ftDestaque']['tmp_name'], $caminho)){
                $sql = 'select * from tbl_imagem order by id_imagem desc limit 1';
                $select = mysql_query($sql);
                
                if(mysql_affected_rows() > 0){
                    while($rs = mysql_fetch_array($select)){
                        $idImg = $rs['id_imagem'] + 1;
                    }
                }else{
                    $idImg = 1;
                }
                echo $idImg;
                mysql_query('insert into tbl_imagem(id_imagem, url) values('.$idImg.', "'.$imagem.'")');
                
                if(mysql_affected_rows() > 0){
                    return $idImg;
                        
                }else{
                    echo 'Erro ao cadastrar imagem';
                }
                
            }else{
                echo 'ERROO';
            }
            
        }else{
            echo "<script> alert('Erro na extensão do arquivo'); </script>";
        }
    }
}

?>