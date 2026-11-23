
-- REFATORAÇÃO DO BANCO DE DADOS
-- Biblioteca Universitária - SQLite

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS emprestimos;
DROP TABLE IF EXISTS livros;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS autores;
DROP TABLE IF EXISTS editoras;

-- 1. Autores
CREATE TABLE autores (
    autor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_autor TEXT NOT NULL UNIQUE
);

-- 2. Editoras
CREATE TABLE editoras (
    editora_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_editora TEXT NOT NULL UNIQUE
);

-- 3. Usuários
CREATE TABLE usuarios (
    usuario_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_usuario TEXT NOT NULL UNIQUE
);

-- 4. Livros
CREATE TABLE livros (
    livro_id INTEGER PRIMARY KEY AUTOINCREMENT,
    isbn TEXT NOT NULL UNIQUE,
    autor_id INTEGER NOT NULL,
    editora_id INTEGER NOT NULL,
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id),
    FOREIGN KEY (editora_id) REFERENCES editoras(editora_id)
);

-- 5. Empréstimos
CREATE TABLE emprestimos (
    emprestimo_id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    livro_id INTEGER NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (livro_id) REFERENCES livros(livro_id)
);

-- Inserir autores
INSERT INTO autores (nome_autor)
SELECT DISTINCT nome_autor
FROM emprestimos_biblioteca;

-- Inserir editoras
INSERT INTO editoras (nome_editora)
SELECT DISTINCT editora
FROM emprestimos_biblioteca;

-- Inserir usuários
INSERT INTO usuarios (nome_usuario)
SELECT DISTINCT usuario
FROM emprestimos_biblioteca;

-- Inserir livros
INSERT INTO livros (isbn, autor_id, editora_id)
SELECT DISTINCT
    b.isbn,
    a.autor_id,
    e.editora_id
FROM emprestimos_biblioteca b
JOIN autores a ON a.nome_autor = b.nome_autor
JOIN editoras e ON e.nome_editora = b.editora;

-- Inserir empréstimos
INSERT INTO emprestimos (usuario_id, livro_id, data_devolucao)
SELECT
    u.usuario_id,
    l.livro_id,
    b.data_devolucao
FROM emprestimos_biblioteca b
JOIN usuarios u ON u.nome_usuario = b.usuario
JOIN livros l ON l.isbn = b.isbn;

-- Índice na data de devolução
CREATE INDEX idx_emprestimos_data_devolucao
ON emprestimos(data_devolucao);
