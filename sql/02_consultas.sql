-- 1. Quantidade total de empréstimos
SELECT COUNT(*) AS total_emprestimos
FROM emprestimos;

-- 2. Empréstimos ainda não devolvidos
SELECT *
FROM emprestimos
WHERE data_devolucao IS NULL;

-- 3. Empréstimos já devolvidos
SELECT *
FROM emprestimos
WHERE data_devolucao IS NOT NULL
ORDER BY data_devolucao;

-- 4. Livros e seus autores
SELECT
    livros.isbn,
    autores.nome_autor,
    editoras.nome_editora
FROM livros
JOIN autores ON livros.autor_id = autores.autor_id
JOIN editoras ON livros.editora_id = editoras.editora_id;

-- 5. Quantidade de empréstimos por usuário
SELECT
    usuarios.nome_usuario,
    COUNT(emprestimos.emprestimo_id) AS quantidade
FROM usuarios
JOIN emprestimos ON usuarios.usuario_id = emprestimos.usuario_id
GROUP BY usuarios.nome_usuario;
