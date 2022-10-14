create database escola;
use escola;

create table professor (
	id_prof int primary key unique not null,
	nome varchar(50) not null,
    dataIngresso date
);

create table aula(
	id_aula int primary key unique not null,
    horario time not null,
    nome varchar(30) not null,
    numSala int,

    fk_profAula int not null,
    foreign key (fk_profAula) references professor(id_prof)
);

create table turma(
	id_turma int primary key unique not null,
    serieTurma int not null,
    letraTurma varchar(1) not null,
    tipoTurma varchar(30)
);

create table aluno(
	id_aluno int primary key unique not null,
    nome varchar(50) not null,
    nascimento date not null,
    
    id_turmafk int not null,
    foreign key (id_turmafk) references turma(id_turma)
);

create table rel_aulaAluno(
	id_alunofk int not null,
    id_aulafk int not null,
    primary key (id_alunofk, id_aulafk),
    foreign key (id_alunofk) references aluno(id_aluno),
    foreign key (id_aulafk) references aula(id_aula)
);

create table rel_turmaProf(
	id_turmafk int not null,
    id_proffk int not null,
    primary key (id_turmafk, id_proffk),
    foreign key (id_turmafk) references turma(id_turma),
    foreign key (id_proffk) references professor(id_prof)
); 

insert into professor (id_prof, nome, dataIngresso) -- date = ano-mes-dia
	values (1, "Samuel", "2020-09-12");
insert into professor (id_prof, nome, dataIngresso)
	values (2, "Jonathan", "2019-04-05");

insert into aula (id_aula, horario, nome, numSala, fk_ProfAula) -- time = hhh:mm:ss
	values (1, "007:30:00", "Historia", 1, 1), -- prof Samuel 1 aula de historia as 07h na sala 1
			(2, "009:15:00", "Geografia", 1, 2); -- prof Jonathan 2 aula de geografia as 09>15 na sala 2

insert into turma(id_turma, serieTurma, letraTurma, tipoTurma)
	values (1, 6, "A", "EF"), -- turma id 1 6º A Ensino Fundamental
			(12, 3, "C", "EM"); -- turma id 12 3º C Ensino Medio

insert into aluno(id_aluno, nome, nascimento, id_turmafk)
	values  (365, "Wemerson", "2000-03-24", 12), -- aluno id 365 wemerson turma 12: 3º C ensino medio
			(261, "Arthur", "2005-06-11", 1); -- aluno id 261 arthur turma 1: 6º ano a ef
            
insert into rel_aulaAluno(id_alunofk, id_aulafk)
	values (365, 1), -- aluno 365 wemerson recebe aula 1 - historia com prof Samuel na sala 1
			(261, 2); -- aluno 261 arthur recebe aula 2 - geografia com prof jonathan na sala 1
            
insert into rel_turmaProf(id_turmafk, id_proffk)
	values (12, 1), -- prof id 1 samuel da aula na turma 12
			(1, 1), -- prof id 1 samuel da aula na turma 1
			(12, 2); -- prof id 2 joanthan da aula na turma 12
            
update professor
set nome = "Samuel J." 
where id_prof = 1;

select * from professor;

update aula
set nome = "Sociologia" 
where id_aula = 1;

update turma
set letraTurma = "D" 
where id_turma = 1;

update aluno
set nascimento = "2002-03-24" 
where id_aluno = 365;

update rel_aulaAluno
set id_aulafk = 1
where id_alunofk = 261; -- aluno 261 passa agora receber aula 1;

delete from rel_turmaProf -- deletando relação do prof 2 com turma 12
where id_proffk = 2;
select * from rel_turmaProf;

delete from rel_turmaProf -- deletando relação do prof 1 com turma 12
where id_turmafk = 12;
select * from rel_turmaProf;

delete from rel_aulaAluno -- deletando relação do aluno 365 com aula 1
where id_alunofk = 365;
select * from rel_aulaAluno;

delete from aluno
where id_aluno = 365; -- deletando aluno 365

delete from turma
where id_turma = 12; -- deletando turma 12

delete from aula
where id_aula = 2; -- deletando aula 2

delete from professor
where id_prof = 2; -- deletando prof 2
select * from professor;





