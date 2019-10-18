<h2>Listar Vendas</h2>

<table class="table" border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>Data Venda</th>
            <th>EDITAR</th>
            <th>DELETAR</th>
        </tr>
    </thead>
    <?php foreach ($vendas as $venda): ?>
    <tr>
        <td><?=$venda['idCliente']?></td>
        <td><?=$venda['dataVenda']?></td>
        <td><a href="./venda/editar/<?=$venda['codvenda']?>">editar</a></td>
        <td><a href="./venda/deletar/<?=$venda['codvenda']?>">deletar</a></td>
    </tr>
    <?php endforeach; ?>
</table>

<a href="./venda/adicionar">Adicionar nova Venda</a>
<a href="./paginas">Voltar ao menu</a>