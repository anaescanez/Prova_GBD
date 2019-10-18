<h2>Listar Item Venda</h2>

<table class="table" border="1">
    <thead>
        <tr>
            <th>Cod Venda</th>
            <th>Cod Produto</th>
            <th>Quantidade</th>
            <th>EDITAR</th>
            <th>DELETAR</th>
        </tr>
    </thead>
    <?php foreach ($itemVendas as $itemVenda): ?>
    <tr>
        <td><?=$itemVenda['codVenda']?></td>
        <td><?=$itemVenda['codProduto']?></td>
        <td><?=$itemVenda['quantidade']?></td>
        <td><a href="./itemVenda/editar/<?=$itemVenda['codVenda']?>/<?=$itemVenda['codProduto']?>">editar</a></td>
        <td><a href="./itemVenda/deletar/<?=$itemVenda['codVenda']?>/<?=$itemVenda['codProduto']?>">deletar</a></td>
    </tr>
    <?php endforeach; ?>
</table>

<a href="./itemVenda/adicionar">Adicionar novo item Venda</a>
<a href="./paginas">Voltar ao menu</a>