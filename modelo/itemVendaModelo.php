<?php

function adicionarItemVenda($codVenda, $codProduto, $quantidade) {
$sql = "call cadastrar_itemvenda($codVenda, $codProduto, $quantidade)";
     $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao cadastrar ItemVenda' . mysqli_error($cnx)); }
    return 'ItemVenda cadastrado com sucesso!';
}

function editarItemVenda($codVenda, $codProduto, $quantidade){
    $sql = "call editar_itemVenda($codVenda, $codProduto, $quantidade)";
        $resultado = mysqli_query($cnx = conn(), $sql);
       if(!$resultado) { die('Erro ao editar itemVenda' . mysqli_error($cnx)); }
       return 'ItemVenda atualizado com sucesso!';  
}

function deletarItemVenda($codVenda, $codProduto) {
    $sql = "call deletar_itemVenda($codVenda, $codProduto)";
        $resultado = mysqli_query($cnx = conn(), $sql);
       if(!$resultado) { die('Erro' . mysqli_error($cnx)); }
       return 'Sucesso!';
}   

function pegarTodosItemVenda(){
    $sql = "call listar_itemVenda";
    $resultado = mysqli_query(conn(), $sql);
    $itemVendas = array();
    while($linha = mysqli_fetch_assoc($resultado)){
        $itemVendas[] = $linha;
    }
    return $itemVendas;
}

function pegarItemVendaPorId($codVenda, $codProduto){
 $sql = "call listar_itemVenda_por_id($codVenda, $codProduto)";
     $resultado = mysqli_query($cnx = conn(), $sql);
     $itemVenda = mysqli_fetch_assoc($resultado);
    return $itemVenda;
}

?>