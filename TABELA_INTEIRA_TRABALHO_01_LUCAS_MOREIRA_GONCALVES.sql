-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Abr-2022 às 19:32
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `trabalho_01`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `VERIFICAR_QTD_JOG` (OUT `QTD_JOG` INT)  BEGIN
SELECT COUNT(*) INTO QTD_JOG FROM jogador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VERIFICAR_QTD_TEC` (OUT `QTD_TEC` INT)  BEGIN
SELECT COUNT(*) INTO QTD_TEC FROM tecnico;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `continente`
--

CREATE TABLE `continente` (
  `COD_CONTINENTE` int(11) NOT NULL,
  `NOME_CONT` varchar(255) NOT NULL,
  `NOME_ASSOC` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `continente`
--

INSERT INTO `continente` (`COD_CONTINENTE`, `NOME_CONT`, `NOME_ASSOC`) VALUES
(1, 'América do Sul', 'CONMEBOL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogador`
--

CREATE TABLE `jogador` (
  `COD_JOGADOR` int(11) NOT NULL,
  `NOME_JOG` varchar(255) NOT NULL,
  `IDADE_JOG` int(11) NOT NULL,
  `NAC_JOG` varchar(255) NOT NULL,
  `JOGOS_JOG` int(11) NOT NULL,
  `GOLS_JOG` int(11) NOT NULL,
  `ASSIST_JOG` int(11) NOT NULL,
  `PART_TOT` int(11) NOT NULL,
  `COD_TIME` varchar(3) DEFAULT NULL,
  `COD_LIGA` int(11) DEFAULT NULL,
  `QTD_JOG` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `jogador`
--

INSERT INTO `jogador` (`COD_JOGADOR`, `NOME_JOG`, `IDADE_JOG`, `NAC_JOG`, `JOGOS_JOG`, `GOLS_JOG`, `ASSIST_JOG`, `PART_TOT`, `COD_TIME`, `COD_LIGA`, `QTD_JOG`) VALUES
(1, 'Taison Barcellos Freda', 34, 'Brasileiro', 8, 2, 2, 4, 'INT', 1, 0);

--
-- Acionadores `jogador`
--
DELIMITER $$
CREATE TRIGGER `tr_participacao_tot` BEFORE INSERT ON `jogador` FOR EACH ROW SET NEW.PART_TOT = (NEW.GOLS_JOG + NEW.ASSIST_JOG)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `liga`
--

CREATE TABLE `liga` (
  `COD_LIGA` int(11) NOT NULL,
  `NOME_LIGA` varchar(255) NOT NULL,
  `COD_PAIS` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `liga`
--

INSERT INTO `liga` (`COD_LIGA`, `NOME_LIGA`, `COD_PAIS`) VALUES
(1, 'Brasileirão Série A', 'BR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pais`
--

CREATE TABLE `pais` (
  `COD_PAIS` varchar(2) NOT NULL,
  `NOME_PAIS` varchar(255) NOT NULL,
  `COD_CONTINENTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pais`
--

INSERT INTO `pais` (`COD_PAIS`, `NOME_PAIS`, `COD_CONTINENTE`) VALUES
('BR', 'Brasil', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tecnico`
--

CREATE TABLE `tecnico` (
  `COD_TECNICO` int(11) NOT NULL,
  `NOME_TEC` varchar(255) NOT NULL,
  `IDADE_TEC` int(11) NOT NULL,
  `NAC_TEC` varchar(255) NOT NULL,
  `JOGOS_TEC` int(11) NOT NULL,
  `VIT_TEC` int(11) NOT NULL,
  `EMP_TEC` int(11) NOT NULL,
  `DER_TEC` int(11) NOT NULL,
  `APROVEITAMENTO` int(11) NOT NULL,
  `COD_TIME` varchar(3) DEFAULT NULL,
  `COD_LIGA` int(11) DEFAULT NULL,
  `QTD_TEC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tecnico`
--

INSERT INTO `tecnico` (`COD_TECNICO`, `NOME_TEC`, `IDADE_TEC`, `NAC_TEC`, `JOGOS_TEC`, `VIT_TEC`, `EMP_TEC`, `DER_TEC`, `APROVEITAMENTO`, `COD_TIME`, `COD_LIGA`, `QTD_TEC`) VALUES
(1, '	Alexander Jesús Medina Reobasco', 43, 'Uruguaio', 16, 6, 5, 5, 0, 'INT', 1, 0);

--
-- Acionadores `tecnico`
--
DELIMITER $$
CREATE TRIGGER `tr_aproveitamento` BEFORE INSERT ON `tecnico` FOR EACH ROW SET NEW.APROVEITAMENTO = (NEW.VIT_TEC / JOGOS_TEC) * 100
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `time`
--

CREATE TABLE `time` (
  `COD_TIME` varchar(3) NOT NULL,
  `NOME_TIME` varchar(255) NOT NULL,
  `COD_LIGA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `time`
--

INSERT INTO `time` (`COD_TIME`, `NOME_TIME`, `COD_LIGA`) VALUES
('INT', 'Sport Club Internacional', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo`
--

CREATE TABLE `tipo` (
  `COD_TIPO` int(11) NOT NULL,
  `COD_JOGADOR` int(11) DEFAULT NULL,
  `COD_TECNICO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `continente`
--
ALTER TABLE `continente`
  ADD PRIMARY KEY (`COD_CONTINENTE`);

--
-- Índices para tabela `jogador`
--
ALTER TABLE `jogador`
  ADD PRIMARY KEY (`COD_JOGADOR`),
  ADD KEY `FK_COD_TIME_JOG` (`COD_TIME`),
  ADD KEY `FK_COD_LIGA_JOG` (`COD_LIGA`);

--
-- Índices para tabela `liga`
--
ALTER TABLE `liga`
  ADD PRIMARY KEY (`COD_LIGA`),
  ADD KEY `FK_COD_PAIS` (`COD_PAIS`);

--
-- Índices para tabela `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`COD_PAIS`),
  ADD KEY `FK_COD_CONTINENTE` (`COD_CONTINENTE`);

--
-- Índices para tabela `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`COD_TECNICO`),
  ADD KEY `FK_COD_TIME_TEC` (`COD_TIME`),
  ADD KEY `FK_COD_LIGA_TEC` (`COD_LIGA`);

--
-- Índices para tabela `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`COD_TIME`),
  ADD KEY `FK_COD_LIGA` (`COD_LIGA`);

--
-- Índices para tabela `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`COD_TIPO`),
  ADD KEY `FK_COD_JOG` (`COD_JOGADOR`),
  ADD KEY `FK_COD_TEC` (`COD_TECNICO`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `continente`
--
ALTER TABLE `continente`
  MODIFY `COD_CONTINENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `jogador`
--
ALTER TABLE `jogador`
  MODIFY `COD_JOGADOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `liga`
--
ALTER TABLE `liga`
  MODIFY `COD_LIGA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `COD_TECNICO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tipo`
--
ALTER TABLE `tipo`
  MODIFY `COD_TIPO` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `jogador`
--
ALTER TABLE `jogador`
  ADD CONSTRAINT `FK_COD_LIGA_JOG` FOREIGN KEY (`COD_LIGA`) REFERENCES `liga` (`COD_LIGA`),
  ADD CONSTRAINT `FK_COD_TIME_JOG` FOREIGN KEY (`COD_TIME`) REFERENCES `time` (`COD_TIME`);

--
-- Limitadores para a tabela `liga`
--
ALTER TABLE `liga`
  ADD CONSTRAINT `FK_COD_PAIS` FOREIGN KEY (`COD_PAIS`) REFERENCES `pais` (`COD_PAIS`);

--
-- Limitadores para a tabela `pais`
--
ALTER TABLE `pais`
  ADD CONSTRAINT `FK_COD_CONTINENTE` FOREIGN KEY (`COD_CONTINENTE`) REFERENCES `continente` (`COD_CONTINENTE`);

--
-- Limitadores para a tabela `tecnico`
--
ALTER TABLE `tecnico`
  ADD CONSTRAINT `FK_COD_LIGA_TEC` FOREIGN KEY (`COD_LIGA`) REFERENCES `liga` (`COD_LIGA`),
  ADD CONSTRAINT `FK_COD_TIME_TEC` FOREIGN KEY (`COD_TIME`) REFERENCES `time` (`COD_TIME`);

--
-- Limitadores para a tabela `time`
--
ALTER TABLE `time`
  ADD CONSTRAINT `FK_COD_LIGA` FOREIGN KEY (`COD_LIGA`) REFERENCES `liga` (`COD_LIGA`);

--
-- Limitadores para a tabela `tipo`
--
ALTER TABLE `tipo`
  ADD CONSTRAINT `FK_COD_JOG` FOREIGN KEY (`COD_JOGADOR`) REFERENCES `jogador` (`COD_JOGADOR`),
  ADD CONSTRAINT `FK_COD_TEC` FOREIGN KEY (`COD_TECNICO`) REFERENCES `tecnico` (`COD_TECNICO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
