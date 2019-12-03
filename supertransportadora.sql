/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : supertransportadora

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-11-23 18:19:15
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `cidade`
-- ----------------------------
DROP TABLE IF EXISTS `cidade`;
CREATE TABLE `cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '0',
  `estado_id` int(11) NOT NULL DEFAULT '0',
  `cep` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `estado_id` (`estado_id`),
  CONSTRAINT `estado_id` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cidade
-- ----------------------------

-- ----------------------------
-- Table structure for `cliente`
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '0',
  `cpf` int(11) NOT NULL DEFAULT '0',
  `endereco` varchar(100) DEFAULT '0',
  `id_cidade` int(11) NOT NULL DEFAULT '0',
  `telefone` int(11) NOT NULL DEFAULT '0',
  `email` varchar(100) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_cidade` (`id_cidade`),
  CONSTRAINT `id_cidade` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cliente
-- ----------------------------

-- ----------------------------
-- Table structure for `estado`
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '0',
  `sigla` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estado
-- ----------------------------

-- ----------------------------
-- Table structure for `frete`
-- ----------------------------
DROP TABLE IF EXISTS `frete`;
CREATE TABLE `frete` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cidade_origem` int(11) NOT NULL DEFAULT '0',
  `cidade_destino` int(11) NOT NULL DEFAULT '0',
  `preco` decimal(10,2) NOT NULL DEFAULT '0.00',
  `data_saida` date NOT NULL,
  `id_motorista` int(11) NOT NULL,
  `data_chegada` date DEFAULT NULL,
  `status` enum('A_CAMINHO','CANCELADO','ENTREGUE') NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `cidade_origem` (`cidade_origem`),
  KEY `cidade_destino` (`cidade_destino`),
  KEY `id_motorista` (`id_motorista`),
  KEY `cliente` (`id_cliente`),
  CONSTRAINT `cidade_destino` FOREIGN KEY (`cidade_destino`) REFERENCES `cidade` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cidade_origem` FOREIGN KEY (`cidade_origem`) REFERENCES `cidade` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `motorista` FOREIGN KEY (`id_motorista`) REFERENCES `motorista` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of frete
-- ----------------------------

-- ----------------------------
-- Table structure for `motorista`
-- ----------------------------
DROP TABLE IF EXISTS `motorista`;
CREATE TABLE `motorista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '0',
  `cpf` varchar(11) NOT NULL DEFAULT '0',
  `caminhao_modelo` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(50) DEFAULT '0',
  `telefone` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of motorista
-- ----------------------------
