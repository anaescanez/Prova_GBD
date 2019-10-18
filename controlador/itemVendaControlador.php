<?php
require_once "modelo/itemvendaModelo.php";

function adicionar() {
if (ehPost()) {
$codVenda = $_POST["codVenda"];
$codProduto = $_POST["codProduto"];
$quantidade = $_POST["quantidade"];

$mensagem = adicionarItemVenda($codVenda, $codProduto, $quantidade);
echo $mensagem;
}else{
       exibir("itemVenda/formulario");
   } 
}

function listar(){
    $dados = array();
    $dados["itemVendas"] = pegarTodosItemVenda();
    exibir('itemVenda/listar', $dados);
}

function deletar($codVenda, $codProduto) {
    deletarItemVenda($codVenda, $codProduto);
    redirecionar("itemVenda/listar");
}

function editar ($codVenda, $codProduto){
    if(ehPost()){
    $quantidade = $_POST["quantidade"];
    $mensagem= editarItemVenda($codVenda, $codProduto, $quantidade);
    echo $mensagem;
    
     redirecionar("itemVenda/listar");
    }else{
        $dados["itemVendas"] = pegarItemVendaPorId($codVenda, $codProduto);
        exibir('itemVenda/formulario', $dados);
        
    }
    
}
?>
