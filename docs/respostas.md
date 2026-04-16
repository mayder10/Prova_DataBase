# Respostas - Sistema SigaEdu

## 1. SGBD Relacional

Um SGBD relacional como o PostgreSQL é ideal para sistemas acadêmicos pois garante as propriedades ACID:

- Atomicidade: operações são completas ou não executadas
- Consistência: mantém integridade dos dados
- Isolamento: evita conflitos entre transações simultâneas
- Durabilidade: dados persistem mesmo após falhas

Além disso, o uso de chaves primárias e estrangeiras garante integridade referencial.

---

## 2. Uso de Schemas

O uso de schemas permite organizar melhor o banco de dados, separando responsabilidades.

Exemplo:
- academico → dados do sistema
- seguranca → controle de acesso

Isso melhora manutenção, segurança e escalabilidade.

---

## 3. Modelo Lógico

ALUNO(id_aluno PK, nome, email, ativo)  
PROFESSOR(id_professor PK, nome, ativo)  
DISCIPLINA(id_disciplina PK, nome)  
TURMA(id_turma PK, id_disciplina FK, id_professor FK, ciclo)  
MATRICULA(id_matricula PK, id_aluno FK, id_turma FK, ativo)  
NOTA(id_nota PK, id_matricula FK, nota)  

---

## 4. Concorrência

O isolamento garante que transações simultâneas não interfiram entre si.

Quando dois usuários tentam alterar a mesma informação ao mesmo tempo, o banco utiliza locks (bloqueios), garantindo que apenas uma transação ocorra por vez.

Isso evita inconsistências e mantém a integridade dos dados.



Normalização dos Dados
🔹 1FN (Primeira Forma Normal)

Os dados foram organizados para eliminar atributos multivalorados e garantir atomicidade.
Exemplo: separação de cidade e estado no endereço.

🔹 2FN (Segunda Forma Normal)

Foram separadas entidades independentes para eliminar dependências parciais:

Aluno
Disciplina
Docente
🔹 3FN (Terceira Forma Normal)

Foram removidas dependências transitivas:

Criação das tabelas Ciclo e Operador
Centralização das relações na tabela Histórico
📄 Modelo Lógico
Tabela: aluno
id_matricula (PK)
nome
email
cidade
estado
data_ingresso
Tabela: disciplina
cod_disciplina (PK)
nome
carga_h
Tabela: docente
id_docente (PK)
nome
Tabela: operador
matricula_operador (PK)
Tabela: ciclo
id_ciclo (PK)
ciclo_calendario
Tabela: historico
id_historico (PK)
id_matricula (FK)
cod_disciplina (FK)
id_docente (FK)
matricula_operador (FK)
id_ciclo (FK)
score_final