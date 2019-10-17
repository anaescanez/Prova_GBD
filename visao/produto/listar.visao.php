<h2>Listar produtos</h2>

<table class="table">
    <thead>
        <tr>
            <th>DESCRICAO</th>
            <th>QUANTIDADE</th>
            <th>EDITAR</th>
            <th>DELETAR</th>
        </tr>
    </thead>
    <?php foreach ($produtos as $produto): ?>
    <tr>
        <td><?=$produto['descricao']?></td>
        <td><?=$produto['quantidade']?></td>
        <td><a href="./produto/editar/<?=$produto['codProduto']?>">editar</a></td>
        <td><a href="./produto/deletar/<?=$produto['codProduto']?>">deletar</a></td>
    </tr>
    <?php endforeach; ?>
</table>

<a href="./produto/adicionar" class="btn btn-primary">Adicionar novo produto</a>

