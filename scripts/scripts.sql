-- LIMPA TUDO (resolve qualquer erro anterior)
DROP TABLE IF EXISTS historico CASCADE;
DROP TABLE IF EXISTS ciclo CASCADE;
DROP TABLE IF EXISTS operador CASCADE;
DROP TABLE IF EXISTS docente CASCADE;
DROP TABLE IF EXISTS disciplina CASCADE;
DROP TABLE IF EXISTS aluno CASCADE;

-- =========================
-- TABELA ALUNO
-- =========================
CREATE TABLE aluno (
    id_matricula INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(10),
    data_ingresso DATE
);

-- =========================
-- TABELA DISCIPLINA
-- =========================
CREATE TABLE disciplina (
    cod_disciplina VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(100),
    carga_h INT
);

-- =========================
-- TABELA DOCENTE
-- =========================
CREATE TABLE docente (
    id_docente SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

-- =========================
-- TABELA OPERADOR
-- =========================
CREATE TABLE operador (
    matricula_operador VARCHAR(10) PRIMARY KEY
);

-- =========================
-- TABELA CICLO
-- =========================
CREATE TABLE ciclo (
    id_ciclo SERIAL PRIMARY KEY,
    ciclo_calendario VARCHAR(10)
);

-- =========================
-- TABELA HISTORICO (COM TODAS AS FKs)
-- =========================
CREATE TABLE historico (
    id_historico SERIAL PRIMARY KEY,
    id_matricula INT NOT NULL,
    cod_disciplina VARCHAR(10) NOT NULL,
    id_docente INT NOT NULL,
    matricula_operador VARCHAR(10) NOT NULL,
    id_ciclo INT NOT NULL,
    score_final DECIMAL(3,1),

    CONSTRAINT fk_aluno
        FOREIGN KEY (id_matricula)
        REFERENCES aluno(id_matricula),

    CONSTRAINT fk_disciplina
        FOREIGN KEY (cod_disciplina)
        REFERENCES disciplina(cod_disciplina),

    CONSTRAINT fk_docente
        FOREIGN KEY (id_docente)
        REFERENCES docente(id_docente),

    CONSTRAINT fk_operador
        FOREIGN KEY (matricula_operador)
        REFERENCES operador(matricula_operador),

    CONSTRAINT fk_ciclo
        FOREIGN KEY (id_ciclo)
        REFERENCES ciclo(id_ciclo)
);