<h2>Listar usuários</h2>

<table class="table">
    <thead>
        <tr>
            <th>RG</th>
            <th>NOME</th>
            <th>EDITAR</th>
            <th>DELETAR</th>
        </tr>
    </thead>
    <?php foreach ($usuarios as $usuario): ?>
    <tr>
         <td><?=$usuario['rg']?></td>
        <td><?=$usuario['nome']?></td>
        <td><a href="./usuario/editar/<?=$usuario['idCliente']?>">editar</a></td>
        <td><a href="./usuario/deletar/<?=$usuario['idCliente']?>">deletar</a></td>
    </tr>
    <?php endforeach; ?>
</table>

<a href="./usuario/adicionar" class="btn btn-primary">Adicionar novo usuario</a>
<a href="./paginas">Voltar ao menu</a>