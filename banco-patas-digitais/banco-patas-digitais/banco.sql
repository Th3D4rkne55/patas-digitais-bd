
CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  telefone VARCHAR(20),
  data_nascimento DATE NOT NULL,
  senha VARCHAR(255) NOT NULL,
  tipo_usuario ENUM('usuario', 'admin') DEFAULT 'usuario',
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE animais (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo VARCHAR(20) NOT NULL UNIQUE,
  nome VARCHAR(100) NOT NULL,
  idade VARCHAR(50),
  porte ENUM('Pequeno', 'Médio', 'Grande'),
  doencas TEXT,
  instituicao VARCHAR(100),
  status ENUM('Disponível', 'Adotado') DEFAULT 'Disponível',
  imagens TEXT,
  id_usuario INT,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

INSERT INTO usuarios (nome, email, telefone, data_nascimento, senha, tipo_usuario)
VALUES
('João Silva', 'joao@email.com', '67999990000', '1990-05-10', 'senha123', 'usuario'),
('Maria Oliveira', 'maria@email.com', '67988880000', '1985-07-22', 'senha123', 'usuario'),
('Admin Patas', 'admin@patas.com', '67977770000', '1995-09-15', 'admin123', 'admin');

INSERT INTO animais (codigo, nome, idade, porte, doencas, instituicao, status, imagens, id_usuario)
VALUES
('AN001', 'Bidu', '2 anos', 'Pequeno', '', 'Amigos dos Animais', 'Disponível', 'uploads/bidu.jpg', 1),
('AN002', 'Mingau', '1 ano', 'Médio', 'Alergia alimentar', 'PetHelp', 'Disponível', 'uploads/mingau.jpg', 2),
('AN003', 'Thor', '3 anos', 'Grande', 'Nenhuma', 'Vida Pet', 'Adotado', 'uploads/thor.jpg', 1);
