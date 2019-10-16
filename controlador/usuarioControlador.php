<?php

require_once "modelo/usuarioModelo.php";

function adicionar() {
    if (ehPost()) {
        $rg = $_POST["rg"];
        $nome = $_POST["nome"];
       
        $msg = adicionarUsuario($rg, $nome);
        echo $msg;
        redirecionar("usuario/listar");    
    } else {
        exibir("usuario/formulario");
    }
}

function listar(){
    $dados = array();
    $dados["usuarios"] = pegarTodosUsuarios();
    exibir('usuario/listar', $dados);
}

function editar($idCliente) {
    if (ehPost()) {
        $rg = $_POST["rg"];
        $nome = $_POST["nome"];
        $msg = editarUsuario($idCliente, $rg, $nome);
        echo $msg;
         
        redirecionar("usuario/listar");
    } else {
        $dados["usuario"] = pegarUsuarioPorId($idCliente);
        exibir("usuario/formulario", $dados);
    }
}

function deletar ($idCliente){
    $msg = deletarUsuario($idCliente);
    redirecionar ("usuario/listar");
}