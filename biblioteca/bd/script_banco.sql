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
  `codVenda` int(10) unsigned NOT NULL ,
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
	SELECT * FROM cliente ORDER BY idCliente ASC;
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



-- Cadastro Venda--
DROP PROCEDURE IF EXISTS cadastrar_venda;

DELIMITER $$
CREATE PROCEDURE cadastrar_venda(IN idCliente int(10), IN dataVenda date)
BEGIN
	IF(idCliente != "")AND(dataVenda != 0)THEN
		INSERT INTO venda(idCliente, dataVenda) VALUES(idCliente, dataVenda);
	ELSE 
		SELECT "Você deve inserir um valor!" AS msg;
	END IF;
END $$
DELIMITER ;


-- Listar Venda--
DROP PROCEDURE IF EXISTS listar_venda;
DELIMITER $$

CREATE PROCEDURE listar_venda()
BEGIN
	SELECT * FROM venda;
END $$

DELIMITER ;


-- Editar Venda--
DROP PROCEDURE IF EXISTS editar_venda;
DELIMITER $$

CREATE PROCEDURE editar_venda(IN cod INT(10),IN id INT(10), IN dataVenda DATE)
BEGIN
	UPDATE venda SET idCliente=id, dataVenda=dataVenda WHERE codvenda=cod;
END $$

DELIMITER ;


-- Deletar Venda--
DROP PROCEDURE IF EXISTS deletar_venda;
DELIMITER $$

CREATE PROCEDURE deletar_venda(IN cod INT(10))
BEGIN
	DELETE FROM venda WHERE codvenda=cod;
END $$

DELIMITER ;


-- Listar por Id Venda--
DROP PROCEDURE IF EXISTS listar_venda_por_id;
DELIMITER $$

CREATE PROCEDURE listar_venda_por_id(IN codvenda INT(10))
BEGIN
	SELECT * FROM venda WHERE codvenda=codvenda;
END $$

DELIMITER ;





-- Cadastro itemVenda--
DROP PROCEDURE IF EXISTS cadastrar_itemVenda;

DELIMITER $$
CREATE PROCEDURE cadastrar_itemVenda(IN codVenda int(10), IN codProduto int(10), IN quantidade int(10))
BEGIN
	IF(codVenda != "")AND(codProduto != "")AND(quantidade != "")THEN
		INSERT INTO itemVenda(codVenda, codProduto, quantidade) VALUES(codVenda, codProduto, quantidade);
	ELSE 
		SELECT "Você deve inserir um valor!" AS msg;
	END IF;
END $$
DELIMITER ;


-- Listar itemVenda--
DROP PROCEDURE IF EXISTS listar_itemVenda;
DELIMITER $$

CREATE PROCEDURE listar_itemVenda()
BEGIN
	SELECT * FROM itemVenda;
END $$

DELIMITER ;


-- Editar itemVenda--
DROP PROCEDURE IF EXISTS editar_itemVenda;
DELIMITER $$

CREATE PROCEDURE editar_itemVenda(IN codV INT(10), IN codP INT(10), IN quantidade INT(10))
BEGIN
	UPDATE itemVenda SET quantidade=quantidade WHERE codvenda=codV AND codProduto=codP;
END $$

DELIMITER ;


-- Deletar itemVenda--
DROP PROCEDURE IF EXISTS deletar_itemVenda;
DELIMITER $$

CREATE PROCEDURE deletar_itemVenda(IN codV INT(10), IN codP INT(10))
BEGIN
	DELETE FROM itemVenda WHERE codvenda=codV AND codProduto=codP;
END $$

DELIMITER ;


-- Listar por Id itemVenda--
DROP PROCEDURE IF EXISTS listar_itemVenda_por_id;
DELIMITER $$

CREATE PROCEDURE listar_itemVenda_por_id(IN codV INT(10), IN codP(10))
BEGIN
	SELECT * FROM itemVenda WHERE codvenda=codV AND codProduto=codP;
END $$

DELIMITER ;


-- TRIGGER --
DROP TRIGGER IF EXISTS tgr_diminuireoque;
DELIMITER $$
CREATE TRIGGER tgr_diminuiestoque
AFTER INSERT ON itemVenda
FOR EACH ROW
BEGIN
update produto set produto.quantidade = produto.quantidade- New.quantidade
where produto.codProduto = new.codProduto;
END $$
DELIMITER ;