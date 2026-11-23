
-- REFATORAÇÃO DO BANCO DE DADOS DA BIBLIOTECA
-- Banco: PostgreSQL

-- 1. Tabela de autores
CREATE TABLE autores (
    autor_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    autor_nome VARCHAR(150) UNIQUE NOT NULL
);

-- 2. Tabela de editoras
CREATE TABLE editoras (
    editora_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    editora_nome VARCHAR(150) UNIQUE NOT NULL
);

-- 3. Tabela de usuários
CREATE TABLE usuarios (
    usuario_id INTEGER PRIMARY KEY,
    nome_usuario VARCHAR(150) NOT NULL,
    email_usuario VARCHAR(150),
    curso VARCHAR(100)
);

-- 4. Tabela de livros
CREATE TABLE livros (
    livro_id INTEGER PRIMARY KEY,
    isbn VARCHAR(30),
    titulo_livro VARCHAR(200) NOT NULL,
    ano_publicacao INTEGER,
    categoria VARCHAR(100),
    autor_id INTEGER REFERENCES autores(autor_id),
    editora_id INTEGER REFERENCES editoras(editora_id)
);

-- 5. Tabela de exemplares
CREATE TABLE exemplares (
    exemplar_codigo VARCHAR(50) PRIMARY KEY,
    livro_id INTEGER NOT NULL REFERENCES livros(livro_id)
);

-- 6. Tabela de funcionários
CREATE TABLE funcionarios (
    funcionario_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_funcionario VARCHAR(150) UNIQUE NOT NULL
);

-- 7. Tabela de campi
CREATE TABLE campi (
    campus_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_campus VARCHAR(150) UNIQUE NOT NULL
);

-- 8. Tabela de empréstimos
CREATE TABLE emprestimos (
    emprestimo_id INTEGER PRIMARY KEY,
    usuario_id INTEGER NOT NULL REFERENCES usuarios(usuario_id),
    exemplar_codigo VARCHAR(50) NOT NULL REFERENCES exemplares(exemplar_codigo),
    data_emprestimo DATE,
    data_prevista DATE,
    data_devolucao DATE,
    status_emprestimo VARCHAR(50),
    funcionario_id INTEGER REFERENCES funcionarios(funcionario_id),
    campus_id INTEGER REFERENCES campi(campus_id),
    observacoes TEXT
);

-- ÍNDICE PARA FACILITAR A BUSCA PELA DATA DE DEVOLUÇÃO
CREATE INDEX idx_emprestimos_data_devolucao
ON emprestimos(data_devolucao);

-- ==========================================
-- MIGRAÇÃO DOS DADOS DA TABELA ORIGINAL
-- ==========================================

INSERT INTO autores (autor_nome)
SELECT DISTINCT autor_nome
FROM emprestimos_biblioteca
WHERE autor_nome IS NOT NULL
ON CONFLICT (autor_nome) DO NOTHING;

INSERT INTO editoras (editora_nome)
SELECT DISTINCT editora_nome
FROM emprestimos_biblioteca
WHERE editora_nome IS NOT NULL
ON CONFLICT (editora_nome) DO NOTHING;

INSERT INTO usuarios
SELECT DISTINCT ON (usuario_id)
    usuario_id, nome_usuario, email_usuario, curso
FROM emprestimos_biblioteca
ORDER BY usuario_id;

INSERT INTO livros (
    livro_id, isbn, titulo_livro, ano_publicacao,
    categoria, autor_id, editora_id
)
SELECT DISTINCT ON (b.livro_id)
    b.livro_id,
    b.isbn,
    b.titulo_livro,
    b.ano_publicacao,
    b.categoria,
    a.autor_id,
    e.editora_id
FROM emprestimos_biblioteca b
LEFT JOIN autores a ON a.autor_nome = b.autor_nome
LEFT JOIN editoras e ON e.editora_nome = b.editora_nome
ORDER BY b.livro_id;

INSERT INTO exemplares (exemplar_codigo, livro_id)
SELECT DISTINCT ON (exemplar_codigo)
    exemplar_codigo, livro_id
FROM emprestimos_biblioteca
ORDER BY exemplar_codigo;

INSERT INTO funcionarios (nome_funcionario)
SELECT DISTINCT funcionario_responsavel
FROM emprestimos_biblioteca
WHERE funcionario_responsavel IS NOT NULL
ON CONFLICT (nome_funcionario) DO NOTHING;

INSERT INTO campi (nome_campus)
SELECT DISTINCT campus
FROM emprestimos_biblioteca
WHERE campus IS NOT NULL
ON CONFLICT (nome_campus) DO NOTHING;

INSERT INTO emprestimos (
    emprestimo_id, usuario_id, exemplar_codigo,
    data_emprestimo, data_prevista, data_devolucao,
    status_emprestimo, funcionario_id, campus_id, observacoes
)
SELECT
    b.emprestimo_id,
    b.usuario_id,
    b.exemplar_codigo,
    b.data_emprestimo,
    b.data_prevista,
    b.data_devolucao,
    b.status_emprestimo,
    f.funcionario_id,
    c.campus_id,
    b.observacoes
FROM emprestimos_biblioteca b
LEFT JOIN funcionarios f
    ON f.nome_funcionario = b.funcionario_responsavel
LEFT JOIN campi c
    ON c.nome_campus = b.campus;
