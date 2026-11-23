-- Biblioteca Universitária - 50 registros e 5 colunas
-- Compatível com SQLite (SQL Online mostrado na imagem).
-- A coluna data_devolucao guarda a data efetiva de devolução.
-- O índice idx_data_devolucao é criado separadamente sobre essa coluna.

DROP TABLE IF EXISTS emprestimos_biblioteca;

CREATE TABLE emprestimos_biblioteca (
    usuario TEXT NOT NULL,
    nome_autor TEXT NOT NULL,
    editora TEXT NOT NULL,
    isbn TEXT NOT NULL,
    data_devolucao DATE
);

INSERT INTO emprestimos_biblioteca
(usuario, nome_autor, editora, isbn, data_devolucao) VALUES
    ('Ana Souza', 'Mariana Costa', 'Editora Acadêmica', '9780000000001', NULL),
    ('Bruno Alves', 'Luciana Alves', 'Saber Mais', '9780000000004', '2026-01-18'),
    ('Carla Mendes', 'Mariana Costa', 'Editora Acadêmica', '9780000000007', '2026-01-21'),
    ('Daniel Lima', 'Carlos Nunes', 'Editora Horizonte', '9780000000010', '2026-01-24'),
    ('Eduarda Costa', 'Paulo Mendes', 'Saber Mais', '9780000000003', '2026-01-27'),
    ('Felipe Rocha', 'Mariana Costa', 'Editora Acadêmica', '9780000000007', NULL),
    ('Gabriela Santos', 'Carlos Nunes', 'Editora Horizonte', '9780000000010', '2026-02-02'),
    ('Heitor Martins', 'Paulo Mendes', 'Saber Mais', '9780000000003', '2026-01-29'),
    ('Isabela Ribeiro', 'Fernanda Reis', 'Editora Horizonte', '9780000000006', '2026-02-01'),
    ('João Oliveira', 'Luciana Alves', 'Saber Mais', '9780000000009', '2026-02-04'),
    ('Ana Souza', 'Paulo Mendes', 'Saber Mais', '9780000000003', NULL),
    ('Bruno Alves', 'Fernanda Reis', 'Editora Horizonte', '9780000000006', '2026-02-10'),
    ('Carla Mendes', 'Luciana Alves', 'Saber Mais', '9780000000009', '2026-02-13'),
    ('Daniel Lima', 'Rafael Lima', 'Conhecimento Aberto', '9780000000002', '2026-02-16'),
    ('Eduarda Costa', 'Carlos Nunes', 'Editora Horizonte', '9780000000005', '2026-02-12'),
    ('Felipe Rocha', 'Luciana Alves', 'Saber Mais', '9780000000009', NULL),
    ('Gabriela Santos', 'Rafael Lima', 'Conhecimento Aberto', '9780000000002', '2026-02-18'),
    ('Heitor Martins', 'Carlos Nunes', 'Editora Horizonte', '9780000000005', '2026-02-21'),
    ('Isabela Ribeiro', 'Rafael Lima', 'Conhecimento Aberto', '9780000000008', '2026-02-24'),
    ('João Oliveira', 'Mariana Costa', 'Editora Acadêmica', '9780000000001', '2026-02-27'),
    ('Ana Souza', 'Carlos Nunes', 'Editora Horizonte', '9780000000005', NULL),
    ('Bruno Alves', 'Rafael Lima', 'Conhecimento Aberto', '9780000000008', '2026-02-26'),
    ('Carla Mendes', 'Mariana Costa', 'Editora Acadêmica', '9780000000001', '2026-03-01'),
    ('Daniel Lima', 'Luciana Alves', 'Saber Mais', '9780000000004', '2026-03-04'),
    ('Eduarda Costa', 'Mariana Costa', 'Editora Acadêmica', '9780000000007', '2026-03-07'),
    ('Felipe Rocha', 'Mariana Costa', 'Editora Acadêmica', '9780000000001', NULL),
    ('Gabriela Santos', 'Luciana Alves', 'Saber Mais', '9780000000004', '2026-03-13'),
    ('Heitor Martins', 'Mariana Costa', 'Editora Acadêmica', '9780000000007', '2026-03-16'),
    ('Isabela Ribeiro', 'Carlos Nunes', 'Editora Horizonte', '9780000000010', '2026-03-12'),
    ('João Oliveira', 'Paulo Mendes', 'Saber Mais', '9780000000003', '2026-03-15'),
    ('Ana Souza', 'Mariana Costa', 'Editora Acadêmica', '9780000000007', NULL),
    ('Bruno Alves', 'Carlos Nunes', 'Editora Horizonte', '9780000000010', '2026-03-21'),
    ('Carla Mendes', 'Paulo Mendes', 'Saber Mais', '9780000000003', '2026-03-24'),
    ('Daniel Lima', 'Fernanda Reis', 'Editora Horizonte', '9780000000006', '2026-03-27'),
    ('Eduarda Costa', 'Luciana Alves', 'Saber Mais', '9780000000009', '2026-03-30'),
    ('Felipe Rocha', 'Paulo Mendes', 'Saber Mais', '9780000000003', NULL),
    ('Gabriela Santos', 'Fernanda Reis', 'Editora Horizonte', '9780000000006', '2026-03-29'),
    ('Heitor Martins', 'Luciana Alves', 'Saber Mais', '9780000000009', '2026-04-01'),
    ('Isabela Ribeiro', 'Rafael Lima', 'Conhecimento Aberto', '9780000000002', '2026-04-04'),
    ('João Oliveira', 'Carlos Nunes', 'Editora Horizonte', '9780000000005', '2026-04-07'),
    ('Ana Souza', 'Luciana Alves', 'Saber Mais', '9780000000009', NULL),
    ('Bruno Alves', 'Rafael Lima', 'Conhecimento Aberto', '9780000000002', '2026-04-13'),
    ('Carla Mendes', 'Carlos Nunes', 'Editora Horizonte', '9780000000005', '2026-04-09'),
    ('Daniel Lima', 'Rafael Lima', 'Conhecimento Aberto', '9780000000008', '2026-04-12'),
    ('Eduarda Costa', 'Mariana Costa', 'Editora Acadêmica', '9780000000001', '2026-04-15'),
    ('Felipe Rocha', 'Carlos Nunes', 'Editora Horizonte', '9780000000005', NULL),
    ('Gabriela Santos', 'Rafael Lima', 'Conhecimento Aberto', '9780000000008', '2026-04-21'),
    ('Heitor Martins', 'Mariana Costa', 'Editora Acadêmica', '9780000000001', '2026-04-24'),
    ('Isabela Ribeiro', 'Luciana Alves', 'Saber Mais', '9780000000004', '2026-04-27'),
    ('João Oliveira', 'Mariana Costa', 'Editora Acadêmica', '9780000000007', '2026-04-23');

-- Criar índice na data de devolução (o índice não é uma coluna).
CREATE INDEX idx_data_devolucao
ON emprestimos_biblioteca (data_devolucao);

-- Mostrar todos os 50 registros:
SELECT * FROM emprestimos_biblioteca;

-- Mostrar apenas os empréstimos que já foram devolvidos:
SELECT * FROM emprestimos_biblioteca
WHERE data_devolucao IS NOT NULL
ORDER BY data_devolucao;

-- Conferir a quantidade de registros:
SELECT COUNT(*) AS total_registros FROM emprestimos_biblioteca;
