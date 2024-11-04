create database biblioteca;
use biblioteca;

create table livros(
	id int primary key,
    titulo varchar(100) not null,
    ano_publicacao year not null,
    id_autor int,
    id_categorias int,
    foreign key (id_autor) references autores(id),
    foreign key (id_categorias) references categorias(id)
);

create table autores(
	id int primary key,
    nome varchar(100),
    nacionalidade varchar(50)
);

create table categorias(
	id int primary key,
    descricao varchar(50)
);

alter table livros
add column preco float;

alter table categorias
add column quantidade int;

insert into autores values
(1, "Frank Herbert", "EUA"),
(2, "Madeline Miller", "EUA"),
(3, "José de Alencar", "Brasil"),
(4, "J. R. R. Tolkien", "África");

insert into categorias values
(1, "Romance", 2),
(2, "Ficção Científica", 1),
(3, "Fantasia", 1);

insert into livros values
(1, "Duna", 1965, 1, 2, 49.90),
(2, "A Canção de Aquiles", 2020, 2, 1, 29.90),
(3, "O Guarani", 1857, 1, 3, 13.50),
(4, "O Senhor dos Anéis", 3, 4, 69.90);

UPDATE livro
SET preco = preco * 1.10
WHERE ano < 2000;

UPDATE autor
SET nome = "Gabriela García Márquez"
WHERE nome = null;

delete from livros
WHERE ano < 1950;

delete from livros
WHERE categorias(quantidade) < 5;

alter table categorias
drop column quantidade;
