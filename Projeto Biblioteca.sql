CREATE TABLE Livros(
LivroID INT AUTO_INCREMENT PRIMARY KEY,
Título VARCHAR(255) NOT NULL,
Autor VARCHAR(255) NOT NULL,
Categoria VARCHAR (100),
AnoPublicacao INT,
Quantidade INT);

INSERT INTO Livros 
VALUES
(1, 'Dom Quixote', 'Miguel Cervantes', 'Romance', 1605, 5),
(2, '1984', 'George Orwell', 'Distopia', 1949, 3),
(3, 'O Senhor dos Anéis', 'J.R.R. Tolkien', 'Fantasia', 1954, 7),
(4, 'Moby Dick', 'Herman Melville', 'Aventura', 1851, 4),
(5, 'Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 6),
(6, 'O Alquimista', 'Paulo Coelho', 'Ficção', 1988, 8),
(7, 'Cem Anos de Solidão', 'Gabriel Garcia  Marquez', 'Realismo Mágico', 1967, 5),
(8, 'Harry Poter e a Pedra Filosofal', 'J.K. Rowling', 'Fantasia', 1997, 10),
(9, 'O Pequeno Príncipe', 'Antonie de Saint-Exupéry', 'Infantil', 1943, 12),
(10, 'Guerra e Paz', 'Liev Tolstói', 'Histórico', 1869, 2);

SELECT*FROM livros;

CREATE TABLE Membros(
MembroID INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Endereço VARCHAR(255),
Telefone VARCHAR(255),
Email VARCHAR(100),
DataInscricao DATE
);

INSERT INTO Membros
VALUES
(1, 'Ana Souza', 'Rua das Flores, 123', '(11) 1234-5678', 'ana.souza@email.com', '2024-01-05'),
(2, 'Bruno Ferreira', 'Avenida Paulista, 456', '(11) 8765-4321', 'bruno.ferreira@email.com', '2024-01-10'),
(3, 'Carlos Lima', 'Rua das Palmeiras, 789', '(21) 1234-5678', 'carlos.lima@email.com', '2024-01-15'),
(4, 'Daniela Santos', 'Avenida Brasil, 1011', '(21) 8765-4321', 'daniela.santos@email.com', '2024-01-20'),
(5, 'Eduardo Pereira', 'Rua dos Jacarandás, 1213', '(31) 1234-5678', 'eduardo.pereira@email.com', '2024-01-25'),
(6, 'Fernanda Oliveira', 'Avenida das Nações, 1415', '(31) 8765-4321', 'fernanda.oliveira@email.com', '2024-02-01'),
(7, 'Gabriela Costa', 'Rua das Acácias, 1617', '(41) 1234-5678', 'gabriela.costa@email.com', '2024-02-05'),
(8, 'Henrique Martins', 'Avenida Independência, 1819', '(41) 8765-4321', 'henrique.martins@email.com', '2024-02-10'),
(9, 'Isabela Rocha', 'Rua dos Ipês, 2021', '(51) 1234-5678', 'isabela.rocha@email.com', '2024-02-15'),
(10, 'João Almeida', 'Avenida Liberdade, 2223', '(51) 8765-4321', 'joao.almeida@email.com', '2024-02-20');

SELECT*FROM membros;

CREATE TABLE Empréstimos(
EmprestimoID INT AUTO_INCREMENT PRIMARY KEY,
MembroID INT,
LivroID INT,
DataEmprestimo DATE,
DataDevolucao DATE,
DataDevolvido DATE,
Situação VARCHAR(20),
FOREIGN KEY (MembroID) REFERENCES Membros(MembroID),
FOREIGN KEY (LivroID) REFERENCES Livros(LivroID)
); 

INSERT INTO Empréstimos
VALUES
(1, 1, 1, '2024-01-10', '2024-01-24', NULL, 'Emprestado'),
(2, 2, 2, '2024-01-11', '2024-01-25', '2024-01-23', 'Devolvido'),
(3, 3, 3, '2024-01-12', '2024-01-26', NULL, 'Emprestado'),
(4, 4, 4, '2024-01-13', '2024-01-27', '2024-01-25', 'Devolvido'),
(5, 5, 5, '2024-01-14', '2024-01-28', NULL, 'Emprestado'),
(6, 6, 6, '2024-01-15', '2024-01-29', '2024-01-28', 'Devolvido'),
(7, 7, 7, '2024-01-16', '2024-01-30', NULL, 'Emprestado'),
(8, 8, 8, '2024-01-17', '2024-01-31', NULL, 'Emprestado'),
(9, 9, 9, '2024-01-18', '2024-02-01', NULL, 'Emprestado'),
(10, 10, 10, '2024-01-19', '2024-02-02', '2024-01-30', 'Devoldido'),
(11, 3, 3, '2024-02-10', '2024-03-10', '2024-03-05', 'Devolvido'),
(12, 6, 6, '2024-02-18', '2024-03-18', NULL,'Emprestado');


ALTER TABLE Empréstimos ADD Multa DECIMAL(5,2);

UPDATE Empréstimos
SET Multa = DATEDIFF(CURDATE(), DataDevolucao) * 0.25
WHERE Situação = 'Emprestado' AND CURDATE() > DataDevolucao;

ALTER TABLE Empréstimos ADD DiasDeEmpréstimo INT;

UPDATE Empréstimos
SET DiasDeEmpréstimo = DATEDIFF(DataDevolvido, DataEmprestimo)
WHERE  Situação = 'Devolvido'; 

ALTER TABLE Empréstimos ADD COLUMN DiasAtraso INT;

UPDATE Empréstimos
SET DiasAtraso = CASE
					WHEN COALESCE(DataDevolvido, CURRENT_DATE) > DataDevolucao
                    THEN DATEDIFF(COALESCE(DataDevolvido, CURRENT_DATE), DataDevolucao)
                    ELSE 0
				END;
                
SELECT*FROM Empréstimos;
