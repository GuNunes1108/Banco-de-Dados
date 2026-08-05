-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Ago-2026 às 22:46
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hotel`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `codclient` int(11) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `CPF` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`codclient`, `cliente`, `email`, `CPF`) VALUES
(6, 'Gustavo Nunes', 'gustavo@gmail.com', '333.666.999.66'),
(7, 'jeffrey dahamer', 'JDahamer@gmail.com', '433.666.999.86'),
(8, 'jean pierre polnfareff', 'polnareff@gmail.com', '533.666.999.76'),
(9, 'joaquim joãoestrela', 'joq@gmail.com', '633.666.999.56'),
(10, 'timoti timerious', 'TIM@gmail.com', '733.666.999.36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospedagem`
--

CREATE TABLE `hospedagem` (
  `idhospedagem` int(11) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date DEFAULT NULL,
  `horaentrada` time NOT NULL,
  `horasaida` time DEFAULT NULL,
  `codclie` int(11) DEFAULT NULL,
  `codquarto` int(11) DEFAULT NULL,
  `totalhospedagem` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `hospedagem`
--

INSERT INTO `hospedagem` (`idhospedagem`, `dataentrada`, `datasaida`, `horaentrada`, `horasaida`, `codclie`, `codquarto`, `totalhospedagem`) VALUES
(1, '2026-08-11', NULL, '06:07:42', NULL, 7, 24, NULL),
(2, '2025-04-01', NULL, '07:33:21', NULL, 10, 23, NULL),
(3, '2026-08-11', NULL, '11:08:09', NULL, 6, 19, NULL),
(4, '2026-10-29', NULL, '21:00:50', NULL, 8, 22, NULL),
(5, '2026-07-31', NULL, '06:00:00', NULL, 9, 13, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `quarto`
--

CREATE TABLE `quarto` (
  `codquarto` int(11) NOT NULL,
  `quarto` varchar(255) NOT NULL,
  `andar` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `quarto`
--

INSERT INTO `quarto` (`codquarto`, `quarto`, `andar`, `tipo`) VALUES
(13, '11', '1º andar', 'solteiro - 1 cama'),
(14, '12', '2º andar', 'solteiro - 2 camas'),
(15, '13', '3º andar', 'familia - 1 cama'),
(16, '14', '4º andar', 'familia - 2 camas'),
(17, '15', '5º andar', 'feminino - 1 cama'),
(18, '16', '6º andar', 'feminino - 2 camas'),
(19, '17', '7º andar', 'masculino - 1 cama'),
(20, '18', '8º andar', 'masculino - 2 camas'),
(21, '19', '9º andar', 'masculino - cama solteiro'),
(22, '20', '10º andar', 'feminino - cama solteiro'),
(23, '21', '11º andar', 'familia - suit master'),
(24, '22', '12º andar', 'suit presidencial');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `codservico` int(11) NOT NULL,
  `servico` varchar(255) NOT NULL,
  `qtd` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`codservico`, `servico`, `qtd`, `quantidade`, `valor`) VALUES
(1, 'pão de queijo', 0, 0, 1.00),
(2, 'sandwich', 0, 0, 5.00),
(3, 'p.f.', 0, 0, 25.00),
(4, 'água', 0, 0, 5.00),
(5, 'coca-cola', 0, 0, 20.00),
(6, 'café', 0, 0, 5.00),
(7, 'corte de cabelo', 0, 0, 30.00),
(8, 'fazer a barba', 0, 0, 25.00),
(9, 'pintar cabelo', 0, 0, 90.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicohospedagem`
--

CREATE TABLE `servicohospedagem` (
  `idhospedagem` int(11) DEFAULT NULL,
  `idservico` int(11) DEFAULT NULL,
  `dataservico` date DEFAULT NULL,
  `horaservico` time DEFAULT NULL,
  `horasaida` time DEFAULT NULL,
  `totalhospedagem` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `servicohospedagem`
--

INSERT INTO `servicohospedagem` (`idhospedagem`, `idservico`, `dataservico`, `horaservico`, `horasaida`, `totalhospedagem`) VALUES
(1, 1, '2026-08-11', '06:00:59', '06:02:24', NULL),
(3, 7, '2026-10-12', '18:03:32', '21:23:33', NULL),
(2, 2, '2026-12-16', '18:03:32', '19:23:33', NULL),
(4, 6, '2026-07-28', '04:32:12', '04:34:23', NULL),
(5, 9, '2026-08-11', '06:23:42', '06:42:43', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codclient`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Índices para tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD PRIMARY KEY (`idhospedagem`),
  ADD KEY `codclie` (`codclie`),
  ADD KEY `codquarto` (`codquarto`);

--
-- Índices para tabela `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`codquarto`),
  ADD UNIQUE KEY `andar` (`andar`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`codservico`);

--
-- Índices para tabela `servicohospedagem`
--
ALTER TABLE `servicohospedagem`
  ADD KEY `idhospedagem` (`idhospedagem`),
  ADD KEY `idservico` (`idservico`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codclient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  MODIFY `idhospedagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `quarto`
--
ALTER TABLE `quarto`
  MODIFY `codquarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `codservico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD CONSTRAINT `hospedagem_ibfk_1` FOREIGN KEY (`codclie`) REFERENCES `cliente` (`codclient`),
  ADD CONSTRAINT `hospedagem_ibfk_2` FOREIGN KEY (`codquarto`) REFERENCES `quarto` (`codquarto`);

--
-- Limitadores para a tabela `servicohospedagem`
--
ALTER TABLE `servicohospedagem`
  ADD CONSTRAINT `servicohospedagem_ibfk_1` FOREIGN KEY (`idhospedagem`) REFERENCES `hospedagem` (`idhospedagem`),
  ADD CONSTRAINT `servicohospedagem_ibfk_2` FOREIGN KEY (`idservico`) REFERENCES `servico` (`codservico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
