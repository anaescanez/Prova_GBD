<?php

require_once "modelo/vendaModelo.php";
require_once "modelo/usuarioModelo.php";

function adicionar() {
    if (ehPost()) {
        $idCliente = $_POST["idCliente"];
        $dataVenda = $_POST["dataVenda"];
       
        $msg = adicionarVenda($idCliente, $dataVenda);
        echo $msg;
        redirecionar("venda/listar");    
    } else {
        exibir("venda/formulario");
    }
}

function listar(){
    $dados = array();
    $dados["vendas"] = pegarTodasVendas();
    exibir('venda/listar', $dados);
}

function editar ($codvenda){
    if(ehPost()){
    $idCliente = $_POST["idCliente"];
    $dataVenda = $_POST["dataVenda"];
    $msg= editarVenda($codvenda, $idCliente, $dataVenda);
    echo $msg;
    
     redirecionar("venda/listar");
    }else{
        $dados["vendas"] = pegarVendaPorId($codvenda);
        exibir('venda/formulario', $dados);
        
    }
    
}

function deletar ($id){
    $msg = deletarVenda($id);
    redirecionar ("venda/listar");
}
