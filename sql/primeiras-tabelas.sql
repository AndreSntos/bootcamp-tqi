create table pessoas(
	id int primary key auto_increment,
	nome varchar(20),
    nascimento date
);

insert into pessoas(nome, nascimento) values 
('André', '2002-04-26'),
('Giovanna', '2001-04-24');

select * from pessoas;

update pessoas set nome = "André Santos" where id = 1;

delete from pessoas where id = 1;

select * from pessoas order by nome desc;

alter table pessoas add genero varchar(1) not null after nascimento;

update pessoas set genero = "m" where id = 3;
update pessoas set genero = "f" where id = 2;
update pessoas set genero = "f" where id = 4;

select count("qtd"), genero from pessoas group by genero;

drop table pessoas;

-- Aprendendo sobre join

CREATE TABLE canais (
  id_canal int(11) NOT NULL,
  nome_canal varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO canais (id_canal, nome_canal) VALUES
(1, 'React'),
(2, 'PHP'),
(3, 'CSS'),
(4, 'HTML');


CREATE TABLE videos (
  id_video int(11) NOT NULL,
  nome_video varchar(100) NOT NULL,
  autor_video varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO videos (id_video, nome_video, autor_video) VALUES
(1, 'Login com React', 'React'),
(2, 'Componentes com React', 'React'),
(3, 'Listas com PHP', 'PHP'),
(4, 'Funções com PHP', 'PHP'),
(5, 'Páginas com HTML', 'HTML');

CREATE TABLE videos_canais (
  id_canais_video int(11) NOT NULL,
  fk_canal int(11) NOT NULL,
  fk_video int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO videos_canais (id_canais_video, fk_canal, fk_video) VALUES
(1, 2, 4),
(2, 2, 3),
(3, 1, 1),
(4, 1, 2),
(5, 4, 5);

select v.nome_video, v.autor_video, c.nome_canal from videos_canais as vc join videos as v on v.id_video = vc.fk_video
join canais as c on c.id_canal = vc.fk_canal;

-- Aprendendo sobre left join e right join e outer(trás todos os dados mesmos que não coincidem com o id e fk)

select * from videos_canais as vc right outer join videos as v on v.id_video = vc.fk_video
right outer join canais as c on c.id_canal = vc.fk_canal;


-- Aprendendo sobre union(une dois comandos para uma melhor consulta. obs: só funcionará se as duas tabelas tiverem o mesmo número de campos no select)

select v.id_video, v.nome_video from videos as v left outer join videos_canais as vc on v.id_video = vc.fk_video
 union
select c.id_canal, c.nome_canal from videos_canais as vc right outer join canais as c on c.id_canal = vc.fk_canal;

select v.id_video, v.nome_video from videos as v left outer join videos_canais as vc on v.id_video = vc.fk_video
 union
select c.id_canal, c.nome_canal from videos_canais as vc right outer join canais as c on c.id_canal = vc.fk_canal where c.nome_canal = "PHP";









