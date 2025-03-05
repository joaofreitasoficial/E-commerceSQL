CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_Cliente ENUM('PJ', 'PF') NOT NULL,
    Nome_Razao_Social VARCHAR(100) NOT NULL,
    CPF_CNPJ VARCHAR(20) UNIQUE NOT NULL,
    Endereco VARCHAR(200),
    Telefone VARCHAR(15)
);

CREATE TABLE Pagamento (
    ID_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Forma_Pagamento ENUM('Cartão', 'Boleto', 'Pix') NOT NULL,
    Detalhes_Pagamento VARCHAR(200),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Pedido (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Status_Pedido ENUM('Aguardando', 'Em andamento', 'Concluído') NOT NULL,
    Data_Pedido DATE NOT NULL,
    Valor_Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Entrega (
    ID_Entrega INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido INT,
    Status_Entrega ENUM('Pendente', 'Em trânsito', 'Entregue') NOT NULL,
    Codigo_Rastreio VARCHAR(50) NOT NULL,
    Data_Prevista DATE,
    Data_Entrega DATE,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

CREATE TABLE Produto (
    ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(200),
    Valor DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Fornecedor (
    ID_Fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(20) UNIQUE NOT NULL,
    Endereco VARCHAR(200),
    Telefone VARCHAR(15)
);

CREATE TABLE Estoque (
    ID_Estoque INT AUTO_INCREMENT PRIMARY KEY,
    Local VARCHAR(100) NOT NULL
);

CREATE TABLE Produto_Fornecedor (
    ID_Produto INT,
    ID_Fornecedor INT,
    Quantidade INT,
    PRIMARY KEY (ID_Produto, ID_Fornecedor),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto),
    FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedor(ID_Fornecedor)
);

CREATE TABLE Produto_Estoque (
    ID_Produto INT,
    ID_Estoque INT,
    Quantidade INT,
    PRIMARY KEY (ID_Produto, ID_Estoque),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto),
    FOREIGN KEY (ID_Estoque) REFERENCES Estoque(ID_Estoque)
);

CREATE TABLE Vendedor (
    ID_Vendedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Endereco VARCHAR(200),
    Telefone VARCHAR(15)
);

CREATE TABLE Produto_Vendedor (
    ID_Produto INT,
    ID_Vendedor INT,
    Quantidade INT,
    PRIMARY KEY (ID_Produto, ID_Vendedor),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto),
    FOREIGN KEY (ID_Vendedor) REFERENCES Vendedor(ID_Vendedor)
);
