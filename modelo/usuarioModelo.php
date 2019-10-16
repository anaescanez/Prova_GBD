<?php

function adicionarUsuario($rg, $nome) {
    $sql = "call cadastrar_cliente($rg, '$nome')";
    $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao cadastrar usuário' . mysqli_error($cnx)); }
    return 'Usuario cadastrado com sucesso!';
}

function editarUsuario($idCliente, $rg, $nome) {
    $sql = "call editar_cliente($idCliente, $rg, '$nome')";
    $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao alterar usuário' . mysqli_error($cnx)); }
    return 'Usuário alterado com sucesso!';
}

function deletarUsuario($idCliente) {
    $sql = "call deletar_cliente($idCliente)";
    $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao deletar usuário' . mysqli_error($cnx)); }
    return 'Usuario deletado com sucesso!';
            
}

function pegarTodosUsuarios() {
    $sql = "call listar_clientes";
    $resultado = mysqli_query(conn(), $sql);
    $usuarios = array();
    while ($linha = mysqli_fetch_assoc($resultado)) {
        $usuarios[] = $linha;
    }
    return $usuarios;
}

function pegarUsuarioPorId ($idCliente){
    $sql= "call listar_cliente_por_id($idCliente)";
    $resultado= mysqli_query(conn(), $sql);
    $cliente= mysqli_fetch_assoc($resultado);
   
    return $cliente;
}