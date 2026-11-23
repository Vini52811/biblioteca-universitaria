-- Banco de dados de exemplo: Biblioteca Universitária
-- Estrutura solicitada: 1 tabela com 20 colunas e 50 registros fictícios.
-- Compatível com PostgreSQL (DB Fiddle / SQL Online configurado para PostgreSQL).
-- Esta tabela representa uma base inicial NÃO NORMALIZADA, com dados de livro repetidos
-- em cada empréstimo. Ela pode ser usada como ponto de partida para a atividade de refatoração.

DROP TABLE IF EXISTS emprestimos_biblioteca;

CREATE TABLE emprestimos_biblioteca (
    emprestimo_id INTEGER PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    nome_usuario VARCHAR(100) NOT NULL,
    email_usuario VARCHAR(120) NOT NULL,
    curso VARCHAR(80) NOT NULL,
    exemplar_codigo VARCHAR(20) NOT NULL,
    livro_id INTEGER NOT NULL,
    isbn VARCHAR(20) NOT NULL,
    titulo_livro VARCHAR(150) NOT NULL,
    autor_nome VARCHAR(100) NOT NULL,
    editora_nome VARCHAR(100) NOT NULL,
    ano_publicacao INTEGER NOT NULL,
    categoria VARCHAR(60) NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) NOT NULL,
    funcionario_responsavel VARCHAR(100) NOT NULL,
    campus VARCHAR(60) NOT NULL,
    observacoes VARCHAR(200)
);

