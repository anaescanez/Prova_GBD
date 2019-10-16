<?php

function conn() {
    $cnx = mysqli_connect("localhost", "root", "", "loja_GBD");
    if (!$cnx) die('Deu errado a conexao!');
    return $cnx;
}