<?php

function adicionarProduto($descricao, $quantidade) {
    $sql = "call cadastrar_produto('$descricao', $quantidade)";
    $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao cadastrar Produto' . mysqli_error($cnx)); }
    return 'Produto cadastrado com sucesso!';
}

function editarProduto($codProduto, $descricao, $quantidade) {
    $sql = "call editar_produto($codProduto, '$descricao', $quantidade)";
    $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao alterar Produto' . mysqli_error($cnx)); }
    return 'Produto alterado com sucesso!';
}

function deletarProduto($codProduto) {
    $sql = "call deletar_produto($codProduto)";
    $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao deletar Produto' . mysqli_error($cnx)); }
    return 'Produto deletado com sucesso!';
            
}

function pegarTodosProdutos() {
    $sql = "call listar_produtos";
    $resultado = mysqli_query(conn(), $sql);
    $produtos = array();
    while ($linha = mysqli_fetch_assoc($resultado)) {
        $produtos[] = $linha;
    }
    return $produtos;
}

function pegarProdutoPorId ($codProduto){
    $sql= "call listar_produto_por_id($codProduto)";
    $resultado= mysqli_query(conn(), $sql);
    $produto= mysqli_fetch_assoc($resultado);
   
    return $produto;
}