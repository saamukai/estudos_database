CREATE DATABASE ESCOLA;
USE ESCOLA;

CREATE TABLE instrutores (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  valor_hora INTEGER UNSIGNED NULL,
  certificados VARCHAR(255) NULL,
  PRIMARY KEY(id)
);
CREATE TABLE cursos (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  requisito VARCHAR(255) NULL,
  carga_horaria SMALLINT UNSIGNED NULL,
  preco DOUBLE UNSIGNED NULL,
  PRIMARY KEY(id)
);
 
CREATE TABLE alunos (
  id INT NOT NULL AUTO_INCREMENT,
  cpf CHAR(11) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  fone CHAR(14) NOT NULL,
  data_nascimento DATE NULL,
  PRIMARY KEY(id)
);
 
CREATE TABLE turmas (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  instrutores_id INT NOT NULL,
  cursos_id INTEGER UNSIGNED NOT NULL,
  data_inicio DATE NULL,
  data_final DATE NULL,
  carga_horaria SMALLINT UNSIGNED NULL,
  PRIMARY KEY(id),
  INDEX turmas_FKIndex1(cursos_id),
  INDEX turmas_FKIndex2(instrutores_id),
  CONSTRAINT CURSO_TURMA_FK FOREIGN KEY(cursos_id)
    REFERENCES cursos(id),
  CONSTRAINT INSTRUTOR_TURMA_FK FOREIGN KEY(instrutores_id)
    REFERENCES instrutores(id)
);
 
CREATE TABLE matriculas (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  turmas_id INTEGER UNSIGNED NOT NULL,
  alunos_id INT NOT NULL,
  data_matricula DATE NULL,
  PRIMARY KEY(id),
   CONSTRAINT ALUNO_MATRICULA_FK FOREIGN KEY(alunos_id)
    REFERENCES alunos(id),
  CONSTRAINT TURMA_MATRICULA_FK FOREIGN KEY(turmas_id)
    REFERENCES turmas(id)
);


-- 1) Fazer 5 INSERT INTO em cada Tabela do banco de dados;
insert into instrutores (id, nome, email, valor_hora, certificados)
	values (1, "Henrique", "herinque@email.com", "30", "Geografia"),
			(2, "Luana", "luana@email.com", 30, "Ingles"),
			(3, "Thiago", "thiago@email.com", 32, "Matemática"),
            (4, "Felipe", "felipe@email.com", 30, "Portugues"),
            (5, "Lamar", "lamar@email.com", 30, "Física");


insert into cursos (id, nome, requisito, carga_horaria, preco)
	values (6, "Geografia", "Nenhum", 400, 250.00),
			(7, "Ingles", "Nenhum", 150, 50.00),
            (8, "Matemática", "Nenhum", 30, 25.00),
            (9, "Português", "Nenhum", 300, 70.00),
            (10, "Física", "Matemática", 150, 70.00);
            
insert into alunos (id, cpf, nome, email, fone, data_nascimento)
	values (11, "12345678911", "Gabriel", "gabriel@aluno.com", "61985000000", "2005-10-07"),
			(12, "18974217931", "Kendrick", "kendrick@aluno.com", "45999999999", "2004-09-01"),
            (13, "94258163018", "Kota", "kota@aluno.com", "94856183764", "2003-09-10"),
            (14, "95610473917", "Saxon", "saxon@aluno.com", "9472018491", "2002-04-12"),
            (15, "03920293041", "Travis", "travis@aluno.com", "948294201", "2004-01-04");

insert into turmas (id, instrutores_id, cursos_id, data_inicio, data_final, carga_horaria)
	values (16, 1, 6, "2022-04-12", "2022-12-21", 400),
			(17, 2, 7, "2022-04-12", "2022-10-21", 150),
            (18, 3, 8, "2022-04-12", "2022-05-21", 30),
            (19, 4, 9, "2022-04-12", "2022-11-21", 300),
            (20, 5, 10, "2022-04-12", "2022-10-21", 150);
            
insert into matriculas(id, turmas_id, alunos_id, data_matricula)
	values (21, 16, 11, "2022-05-07"),
			(22, 17, 12, "2022-05-08"),
			(23, 18, 13, "2022-05-09"),
			(24, 19, 14, "2022-05-10"),
            (25, 20, 15, "2022-05-11");
            
-- 2) Fazer um UPDATE na tabela instrutores, alterando o nome de um dos instrutores(Filtrar pelo id do instrutor);
update instrutores
set nome = "Henrique Vale" 
where id = 1;
select * from instrutores;

-- 3) Fazer um UPDATE na tabela instrutores, alterando o e-mail de um dos instrutores(Filtrar pelo nome do instrutor);
update instrutores
set email = "lua21@email.com"
where nome = "Luana";

-- 4) Fazer dois UPDATE na tabela cursos, seguindo a mesma lógica do exercício 2 e 3;
update cursos
set nome = "Lingua Inglesa"
where id = 7;

update cursos
set requisito = "Mat Básica"
where nome = "Matemática";

-- 5) Fazer dois UPDATE na tabela turmas trocando o instrutor de 2 turmas diferentes;
update turmas
set instrutores_id = 2
where id = 16;

update turmas
set instrutores_id = 1
where id = 17;

select * from turmas;

-- 6) fazer 2 DELETE por tabela do banco de dados;
delete from matriculas
where id = 21;
delete from matriculas
where id = 25;

delete from turmas
where id = 20;
delete from turmas
where id = 16;

delete from alunos
where id = 11;
delete from alunos
where id = 15;

delete from cursos
where id = 6;
delete from cursos
where id = 10;

delete from instrutores
where id = 2;

delete from instrutores
where nome = "Lamar";