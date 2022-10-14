create database controle_livros;

use controle_livros;

create table editora(
	id_editora int primary key unique not null,
    nome varchar(50) not null,
    bairro varchar(30) not null,
    cidade varchar(30) not null,
    numero int not null,
	estado varchar(15) not null,
	rua varchar(30)
);

create table livros(
	id_livro int primary key unique not null,
    nome varchar(50) not null,
    ano_lancamento year not null,
    
    edit_livro_fk int not null,
    foreign key (edit_livro_fk) references editora(id_editora)
);

create table autor(
	id_autor int primary key unique not null,
    nome varchar(50) not null
);

create table categoria(
	id_categoria int primary key unique not null,
    nome varchar(15) not null
);

create table rel_autor_livro (
	id_autor_fk int not null,
    id_livro_fk int not null,
    primary key (id_autor_fk, id_livro_fk),
    foreign key (id_autor_fk) references autor(id_autor),
    foreign key (id_livro_fk) references livros(id_livro)
);

create table rel_cat_livro (
	id_cat_fk int not null,
    id_livro_fk int not null,
    primary key (id_cat_fk, id_livro_fk),
    foreign key (id_cat_fk) references categoria(id_categoria),
    foreign key (id_livro_fk) references livros(id_livro)
);


insert into editora (id_editora, nome, bairro, cidade, numero, estado)
	values (1, "Leitura", "Taguatinga", "Brasília", 19, "DF"),
			(2, "Indicto", "Jardim La Salle", "Toledo", 795, "Paraná");

select * from editora;

insert into livros (id_livro, nome, ano_lancamento, edit_livro_fk)
	values (1, "O Alquimista", 1998, 1),
			(2, "Apanhador no Campo de Centeio",  1951, 2);
            
select * from livros;

insert into autor (id_autor, nome)
	values (1, "Paulo Coelho"),
			(2, "J.D Sallinger");

select * from autor;

insert into categoria (id_categoria, nome)
	values (1, "Aventura"),
			(2, "Ficção");
            
insert into rel_autor_livro (id_autor_fk, id_livro_fk)
	values (1, 1),
		(2, 2);
        
insert into rel_cat_livro (id_cat_fk, id_livro_fk)
	values (1, 1),
		    (2, 2);
select * from rel_autor_livro;

update editora
set nome = "Ler Mais" 
where id_editora = 2;
select * from editora;

update autor
set nome = "Sallinger" 
where nome = "J.D Sallinger";

update livros
set nome = "Alquimista" 
where id_livro = 1;

update categoria
set nome = "Drama" 
where nome = "Ficção";

update rel_cat_livro
set id_cat_fk = 2 
where id_cat_fk = 1;

update rel_autor_livro
set id_autor_fk = 1 
where id_autor_fk = 2;

delete from rel_cat_livro 
where id_cat_fk = 2;
select * from rel_cat_livro;

delete from rel_autor_livro 
where id_livro_fk = 1;
select * from rel_autor_livro;

delete from rel_autor_livro 
where id_livro_fk = 1;
select * from rel_autor_livro;

delete from categoria
where nome = "Drama";
select *from categoria;

delete from livros
where nome = "Alquimista";

delete from autor
where nome = "Sallinger";

delete from editora
where nome = "Leitura";
select*from editora;