-- loja_GBD DATABASE
DROP DATABASE IF EXISTS loja_GBD;
CREATE DATABASE loja_GBD;
USE loja_GBD;


CREATE TABLE `Cliente` (
  `idCliente` int(10) NOT NULL AUTO_INCREMENT,
  `rg` int(10) NOT NULL,
  `nome` varchar(60) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ;


CREATE TABLE `itemVenda` (
  `codvenda` int(10) unsigned NOT NULL ,
  `codProduto` int(10) unsigned NOT NULL,
  `quantidade` int(10) unsigned NOT NULL,
  PRIMARY KEY (`codvenda`,`codProduto`),
  KEY `codProduto` (`codProduto`),
  CONSTRAINT `itemVenda_ibfk_1` FOREIGN KEY (`codvenda`) REFERENCES `venda` (`codvenda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `itemVenda_ibfk_2` FOREIGN KEY (`codProduto`) REFERENCES `produto` (`codProduto`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `produto` (
  `codProduto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `quantidade` int(10) unsigned NOT NULL,
  PRIMARY KEY (`codProduto`)
);

CREATE TABLE `venda` (
  `codvenda` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idCliente` int(10) NOT NULL,
  `dataVenda` date NOT NULL,
  PRIMARY KEY (`codvenda`),
  KEY `fk_venda_Cliente1_idx` (`idCliente`),
  CONSTRAINT `fk_venda_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;


-- Cadastro Cliente--
DROP PROCEDURE IF EXISTS cadastrar_cliente;

DELIMITER $$
CREATE PROCEDURE cadastrar_cliente(IN rg INT(10), IN nome VARCHAR(60))
BEGIN
	IF(rg != 0)AND(nome != "")THEN
		INSERT INTO cliente VALUES(NULL, rg, nome);
	ELSE 
		SELECT "Você deve inserir um valor!" AS msg;
	END IF;
END $$
DELIMITER ;


-- Listar Cliente--
DROP PROCEDURE IF EXISTS listar_clientes;
DELIMITER $$

CREATE PROCEDURE listar_clientes()
BEGIN
	SELECT * FROM cliente;
END $$

DELIMITER ;


-- Editar Cliente--
DROP PROCEDURE IF EXISTS editar_cliente;
DELIMITER $$

CREATE PROCEDURE editar_cliente(IN id INT(10), rg INT(10), nome VARCHAR(60))
BEGIN
	UPDATE cliente SET rg=rg, nome=nome WHERE idCliente=id;
END $$

DELIMITER ;


-- Deletar Cliente--
DROP PROCEDURE IF EXISTS deletar_cliente;
DELIMITER $$

CREATE PROCEDURE deletar_cliente(IN id INT(10))
BEGIN
	DELETE FROM cliente WHERE idCliente=id;
END $$

DELIMITER ;


-- Listar por Id Cliente--
DROP PROCEDURE IF EXISTS listar_cliente_por_id;
DELIMITER $$

CREATE PROCEDURE listar_cliente_por_id(IN id INT(10))
BEGIN
	SELECT * FROM cliente WHERE idCliente=id;
END $$

DELIMITER ;


--Cadastro Produto --
DROP PROCEDURE IF EXISTS cadastrar_produto;
DELIMITER $$

CREATE PROCEDURE cadastrar_produto(IN descricao VARCHAR(45), quantidade INT(10))
BEGIN
	IF(descricao != "")AND(quantidade != 0)THEN
		INSERT INTO produto (descricao, quantidade) VALUES(descricao, quantidade);
	ELSE 
		SELECT "Você deve preencher todos os campos!" AS msg;
	END IF;
END $$

DELIMITER ;


--Listar Produto --
DROP PROCEDURE IF EXISTS listar_produtos;
DELIMITER $$

CREATE PROCEDURE listar_produtos()
BEGIN
	SELECT * FROM produto ORDER BY codProduto ASC;
END $$

DELIMITER ;


--Editar Produto --
DROP PROCEDURE IF EXISTS editar_produto;
DELIMITER $$

CREATE PROCEDURE editar_produto(IN id INT(10), descricao VARCHAR(60), quantidade INT(10))
BEGIN
	UPDATE produto SET descricao=descricao, quantidade=quantidade WHERE codProduto = id;
END; $$

DELIMITER ;


--Deletar Produto --
DROP PROCEDURE IF EXISTS deletar_produto;
DELIMITER $$

CREATE PROCEDURE deletar_produto(IN id INT(10))
BEGIN
	DELETE FROM produto WHERE codProduto=id;
END $$

DELIMITER ;


--Listar por id Produto --
DROP PROCEDURE IF EXISTS listar_produto_por_id;
DELIMITER $$

CREATE PROCEDURE listar_produto_por_id(IN v_codProduto INT(10))
BEGIN
	SELECT * FROM produto WHERE codProduto = v_codProduto;
END $$

DELIMITER ;