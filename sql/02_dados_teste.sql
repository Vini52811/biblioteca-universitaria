
-- DADOS DE TESTE DA BIBLIOTECA

INSERT INTO Autores (nome_autor) VALUES
('Machado de Assis'),
('Clarice Lispector'),
('Monteiro Lobato');

INSERT INTO Editoras (nome_editora) VALUES
('Editora Moderna'),
('Companhia das Letras'),
('Editora Ática');

INSERT INTO Livros (titulo, isbn, id_autor, id_editora) VALUES
('Dom Casmurro', '9780000000001', 1, 2),
('A Hora da Estrela', '9780000000002', 2, 2),
('O Sítio do Picapau Amarelo', '9780000000003', 3, 3);

INSERT INTO Exemplares (id_livro, status) VALUES
(1, 'Emprestado'),
(1, 'Disponível'),
(2, 'Emprestado'),
(3, 'Disponível');

INSERT INTO Usuarios (nome_usuario, email) VALUES
('João Silva', 'joao@email.com'),
('Maria Santos', 'maria@email.com'),
('Pedro Oliveira', 'pedro@email.com');

INSERT INTO Emprestimos
(id_exemplar, id_usuario, data_emprestimo, data_devolucao, status)
VALUES
(1, 1, '2026-11-01', '2026-11-15', 'Concluído'),
(3, 2, '2026-11-10', '2026-11-25', 'Em andamento');
