-- BANCO DE DADOS E MODELAGEM
-- PROFESSOR WILLYAN
-- ALUNO SAMUEL JONATHAN PEREIRA
-- LISTA 002


CREATE DATABASE lista002;

USE lista002; 

CREATE TABLE alunos (
	matricula int primary key,
	codigo int, 
    nome varchar(50), 
    telefone varchar(50),
	cidade varchar(50)
);

DESC alunos;

CREATE TABLE alunos2(
	codigo int, 
    nome varchar(200), 
    telefone varchar(50),
    cidade varchar(100)
);

DESC alunos2;

CREATE TABLE funcionarios(
	codigo int primary key,
	nome varchar(50),
    endereco varchar(200),
    telefone varchar(14),
    cidade varchar(30),
    estado varchar(20),
    cep varchar(12),
    cpf varchar(15),
    salario varchar(8)
);

DESC funcionarios;

CREATE TABLE fornecedores(
	codigo int primary key,
	nome varchar(50),
    endereco varchar(200),
    telefone varchar(14),
    cidade varchar(30),
    estado varchar(20),
    cep varchar(12),
    cnpj varchar(15),
    email varchar(30)
);

DESC fornecedores;

CREATE TABLE livros(
	codigo int primary key,
	nome varchar(100),
	categoria varchar(50),
	resumo varchar (600),
	precocusto float,
	precovenda float
);

DESC livros;

CREATE TABLE estoque(
	codigo int primary key,
	nomedoproduto varchar(100),
	categoria varchar(50),
	quantidade int,
	fornecedor varchar(100)
);

DESC estoque;

CREATE TABLE notas(
	codigo int primary key,
	nomedoaluno varchar(100),
	bimestre int
);

DESC estoque;

CREATE TABLE caixa(
	codigo int primary key,
	descricao varchar(200),
	debito float,
	credito float
);

DESC caixa;

CREATE TABLE contasAPagar(
	codigo int primary key,
	data_conta date,
	descricao varchar(200),
	valor float,
	data_pagamento date 
);

DESC contasAPagar;

CREATE TABLE contasAReceber(
	codigo int primary key,
	data_conta date,
	descricao varchar(200),
	valor float,
	data_recebimento date
);

DESC contasAReceber;

CREATE TABLE filmes(
	codigo int primary key,
	nome varchar(50),
	sinopse varchar(500),
	categoria varchar(20),
	diretor varchar(50)
);

DESC filmes;

CREATE TABLE cds(
	codigo int primary key,
	nome varchar(50),
	ano int,
	quantidadedemusicas int
);

DESC cds;

ALTER TABLE alunos RENAME TO super_alunos;

DESC super_alunos;

ALTER TABLE estoque RENAME TO produtos;

DESC produtos;

ALTER TABLE notas RENAME TO aprovados;

DESC aprovados;

ALTER TABLE aprovados RENAME TO notas;

DROP TABLE notas;

ALTER TABLE super_alunos RENAME TO alunos;

DESC alunos;

ALTER TABLE alunos RENAME TO estudantes;

DESC estudantes;

ALTER TABLE estudantes RENAME TO super_estudantes;

DESC super_estudantes;

DESC alunos;

DROP TABLE super_estudantes;

DESC super_estudantes;

ALTER TABLE alunos2 ADD estado varchar(30);

DESC alunos2;

DROP TABLE caixa;

DESC caixa;

CREATE TABLE caixa(
	codigo int primary key,
	descricao varchar(200),
	debito float,
	credito float
);

DESC caixa;

ALTER TABLE caixa ADD observacao varchar(300);

ALTER TABLE alunos2 ADD cpf varchar(16);

DESC caixa;

DESC alunos2;

ALTER TABLE caixa ADD saldo float;

DESC caixa;

DROP TABLE alunos2;

DESC alunos2;

DROP TABLE livros;

DESC livros;

DROP TABLE contasAPagar;

DESC contasAPagar;

DROP TABLE contasAReceber;

DESC contasAReceber;

DROP TABLE filmes;

DESC filmes;