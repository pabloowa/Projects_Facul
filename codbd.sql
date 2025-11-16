
CREATE TABLE Cliente (
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
telefone VARCHAR(20),
email VARCHAR(100),
endereco TEXT
);

CREATE TABLE Pet (
id_pet INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
especie VARCHAR(30),
raca VARCHAR(50),
idade INT,
historico_saude TEXT,
id_cliente INT,
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Produto (
id_produto INT PRIMARY KEY AUTO_INCREMENT,
Modelagem do Banco de Dados - Essencial Pet
nome VARCHAR(100),
categoria VARCHAR(50),
preco DECIMAL(10,2),
quantidade_estoque INT,
estoque_mínimo INT
);

CREATE TABLE Funcionario (
id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
funcao VARCHAR(50),
telefone VARCHAR(20),
disponibilidade BOOLEAN
);

CREATE TABLE Servico (
id_servico INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(100),
duracao INT,
preco DECIMAL(10,2),
id_funcionario INT,
FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);


CREATE TABLE Agendamento (
id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
data DATE,
horario TIME,
Modelagem do Banco de Dados - Essencial Pet
status VARCHAR(30),
id_pet INT,
id_servico INT,
FOREIGN KEY (id_pet) REFERENCES Pet(id_pet),
FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

CREATE TABLE HistoricoAtendimento (
id_atendimento INT PRIMARY KEY AUTO_INCREMENT,
id_pet INT,
id_servico INT,
data_realizacao DATE,
observacoes TEXT,
FOREIGN KEY (id_pet) REFERENCES Pet(id_pet),
FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);