INSERT INTO emprestimos_biblioteca (
    emprestimo_id, usuario_id, nome_usuario, email_usuario, curso, exemplar_codigo,
    livro_id, isbn, titulo_livro, autor_nome, editora_nome, ano_publicacao, categoria,
    data_emprestimo, data_prevista, data_devolucao, status_emprestimo,
    funcionario_responsavel, campus, observacoes
) VALUES
    (1, 2, 'Bruno Alves', 'bruno.alves@aluno.exemplo.edu.br', 'Engenharia', 'EX-04-02', 4, '9780000000004', 'Gestão de Projetos', 'Paulo Mendes', 'Saber Mais', 2020, 'Administração', '2026-01-07', '2026-01-21', '2026-01-20', 'Devolvido', 'Patrícia Gomes', 'Campus Norte', 'Renovação solicitada'),
    (2, 3, 'Carla Mendes', 'carla.mendes@aluno.exemplo.edu.br', 'Sistemas de Informação', 'EX-07-03', 7, '9780000000007', 'Redes de Computadores', 'Rafael Lima', 'Conhecimento Aberto', 2024, 'Tecnologia', '2026-01-09', '2026-01-23', '2026-01-21', 'Devolvido', 'Renato Souza', 'Campus Sul', 'Livro em bom estado'),
    (3, 4, 'Daniel Lima', 'daniel.lima@aluno.exemplo.edu.br', 'Direito', 'EX-10-04', 10, '9780000000010', 'Pesquisa Científica', 'Luciana Alves', 'Saber Mais', 2023, 'Humanas', '2026-01-11', '2026-01-25', '2026-01-25', 'Devolvido', 'Sílvia Martins', 'Campus Centro', 'Devolução no balcão'),
    (4, 5, 'Eduarda Costa', 'eduarda.costa@aluno.exemplo.edu.br', 'Pedagogia', 'EX-04-01', 4, '9780000000004', 'Gestão de Projetos', 'Paulo Mendes', 'Saber Mais', 2020, 'Administração', '2026-01-13', '2026-01-27', NULL, 'Em aberto', 'Marcos Silva', 'Campus Norte', 'Aguardando devolução'),
    (5, 6, 'Felipe Rocha', 'felipe.rocha@aluno.exemplo.edu.br', 'Administração', 'EX-07-02', 7, '9780000000007', 'Redes de Computadores', 'Rafael Lima', 'Conhecimento Aberto', 2024, 'Tecnologia', '2026-01-15', '2026-01-29', '2026-01-27', 'Devolvido', 'Patrícia Gomes', 'Campus Sul', NULL),
    (6, 7, 'Gabriela Santos', 'gabriela.santos@aluno.exemplo.edu.br', 'Engenharia', 'EX-10-03', 10, '9780000000010', 'Pesquisa Científica', 'Luciana Alves', 'Saber Mais', 2023, 'Humanas', '2026-01-17', '2026-01-31', '2026-01-31', 'Devolvido', 'Renato Souza', 'Campus Centro', 'Renovação solicitada'),
    (7, 8, 'Heitor Martins', 'heitor.martins@aluno.exemplo.edu.br', 'Sistemas de Informação', 'EX-03-04', 3, '9780000000003', 'Aprendendo SQL', 'Mariana Costa', 'Editora Acadêmica', 2023, 'Tecnologia', '2026-01-19', '2026-02-02', '2026-02-01', 'Devolvido', 'Sílvia Martins', 'Campus Norte', 'Livro em bom estado'),
    (8, 9, 'Isabela Ribeiro', 'isabela.ribeiro@aluno.exemplo.edu.br', 'Direito', 'EX-07-01', 7, '9780000000007', 'Redes de Computadores', 'Rafael Lima', 'Conhecimento Aberto', 2024, 'Tecnologia', '2026-01-21', '2026-02-04', NULL, 'Em aberto', 'Marcos Silva', 'Campus Sul', 'Devolução no balcão'),
    (9, 10, 'João Oliveira', 'joão.oliveira@aluno.exemplo.edu.br', 'Pedagogia', 'EX-10-02', 10, '9780000000010', 'Pesquisa Científica', 'Luciana Alves', 'Saber Mais', 2023, 'Humanas', '2026-01-23', '2026-02-06', '2026-02-06', 'Devolvido', 'Patrícia Gomes', 'Campus Centro', 'Aguardando devolução'),
    (10, 1, 'Ana Souza', 'ana.souza@aluno.exemplo.edu.br', 'Administração', 'EX-03-03', 3, '9780000000003', 'Aprendendo SQL', 'Mariana Costa', 'Editora Acadêmica', 2023, 'Tecnologia', '2026-01-25', '2026-02-08', '2026-02-07', 'Devolvido', 'Renato Souza', 'Campus Norte', NULL),
    (11, 2, 'Bruno Alves', 'bruno.alves@aluno.exemplo.edu.br', 'Engenharia', 'EX-06-04', 6, '9780000000006', 'Matemática Aplicada', 'Carlos Nunes', 'Editora Horizonte', 2022, 'Exatas', '2026-01-27', '2026-02-10', '2026-02-08', 'Devolvido', 'Sílvia Martins', 'Campus Sul', 'Renovação solicitada'),
    (12, 3, 'Carla Mendes', 'carla.mendes@aluno.exemplo.edu.br', 'Sistemas de Informação', 'EX-10-01', 10, '9780000000010', 'Pesquisa Científica', 'Luciana Alves', 'Saber Mais', 2023, 'Humanas', '2026-01-29', '2026-02-12', NULL, 'Em aberto', 'Marcos Silva', 'Campus Centro', 'Livro em bom estado'),
    (13, 4, 'Daniel Lima', 'daniel.lima@aluno.exemplo.edu.br', 'Direito', 'EX-03-02', 3, '9780000000003', 'Aprendendo SQL', 'Mariana Costa', 'Editora Acadêmica', 2023, 'Tecnologia', '2026-01-31', '2026-02-14', '2026-02-13', 'Devolvido', 'Patrícia Gomes', 'Campus Norte', 'Devolução no balcão'),
    (14, 5, 'Eduarda Costa', 'eduarda.costa@aluno.exemplo.edu.br', 'Pedagogia', 'EX-06-03', 6, '9780000000006', 'Matemática Aplicada', 'Carlos Nunes', 'Editora Horizonte', 2022, 'Exatas', '2026-02-02', '2026-02-16', '2026-02-14', 'Devolvido', 'Renato Souza', 'Campus Sul', 'Aguardando devolução'),
    (15, 6, 'Felipe Rocha', 'felipe.rocha@aluno.exemplo.edu.br', 'Administração', 'EX-09-04', 9, '9780000000009', 'Lógica de Programação', 'Mariana Costa', 'Editora Acadêmica', 2020, 'Tecnologia', '2026-02-04', '2026-02-18', '2026-02-18', 'Devolvido', 'Sílvia Martins', 'Campus Centro', NULL),
    (16, 7, 'Gabriela Santos', 'gabriela.santos@aluno.exemplo.edu.br', 'Engenharia', 'EX-03-01', 3, '9780000000003', 'Aprendendo SQL', 'Mariana Costa', 'Editora Acadêmica', 2023, 'Tecnologia', '2026-02-06', '2026-02-20', NULL, 'Em aberto', 'Marcos Silva', 'Campus Norte', 'Renovação solicitada'),
    (17, 8, 'Heitor Martins', 'heitor.martins@aluno.exemplo.edu.br', 'Sistemas de Informação', 'EX-06-02', 6, '9780000000006', 'Matemática Aplicada', 'Carlos Nunes', 'Editora Horizonte', 2022, 'Exatas', '2026-02-08', '2026-02-22', '2026-02-20', 'Devolvido', 'Patrícia Gomes', 'Campus Sul', 'Livro em bom estado'),
    (18, 9, 'Isabela Ribeiro', 'isabela.ribeiro@aluno.exemplo.edu.br', 'Direito', 'EX-09-03', 9, '9780000000009', 'Lógica de Programação', 'Mariana Costa', 'Editora Acadêmica', 2020, 'Tecnologia', '2026-02-10', '2026-02-24', '2026-02-24', 'Devolvido', 'Renato Souza', 'Campus Centro', 'Devolução no balcão'),
    (19, 10, 'João Oliveira', 'joão.oliveira@aluno.exemplo.edu.br', 'Pedagogia', 'EX-02-04', 2, '9780000000002', 'Fundamentos de Sistemas', 'Rafael Lima', 'Conhecimento Aberto', 2021, 'Tecnologia', '2026-02-12', '2026-02-26', '2026-02-25', 'Devolvido', 'Sílvia Martins', 'Campus Norte', 'Aguardando devolução'),
    (20, 1, 'Ana Souza', 'ana.souza@aluno.exemplo.edu.br', 'Administração', 'EX-06-01', 6, '9780000000006', 'Matemática Aplicada', 'Carlos Nunes', 'Editora Horizonte', 2022, 'Exatas', '2026-02-14', '2026-02-28', NULL, 'Em aberto', 'Marcos Silva', 'Campus Sul', NULL),
    (21, 2, 'Bruno Alves', 'bruno.alves@aluno.exemplo.edu.br', 'Engenharia', 'EX-09-02', 9, '9780000000009', 'Lógica de Programação', 'Mariana Costa', 'Editora Acadêmica', 2020, 'Tecnologia', '2026-02-16', '2026-03-02', '2026-03-02', 'Devolvido', 'Patrícia Gomes', 'Campus Centro', 'Renovação solicitada'),
    (22, 3, 'Carla Mendes', 'carla.mendes@aluno.exemplo.edu.br', 'Sistemas de Informação', 'EX-02-03', 2, '9780000000002', 'Fundamentos de Sistemas', 'Rafael Lima', 'Conhecimento Aberto', 2021, 'Tecnologia', '2026-02-18', '2026-03-04', '2026-03-03', 'Devolvido', 'Renato Souza', 'Campus Norte', 'Livro em bom estado'),
    (23, 4, 'Daniel Lima', 'daniel.lima@aluno.exemplo.edu.br', 'Direito', 'EX-05-04', 5, '9780000000005', 'Ética e Sociedade', 'Luciana Alves', 'Saber Mais', 2019, 'Humanas', '2026-02-20', '2026-03-06', '2026-03-04', 'Devolvido', 'Sílvia Martins', 'Campus Sul', 'Devolução no balcão'),
    (24, 5, 'Eduarda Costa', 'eduarda.costa@aluno.exemplo.edu.br', 'Pedagogia', 'EX-09-01', 9, '9780000000009', 'Lógica de Programação', 'Mariana Costa', 'Editora Acadêmica', 2020, 'Tecnologia', '2026-02-22', '2026-03-08', NULL, 'Em aberto', 'Marcos Silva', 'Campus Centro', 'Aguardando devolução'),
    (25, 6, 'Felipe Rocha', 'felipe.rocha@aluno.exemplo.edu.br', 'Administração', 'EX-02-02', 2, '9780000000002', 'Fundamentos de Sistemas', 'Rafael Lima', 'Conhecimento Aberto', 2021, 'Tecnologia', '2026-02-24', '2026-03-10', '2026-03-09', 'Devolvido', 'Patrícia Gomes', 'Campus Norte', NULL),
    (26, 7, 'Gabriela Santos', 'gabriela.santos@aluno.exemplo.edu.br', 'Engenharia', 'EX-05-03', 5, '9780000000005', 'Ética e Sociedade', 'Luciana Alves', 'Saber Mais', 2019, 'Humanas', '2026-02-26', '2026-03-12', '2026-03-10', 'Devolvido', 'Renato Souza', 'Campus Sul', 'Renovação solicitada'),
    (27, 8, 'Heitor Martins', 'heitor.martins@aluno.exemplo.edu.br', 'Sistemas de Informação', 'EX-08-04', 8, '9780000000008', 'Comunicação Acadêmica', 'Fernanda Reis', 'Editora Horizonte', 2021, 'Humanas', '2026-02-28', '2026-03-14', '2026-03-14', 'Devolvido', 'Sílvia Martins', 'Campus Centro', 'Livro em bom estado'),
    (28, 9, 'Isabela Ribeiro', 'isabela.ribeiro@aluno.exemplo.edu.br', 'Direito', 'EX-02-01', 2, '9780000000002', 'Fundamentos de Sistemas', 'Rafael Lima', 'Conhecimento Aberto', 2021, 'Tecnologia', '2026-03-02', '2026-03-16', NULL, 'Em aberto', 'Marcos Silva', 'Campus Norte', 'Devolução no balcão'),
    (29, 10, 'João Oliveira', 'joão.oliveira@aluno.exemplo.edu.br', 'Pedagogia', 'EX-05-02', 5, '9780000000005', 'Ética e Sociedade', 'Luciana Alves', 'Saber Mais', 2019, 'Humanas', '2026-03-04', '2026-03-18', '2026-03-16', 'Devolvido', 'Patrícia Gomes', 'Campus Sul', 'Aguardando devolução'),
    (30, 1, 'Ana Souza', 'ana.souza@aluno.exemplo.edu.br', 'Administração', 'EX-08-03', 8, '9780000000008', 'Comunicação Acadêmica', 'Fernanda Reis', 'Editora Horizonte', 2021, 'Humanas', '2026-03-06', '2026-03-20', '2026-03-20', 'Devolvido', 'Renato Souza', 'Campus Centro', NULL),
    (31, 2, 'Bruno Alves', 'bruno.alves@aluno.exemplo.edu.br', 'Engenharia', 'EX-01-04', 1, '9780000000001', 'Introdução a Banco de Dados', 'Mariana Costa', 'Editora Acadêmica', 2022, 'Tecnologia', '2026-03-08', '2026-03-22', '2026-03-21', 'Devolvido', 'Sílvia Martins', 'Campus Norte', 'Renovação solicitada'),
    (32, 3, 'Carla Mendes', 'carla.mendes@aluno.exemplo.edu.br', 'Sistemas de Informação', 'EX-05-01', 5, '9780000000005', 'Ética e Sociedade', 'Luciana Alves', 'Saber Mais', 2019, 'Humanas', '2026-03-10', '2026-03-24', NULL, 'Em aberto', 'Marcos Silva', 'Campus Sul', 'Livro em bom estado'),
    (33, 4, 'Daniel Lima', 'daniel.lima@aluno.exemplo.edu.br', 'Direito', 'EX-08-02', 8, '9780000000008', 'Comunicação Acadêmica', 'Fernanda Reis', 'Editora Horizonte', 2021, 'Humanas', '2026-03-12', '2026-03-26', '2026-03-26', 'Devolvido', 'Patrícia Gomes', 'Campus Centro', 'Devolução no balcão'),
    (34, 5, 'Eduarda Costa', 'eduarda.costa@aluno.exemplo.edu.br', 'Pedagogia', 'EX-01-03', 1, '9780000000001', 'Introdução a Banco de Dados', 'Mariana Costa', 'Editora Acadêmica', 2022, 'Tecnologia', '2026-03-14', '2026-03-28', '2026-03-27', 'Devolvido', 'Renato Souza', 'Campus Norte', 'Aguardando devolução'),
    (35, 6, 'Felipe Rocha', 'felipe.rocha@aluno.exemplo.edu.br', 'Administração', 'EX-04-04', 4, '9780000000004', 'Gestão de Projetos', 'Paulo Mendes', 'Saber Mais', 2020, 'Administração', '2026-03-16', '2026-03-30', '2026-03-28', 'Devolvido', 'Sílvia Martins', 'Campus Sul', NULL),
    (36, 7, 'Gabriela Santos', 'gabriela.santos@aluno.exemplo.edu.br', 'Engenharia', 'EX-08-01', 8, '9780000000008', 'Comunicação Acadêmica', 'Fernanda Reis', 'Editora Horizonte', 2021, 'Humanas', '2026-03-18', '2026-04-01', NULL, 'Em aberto', 'Marcos Silva', 'Campus Centro', 'Renovação solicitada'),
    (37, 8, 'Heitor Martins', 'heitor.martins@aluno.exemplo.edu.br', 'Sistemas de Informação', 'EX-01-02', 1, '9780000000001', 'Introdução a Banco de Dados', 'Mariana Costa', 'Editora Acadêmica', 2022, 'Tecnologia', '2026-03-20', '2026-04-03', '2026-04-02', 'Devolvido', 'Patrícia Gomes', 'Campus Norte', 'Livro em bom estado'),
    (38, 9, 'Isabela Ribeiro', 'isabela.ribeiro@aluno.exemplo.edu.br', 'Direito', 'EX-04-03', 4, '9780000000004', 'Gestão de Projetos', 'Paulo Mendes', 'Saber Mais', 2020, 'Administração', '2026-03-22', '2026-04-05', '2026-04-03', 'Devolvido', 'Renato Souza', 'Campus Sul', 'Devolução no balcão'),
    (39, 10, 'João Oliveira', 'joão.oliveira@aluno.exemplo.edu.br', 'Pedagogia', 'EX-07-04', 7, '9780000000007', 'Redes de Computadores', 'Rafael Lima', 'Conhecimento Aberto', 2024, 'Tecnologia', '2026-03-24', '2026-04-07', '2026-04-07', 'Devolvido', 'Sílvia Martins', 'Campus Centro', 'Aguardando devolução'),
    (40, 1, 'Ana Souza', 'ana.souza@aluno.exemplo.edu.br', 'Administração', 'EX-01-01', 1, '9780000000001', 'Introdução a Banco de Dados', 'Mariana Costa', 'Editora Acadêmica', 2022, 'Tecnologia', '2026-03-26', '2026-04-09', NULL, 'Em aberto', 'Marcos Silva', 'Campus Norte', NULL),
    (41, 2, 'Bruno Alves', 'bruno.alves@aluno.exemplo.edu.br', 'Engenharia', 'EX-04-02', 4, '9780000000004', 'Gestão de Projetos', 'Paulo Mendes', 'Saber Mais', 2020, 'Administração', '2026-03-28', '2026-04-11', '2026-04-09', 'Devolvido', 'Patrícia Gomes', 'Campus Sul', 'Renovação solicitada'),
    (42, 3, 'Carla Mendes', 'carla.mendes@aluno.exemplo.edu.br', 'Sistemas de Informação', 'EX-07-03', 7, '9780000000007', 'Redes de Computadores', 'Rafael Lima', 'Conhecimento Aberto', 2024, 'Tecnologia', '2026-03-30', '2026-04-13', '2026-04-13', 'Devolvido', 'Renato Souza', 'Campus Centro', 'Livro em bom estado'),
    (43, 4, 'Daniel Lima', 'daniel.lima@aluno.exemplo.edu.br', 'Direito', 'EX-10-04', 10, '9780000000010', 'Pesquisa Científica', 'Luciana Alves', 'Saber Mais', 2023, 'Humanas', '2026-04-01', '2026-04-15', '2026-04-14', 'Devolvido', 'Sílvia Martins', 'Campus Norte', 'Devolução no balcão'),
    (44, 5, 'Eduarda Costa', 'eduarda.costa@aluno.exemplo.edu.br', 'Pedagogia', 'EX-04-01', 4, '9780000000004', 'Gestão de Projetos', 'Paulo Mendes', 'Saber Mais', 2020, 'Administração', '2026-04-03', '2026-04-17', NULL, 'Em aberto', 'Marcos Silva', 'Campus Sul', 'Aguardando devolução'),
    (45, 6, 'Felipe Rocha', 'felipe.rocha@aluno.exemplo.edu.br', 'Administração', 'EX-07-02', 7, '9780000000007', 'Redes de Computadores', 'Rafael Lima', 'Conhecimento Aberto', 2024, 'Tecnologia', '2026-04-05', '2026-04-19', '2026-04-19', 'Devolvido', 'Patrícia Gomes', 'Campus Centro', NULL),
    (46, 7, 'Gabriela Santos', 'gabriela.santos@aluno.exemplo.edu.br', 'Engenharia', 'EX-10-03', 10, '9780000000010', 'Pesquisa Científica', 'Luciana Alves', 'Saber Mais', 2023, 'Humanas', '2026-04-07', '2026-04-21', '2026-04-20', 'Devolvido', 'Renato Souza', 'Campus Norte', 'Renovação solicitada'),
    (47, 8, 'Heitor Martins', 'heitor.martins@aluno.exemplo.edu.br', 'Sistemas de Informação', 'EX-03-04', 3, '9780000000003', 'Aprendendo SQL', 'Mariana Costa', 'Editora Acadêmica', 2023, 'Tecnologia', '2026-04-09', '2026-04-23', '2026-04-21', 'Devolvido', 'Sílvia Martins', 'Campus Sul', 'Livro em bom estado'),
    (48, 9, 'Isabela Ribeiro', 'isabela.ribeiro@aluno.exemplo.edu.br', 'Direito', 'EX-07-01', 7, '9780000000007', 'Redes de Computadores', 'Rafael Lima', 'Conhecimento Aberto', 2024, 'Tecnologia', '2026-04-11', '2026-04-25', NULL, 'Em aberto', 'Marcos Silva', 'Campus Centro', 'Devolução no balcão'),
    (49, 10, 'João Oliveira', 'joão.oliveira@aluno.exemplo.edu.br', 'Pedagogia', 'EX-10-02', 10, '9780000000010', 'Pesquisa Científica', 'Luciana Alves', 'Saber Mais', 2023, 'Humanas', '2026-04-13', '2026-04-27', '2026-04-26', 'Devolvido', 'Patrícia Gomes', 'Campus Norte', 'Aguardando devolução'),
    (50, 1, 'Ana Souza', 'ana.souza@aluno.exemplo.edu.br', 'Administração', 'EX-03-03', 3, '9780000000003', 'Aprendendo SQL', 'Mariana Costa', 'Editora Acadêmica', 2023, 'Tecnologia', '2026-04-15', '2026-04-29', '2026-04-27', 'Devolvido', 'Renato Souza', 'Campus Sul', NULL);

-- Conferir os 50 registros:
SELECT COUNT(*) AS total_registros FROM emprestimos_biblioteca;

-- Visualizar os dados:
SELECT * FROM emprestimos_biblioteca ORDER BY emprestimo_id;

-- Exemplo: empréstimos ainda em aberto, ordenados pela data prevista de devolução:
SELECT emprestimo_id, nome_usuario, titulo_livro, data_prevista
FROM emprestimos_biblioteca
WHERE data_devolucao IS NULL
ORDER BY data_prevista;

-- Índice para ajudar nas buscas pela data prevista de devolução:
CREATE INDEX idx_emprestimos_biblioteca_data_devolucao
ON emprestimos_biblioteca (data_devolucao);
