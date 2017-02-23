-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.34-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para acapord
CREATE DATABASE IF NOT EXISTS `acapord` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `acapord`;


-- Copiando estrutura para tabela acapord.administrador
CREATE TABLE IF NOT EXISTS `administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acapord.administrador: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` (`id`, `login`, `senha`, `nivel`) VALUES
	(1, 'admin', 'admin', 1),
	(8, 'jesuan', '123', 1),
	(9, 'luan', '123', 0),
	(10, 'user', '12', 0);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;


-- Copiando estrutura para tabela acapord.entrada
CREATE TABLE IF NOT EXISTS `entrada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_p_ent` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entrada` (`id_p_ent`),
  CONSTRAINT `fk_entrada` FOREIGN KEY (`id_p_ent`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acapord.entrada: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` (`id`, `id_p_ent`, `quantidade`) VALUES
	(1, 28, 10),
	(2, 30, 12);
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;


-- Copiando estrutura para tabela acapord.estoque
CREATE TABLE IF NOT EXISTS `estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_p_est` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estoque` (`id_p_est`),
  CONSTRAINT `fk_estoque` FOREIGN KEY (`id_p_est`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acapord.estoque: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` (`id`, `id_p_est`, `quantidade`) VALUES
	(1, 28, 4),
	(2, 29, 964),
	(3, 17, 9997142),
	(4, 30, 0);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;


-- Copiando estrutura para tabela acapord.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(144) NOT NULL,
  `valor` float DEFAULT NULL,
  `venda` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acapord.produto: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`id`, `nome`, `valor`, `venda`) VALUES
	(17, 'carne bovina', 11, 0),
	(18, 'sabão', 6, 0),
	(20, 'milho pra pipoca 500g', 3, 1),
	(21, 'Alho', 500, 1),
	(23, 'vasoura', 16, 0),
	(24, 'arroz', 6, 1),
	(25, 'Galinha Caipira', 5, 0),
	(26, 'Galinha Caipira', 25, 0),
	(27, 'Leite Ninho', 6, 0),
	(28, 'feijao', 6.35, 1),
	(29, 'Tapioca', 3.99, 0),
	(30, 'Carne de Sol', 21.57, 1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;


-- Copiando estrutura para tabela acapord.venda
CREATE TABLE IF NOT EXISTS `venda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_p_cp` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `valorP` float DEFAULT NULL,
  `doacao` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `isvenda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_compra` (`id_p_cp`),
  CONSTRAINT `fk_compra` FOREIGN KEY (`id_p_cp`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acapord.venda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` (`id`, `id_p_cp`, `quantidade`, `valorP`, `doacao`, `data`, `isvenda`) VALUES
	(15, 17, 10, 11, 0, '2017-02-09', 1);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
