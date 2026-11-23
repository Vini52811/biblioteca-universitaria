
-- PROJETO: BIBLIOTECA UNIVERSITÁRIA
-- TEMA 12: REFATORAÇÃO DO BANCO DE DADOS

PRAGMA foreign_keys = ON;

-- 1. TABELA DE AUTORES
CREATE TABLE IF NOT EXISTS Autores (
    id_autor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_autor TEXT NOT NULL
);

-- 2. TABELA DE EDITORAS
CREATE TABLE IF NOT EXISTS Editoras (
    id_editora INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_editora TEXT NOT NULL
);

-- 3. TABELA DE LIVROS
CREATE TABLE IF NOT EXISTS Livros (
    id_livro INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    isbn TEXT NOT NULL UNIQUE,
    id_autor INTEGER NOT NULL,
    id_editora INTEGER NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor),
    FOREIGN KEY (id_editora) REFERENCES Editoras(id_editora)
);

-- 4. TABELA DE EXEMPLARES
CREATE TABLE IF NOT EXISTS Exemplares (
    id_exemplar INTEGER PRIMARY KEY AUTOINCREMENT,
    id_livro INTEGER NOT NULL,
    status TEXT NOT NULL DEFAULT 'Disponível',
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro)
);

-- 5. TABELA DE USUÁRIOS
CREATE TABLE IF NOT EXISTS Usuarios (
    id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_usuario TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

-- 6. TABELA DE EMPRÉSTIMOS
CREATE TABLE IF NOT EXISTS Emprestimos (
    id_emprestimo INTEGER PRIMARY KEY AUTOINCREMENT,
    id_exemplar INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL,
    data_emprestimo TEXT NOT NULL,
    data_devolucao TEXT,
    status TEXT NOT NULL DEFAULT 'Em andamento',
    FOREIGN KEY (id_exemplar) REFERENCES Exemplares(id_exemplar),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- ÍNDICE PARA AGILIZAR CONSULTAS POR DATA DE DEVOLUÇÃO
CREATE INDEX IF NOT EXISTS idx_emprestimos_data_devolucao
ON Emprestimos(data_devolucao);
