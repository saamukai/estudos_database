-- CURSO DE PROGRAMAÇÃO CONNECT, BIOPARK EDUCAÇÃO
-- LISTA 003 BANCO DE DADOS
-- PROFESSOR WILLIAN MENDONÇA
-- ALUNO SAMUEL JONATHAN

---------------------------------------------------------
-- QUESTÃO 01
CREATE DATABASE clinica;

USE clinica;

CREATE TABLE medicos (
	medico_id int primary key,
	crm varchar(15) unique not null,
    nome varchar(40) not null, 
	idade int check (idade>23),
	especialidade char(20) not null default 'Ortopedia',
	cpf varchar (15) unique not null,
	data_admissão date
);

CREATE TABLE sala (
	numero_sala int primary key unique not null check (numero_sala >1 and numero_sala<50),
    andar int unique not null check (andar <12),
	medicos_fk int not null,
	constraint medico_sala_fk foreign key (medicos_fk) references medicos(medico_id)
);

CREATE TABLE consultas (
	codigo_consulta int primary key unique not null,
	data_horario datetime,
	medicos_consulta_fk varchar(15) not null,
	constraint medico_consulta foreign key (medicos_consulta_fk) references medicos(crm)
);

CREATE TABLE pacientes (
	rg varchar(15) primary key unique not null,
	nome varchar(40) not null,
	data_nascimento date,
	cidade char(30) default 'Itabauna',
	doenca varchar(40) not null,
	plano_saude varchar(40) not null default 'SUS',
	consulta_paciente_fk int not null,
	constraint consulta_paciente foreign key (consulta_paciente_fk) references consultas(codigo_consulta)
);

CREATE TABLE funcionarios (
	matricula varchar(15) primary key unique not  null,
    nome varchar(40) not null,
    data_nascimento date not null,
    data_admissao date not null,
    cargo varchar(40) not null default 'Assistente Medico',
    salario float not null default '510.00'
);

-----------------------------------------------------------------------
-- QUESTÃO 02
create database eleicao;
use eleicao;

create table cargo (
	codigo_cargo int primary key unique not null,
	nome_cargo varchar(30) unique not null check (nome_cargo!='Prefeito' and nome_cargo!='Vereador'),
	salario float not null default '17000.00',
	numero_vagas int unique not null
);

create table partido (
	codigo_partido int primary key unique not null,
	sigla char(5) unique not null,
	nome varchar(40) unique not null,
	numero int unique not null
);

create table candidato(
	numero_candidato int primary key unique not null,
	nome varchar(40) unique not null,
	codigo_cargo int not null,
	codigo_partido int not null,

	cargo_candidato_fk int not null,
	constraint cargo_candidato foreign key (cargo_candidato_fk) references cargo(codigo_cargo),
	partido_cadidato_fk int not null,
	constraint partido_candidato foreign key (partido_cadidato_fk) references partido(codigo_partido)
);

create table voto (
		titulo_eleitor varchar(30) primary key unique not null,
		numero_candidato int not null,

		candidato_voto_fk int not null,
		constraint candidato_voto foreign key (candidato_voto_fk) references candidato(numero_candidato)
);

create table eleitor (
	titulo_eleitor varchar(30) primary key unique not null,
	zona_eleitoral char(5) not null,
	sessao_eleitoral char(5) not null,
	nome varchar(40) not null
);

---------------------------------------------------------------------------
-- QUESTÃO 03

create database revendedora_carros;

use revendedora_carros;

create table clientes(
	codigo_cliente int primary key unique not null,
	nome varchar(20) not null,
	sobrenome varchar(20) not null,
	telefone varchar(20) unique not null,
	rua varchar(20) not null,
	numero int not null,
	complemento varchar(30) not null,
	bairro varchar(20) not null,
	cidade varchar(20) not null,
	estado varchar(15) not null,
	cep varchar(10) not null
);

create table vendedores(
	codigo_vendedores int primary key unique not null,
	nome varchar(20) not null,
	sobrenome varchar(20) not null,
	telefone varchar(20) unique not null,
	rua varchar(20) not null,
	numero int not null,
	complemento varchar(30) not null,
	bairro varchar(20) not null,
	cidade varchar(20) not null,
	estado varchar(15) not null,
	cep varchar(10) not null,
	data_admissao date not null,
	salario float not null
);

create table vendas(
	id_venda int primary key,
	data_venda date not null,
	preco_pago float not null,
	
	vendas_vendedor_fk int not null,
	constraint vendas_vendedor foreign key (vendas_vendedor_fk) references vendedores(codigo_vendedores),
	
	cliente_venda_fk int not null,
	constraint cliente_venda_fk foreign key (cliente_venda_fk) references clientes(codigo_cliente)
);

create table automovel(
	renavam varchar(20) primary key unique not null,
	placa varchar(8) unique not null,
	marca varchar(20) not null, 
	modelo varchar(20) not null,
	ano_fabricacao year not null, 
	ano_modelo year not null,
	cor varchar(10) not null,
	motor varchar(20),
	numero_portas int,
	tipo_combustivel varchar(20),
	preco float,
	
	automovel_venda_fk int not null,
	constraint automovel_venda foreign key (automovel_venda_fk) references vendas(id_venda)
);

