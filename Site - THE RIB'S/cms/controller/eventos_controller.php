<?php
/*
    Feito por:Larissa
    Data:18/10/2017
    
*/

class ControllerEventos{
    
    public function CadastrarEvento(){
        require_once('model/eventos_class.php');
        $eventos_class = new Eventos();
        $eventos_class->InsertEvento();
        
    }
    
    public function ExcluirEvento(){
        require_once('model/eventos_class.php');
        $eventos_class = new Eventos();
        $eventos_class->DeleteEvento();
        
    }
    
    public function ListarEventos(){
        require_once('model/eventos_class.php');
        $eventos_class = new Eventos();
        $result = $eventos_class->SelectEventos();
        
        return $result;
        
    }
    
    public function AlterarEvento(){
        require_once('model/eventos_class.php');
        $eventos_class = new Eventos();
        $result = $eventos_class->UpdateEvento();
        
        return $result;
        
    }
    
    public function BuscarEvento(){
        require_once('model/eventos_class.php');
        $eventos_class = new Eventos();
        $result = $eventos_class->SelectEventoById();
        
        return $result;
        
    }
    
    
    
}

?>