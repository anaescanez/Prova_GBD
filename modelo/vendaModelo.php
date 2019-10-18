<?php

function adicionarVenda($idCliente, $dataVenda) {
    $sql = "call cadastrar_venda($idCliente, '$dataVenda')";
    $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao cadastrar venda' . mysqli_error($cnx)); }
    return 'Venda cadastrado com sucesso!';
}

function editarVenda($codvenda, $idCliente, $dataVenda){
 $sql = "call editar_venda($codvenda, $idCliente, '$dataVenda')";
     $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao editar venda' . mysqli_error($cnx)); }
    return 'Venda atualizada com sucesso!';  
}


function deletarVenda($codvenda) {
    $sql = "call deletar_venda($codvenda)";
    $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao deletar venda' . mysqli_error($cnx)); }
    return 'Venda deletado com sucesso!';
            
}

function pegarTodasVendas() {
    $sql = "call listar_venda";
    $resultado = mysqli_query(conn(), $sql);
    $vendas = array();
    while ($linha = mysqli_fetch_assoc($resultado)) {
        $vendas[] = $linha;
    }
    return $vendas;
}


function pegarVendaPorId ($codvenda){
    $sql= "call listar_venda_por_id($codvenda)";
    $resultado= mysqli_query(conn(), $sql);
    $vendas= mysqli_fetch_assoc($resultado);
   
    return $vendas;
}