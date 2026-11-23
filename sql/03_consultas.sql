
-- CONSULTAS DO BANCO DE DADOS
-- PROJETO BIBLIOTECA UNIVERSITARIA

-- 1. Consultar todos os emprestimos
SELECT
    e.id_emprestimo,
    u.nome_usuario,
    l.titulo,
    a.nome_autor,
    ed.nome_editora,
    e.data_emprestimo,
    e.data_devolucao,
    e.status
FROM Emprestimos e
JOIN Usuarios u ON e.id_usuario = u.id_usuario
JOIN Exemplares ex ON e.id_exemplar = ex.id_exemplar
JOIN Livros l ON ex.id_livro = l.id_livro
JOIN Autores a ON l.id_autor = a.id_autor
JOIN Editoras ed ON l.id_editora = ed.id_editora;

-- 2. Consultar emprestimos em andamento
SELECT *
FROM Emprestimos
WHERE status = 'Em andamento';

-- 3. Consultar livros disponiveis
SELECT
    l.titulo,
    ex.id_exemplar,
    ex.status
FROM Livros l
JOIN Exemplares ex ON l.id_livro = ex.id_livro
WHERE ex.status = 'Disponível';

-- 4. Consultar emprestimos por data de devolucao
SELECT *
FROM Emprestimos
ORDER BY data_devolucao;

-- 5. Quantidade de emprestimos por usuario
SELECT
    u.nome_usuario,
    COUNT(e.id_emprestimo) AS total_emprestimos
FROM Usuarios u
LEFT JOIN Emprestimos e ON u.id_usuario = e.id_usuario
GROUP BY u.id_usuario, u.nome_usuario;
