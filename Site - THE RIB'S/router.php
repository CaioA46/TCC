<?php

  $controller = $_GET['controller'];
  $modo = $_GET['modo'];


  switch ($controller) {
    case 'clientes':

      require_once('controller/cliente_controller.php');
      require_once('controller/funcionario_controller.php');
      require_once('model/funcionario_class.php');
      require_once('model/cliente_class.php');

      $controller_cliente = new ControllerCliente();

      switch ($modo) {
        case 'novo':
            $controller_cliente->NovoCliente();
          break;

        case 'logar';
            $controller_cliente->Login();
          break;
        default:
          # code...
          break;
      }

      break;

    case 'contato':

      require_once('controller/contato_controller.php');
      require_once('model/contato_class.php');

      $controller_contato = new ControllerContato();

      switch ($modo) {
        case 'enviar':
            $controller_contato->NovoContato();
          break;

          

        default:
          # code...
          break;
      }

      break;
    default:
      # code...
      break;
  }


?>
