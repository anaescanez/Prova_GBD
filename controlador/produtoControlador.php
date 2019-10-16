<?php

require_once "modelo/produtoModelo.php";

function adicionar() {
    if (ehPost()) {
        $descricao = $_POST["descricao"];
        $quantidade = $_POST["quantidade"];
       
        $msg = adicionarProduto($descricao, $quantidade);
        echo $msg;
        redirecionar("produto/listar");    
    } else {
        exibir("produto/formulario");
    }
}

function listar(){
    $dados = array();
    $dados["produtos"] = pegarTodosProdutos();
    exibir('produto/listar', $dados);
}

function editar($codProduto) {
    if (ehPost()) {
        $descricao = $_POST["descricao"];
        $quantidade = $_POST["quantidade"];
        $msg = editarProduto($codProduto, $descricao, $quantidade);
        echo $msg;
         
        redirecionar("produto/listar");
    } else {
        $dados["produto"] = pegarProdutoPorId($codProduto);
        exibir("produto/formulario", $dados);
    }
}

function deletar ($codProduto){
    $msg = deletarProduto($codProduto);
    redirecionar ("produto/listar");
}