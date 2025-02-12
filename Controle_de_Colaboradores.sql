CREATE TABLE cargo(
	 codigo integer primary key,
	 nome varchar(100) NOT NULL,
	 salario_base numeric(10,2) NOT NULL
);

CREATE TABLE cidade(
	 codigo integer primary key,
	 nome varchar(100) NOT NULL
);

CREATE TABLE departamento(
	 codigo integer primary key,
	 nome varchar(100) NOT NULL
);

CREATE TABLE funcionario(
	 codigo integer primary key,
	 nome varchar(100) NOT NULL,
	 telefone varchar(50),
	 salario numeric(10,2) NOT NULL,
	 cod_cargo integer NOT NULL,
	 cod_cidade integer NOT NULL,
	 cod_depto integer NOT NULL,
	 gerente integer,
	 CONSTRAINT fk_func_cargo   FOREIGN KEY (cod_cargo)  REFERENCES cargo (codigo)  ON UPDATE NO ACTION ON DELETE NO ACTION,
	 CONSTRAINT fk_func_cidade  FOREIGN KEY (cod_cidade) REFERENCES cidade (codigo) ON UPDATE NO ACTION ON DELETE NO ACTION,
	 CONSTRAINT fk_func_depto   FOREIGN KEY (cod_depto)  REFERENCES departamento (codigo) ON UPDATE NO ACTION ON DELETE NO ACTION,
	 CONSTRAINT fk_func_gerente FOREIGN KEY (gerente)    REFERENCES funcionario (codigo) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE diretor(
	 codigo integer primary key,
	 nome varchar(150) not null,
	 data_nascimento date
);

CREATE TABLE filme(
	 codigo integer primary key,
	 titulo varchar(200) not null,	 
	 resenha varchar(500),
	 duracao time not null,
	 valor numeric(8,2) not null,
	 situacao varchar(30) not null check (situacao in ('disponível','alugado')),
	 cod_diretor integer not null,
	 CONSTRAINT fk_fil_dir FOREIGN KEY (cod_diretor) REFERENCES diretor (codigo) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE cliente(
	 codigo integer primary key,
	 nome varchar(150) not null,
	 data_nascimento date
);

CREATE TABLE locacao(
	 codigo integer primary key,
	 data date not null,
	 hora time not null,
	 dt_devolucao date null,
	 cod_filme integer not null,
	 cod_cliente integer not null,
	 cod_funcionario integer not null,
	 CONSTRAINT fk_loc_funcionario FOREIGN KEY (cod_funcionario) REFERENCES funcionario(codigo),
	 CONSTRAINT fk_loc_filme       FOREIGN KEY (cod_filme)       REFERENCES filme(codigo),
	 CONSTRAINT fk_loc_cliente     FOREIGN KEY (cod_cliente)     REFERENCES cliente(codigo)
);

CREATE TABLE tipo_movimento(
	 codigo varchar(1) primary key,
	 nome varchar(80)
);

CREATE TABLE movimentacao(
 codigo integer primary key,
 data date not null,
 valor numeric(8,2),
 tp_movimento varchar(1) not null,
 CONSTRAINT fk_mov_tpmov FOREIGN KEY (tp_movimento) REFERENCES tipo_movimento(codigo)
); 
	
CREATE SEQUENCE seq_cargo;	
INSERT INTO cargo (codigo, nome, salario_base) VALUES (nextval('seq_cargo'), 'estagiario', 800.00);
INSERT INTO cargo (codigo, nome, salario_base) VALUES (nextval('seq_cargo'), 'gerente', 2000.00);
INSERT INTO cargo (codigo, nome, salario_base) VALUES (nextval('seq_cargo'), 'supervisor', 1800.00);
INSERT INTO cargo (codigo, nome, salario_base) VALUES (nextval('seq_cargo'), 'encarregado', 1500.00);
INSERT INTO cargo (codigo, nome, salario_base) VALUES (nextval('seq_cargo'), 'auxiliar geral', 1000.00);
INSERT INTO cargo (codigo, nome, salario_base) VALUES (nextval('seq_cargo'), 'analista de sistemas', 1000.00);
INSERT INTO cargo (codigo, nome, salario_base) VALUES (nextval('seq_cargo'), 'analista de testes', 1000.00);

CREATE SEQUENCE seq_cid;
INSERT INTO cidade (codigo, nome) VALUES (nextval('seq_cid'), 'Mogi das cruzes');
INSERT INTO cidade (codigo, nome) VALUES (nextval('seq_cid'), 'São Paulo');
INSERT INTO cidade (codigo, nome) VALUES (nextval('seq_cid'), 'Campinas');
INSERT INTO cidade (codigo, nome) VALUES (nextval('seq_cid'), 'São Jose dos Campos');
INSERT INTO cidade (codigo, nome) VALUES (nextval('seq_cid'), 'Limeira');

CREATE SEQUENCE seq_depto;
INSERT INTO departamento (codigo, nome) VALUES (nextval('seq_depto'), 'Vendas');
INSERT INTO departamento (codigo, nome) VALUES (nextval('seq_depto'), 'Compras');
INSERT INTO departamento (codigo, nome) VALUES (nextval('seq_depto'), 'PCP');
INSERT INTO departamento (codigo, nome) VALUES (nextval('seq_depto'), 'Produção');
INSERT INTO departamento (codigo, nome) VALUES (nextval('seq_depto'), 'Fábrica de Software');
INSERT INTO departamento (codigo, nome) VALUES (nextval('seq_depto'), 'Testes');

CREATE SEQUENCE seq_func;
INSERT INTO funcionario (codigo, nome, telefone, salario, cod_cargo, cod_cidade, cod_depto, gerente) 
 VALUES (nextval('seq_func'), 'Antonio Leite', '9899 0999', 10000.00, 
		 (select codigo from cargo where nome = 'gerente'),
		 (select codigo from cidade where nome = 'Campinas'),
		 (select codigo from departamento where nome = 'Compras'), NULL);
INSERT INTO funcionario (codigo, nome, telefone, salario, cod_cargo, cod_cidade, cod_depto, gerente) 
 VALUES (nextval('seq_func'), 'Lucas Silva', '8778 7878', 7000.00,
		 (select codigo from cargo where nome = 'gerente'),
		 (select codigo from cidade where nome = 'Mogi das cruzes'),
		 (select codigo from departamento where nome = 'Vendas'), NULL);
INSERT INTO funcionario (codigo, nome, telefone, salario, cod_cargo, cod_cidade, cod_depto, gerente) 
 VALUES (nextval('seq_func'), 'Bruna Santos', '899 9987', 2000.98,
		 (select codigo from cargo where nome = 'supervisor'),
		 (select codigo from cidade where nome = 'Campinas'),
		 (select codigo from departamento where nome = 'Produção'),
		 (select codigo from funcionario where nome = 'Lucas Silva'));
INSERT INTO funcionario (codigo, nome, telefone, salario, cod_cargo, cod_cidade, cod_depto, gerente) 
 VALUES (nextval('seq_func'), 'Camila Rocha', '987 554545', 4000.98,
		 (select codigo from cargo where nome = 'encarregado'),
		 (select codigo from cidade where nome = 'São Paulo'),
		 (select codigo from departamento where nome = 'Vendas'),
		 (select codigo from funcionario where nome = 'Antonio Leite'));
INSERT INTO funcionario (codigo, nome, telefone, salario, cod_cargo, cod_cidade, cod_depto, gerente) 
 VALUES (nextval('seq_func'), 'Dayna Santos', '7655 6654', 600.00, 
		 (select codigo from cargo where nome = 'gerente'),
		 (select codigo from cidade where nome = 'São Jose dos Campos'),
		 (select codigo from departamento where nome = 'PCP'),
		 (select codigo from funcionario where nome = 'Antonio Leite'));
INSERT INTO funcionario (codigo, nome, telefone, salario, cod_cargo, cod_cidade, cod_depto, gerente)
 VALUES (nextval('seq_func'), 'Emerson Santos', '899 99989', 6000.98,
		 (select codigo from cargo where nome = 'estagiario'),
		 (select codigo from cidade where nome = 'Campinas'),
		 (select codigo from departamento where nome = 'Produção'),
		 (select codigo from funcionario where nome = 'Lucas Silva'));
	 
CREATE SEQUENCE seq_dir;		 
INSERT INTO diretor (codigo, nome, data_nascimento) VALUES (nextval('seq_dir'), 'Cristian Lemos', '1965-05-27');
INSERT INTO diretor (codigo, nome, data_nascimento) VALUES (nextval('seq_dir'), 'Raposo Tavares', '1999-12-31');
INSERT INTO diretor (codigo, nome, data_nascimento) VALUES (nextval('seq_dir'), 'Carmen Sandiego', '1987-06-02');

CREATE SEQUENCE seq_fil;
INSERT INTO filme (codigo, titulo, resenha, cod_diretor, duracao, valor, situacao ) 
 VALUES (nextval('seq_fil'), 'Guerra nas Estrelas','guerra, ficcao, ect' ,
		 (select codigo from diretor where nome  = 'Cristian Lemos'),'01:30', 5.4, 'disponível');
INSERT INTO filme (codigo, titulo, resenha, cod_diretor, duracao, valor, situacao ) 
 VALUES (nextval('seq_fil'), 'Guerra nas Estrelas 2','guerra, ficcao, ect',
		 (select codigo from diretor where nome  = 'Cristian Lemos'),
		 '14:30',3.5,'alugado');
INSERT INTO filme (codigo, titulo, resenha, cod_diretor, duracao, valor, situacao ) 
 VALUES (nextval('seq_fil'), 'Um dia depois de amanha','baixa temperatura', 
		 (select codigo from diretor where nome  = 'Raposo Tavares'),
		 '11:00',3.4, 'alugado');
INSERT INTO filme (codigo, titulo, resenha, cod_diretor, duracao, valor, situacao ) 
 VALUES (nextval('seq_fil'), 'Um amor para sempre','romance',
		  (select codigo from diretor where nome  = 'Carmen Sandiego'),
		 '14:00',4.6, 'disponível');
INSERT INTO filme (codigo, titulo, resenha, cod_diretor, duracao, valor, situacao ) 
 VALUES (nextval('seq_fil'), 'Os 3 porquinhos','infantil',
		 (select codigo from diretor where nome  = 'Carmen Sandiego'),
		 '16:30',2.45, 'disponível');

CREATE SEQUENCE seq_cli;
INSERT INTO cliente (codigo, nome, data_nascimento) VALUES (nextval('seq_cli'), 'Fernando Henrique','1980-09-13');
INSERT INTO cliente (codigo, nome, data_nascimento) VALUES (nextval('seq_cli'), 'Aline Moraes', '2000-12-09');
INSERT INTO cliente (codigo, nome, data_nascimento) VALUES (nextval('seq_cli'), 'Emerson Nogueira', '1985-10-09');
INSERT INTO cliente (codigo, nome, data_nascimento) VALUES (nextval('seq_cli'), 'Fausto Silva', '1978-12-07');
INSERT INTO cliente (codigo, nome, data_nascimento) VALUES (nextval('seq_cli'), 'Luiz Carlos Santana', '1997-12-07');

CREATE SEQUENCE seq_loc;
INSERT INTO locacao (codigo, data, hora, cod_filme, cod_cliente, cod_funcionario)
 VALUES (nextval('seq_loc'), '2022-03-12' , '1:30', 
		 (select codigo from filme where titulo = 'Guerra nas Estrelas'),
		 (select codigo from cliente where nome = 'Fernando Henrique'),
		 (select codigo from funcionario where nome = 'Antonio Leite'));
INSERT INTO locacao (codigo, data, hora, cod_filme, cod_cliente, cod_funcionario)
 VALUES (nextval('seq_loc'), '2022-01-30', '11:34' ,
		 (select codigo from filme where titulo = 'Guerra nas Estrelas 2'),
		 (select codigo from cliente where nome = 'Aline Moraes'),
		 (select codigo from funcionario where nome = 'Antonio Leite'));
INSERT INTO locacao (codigo, data, hora, cod_filme, cod_cliente, cod_funcionario)
 VALUES (nextval('seq_loc'), '2022-02-27', '12:30', 
		 (select codigo from filme where titulo = 'Um dia depois de amanha'),
		 (select codigo from cliente where nome = 'Emerson Nogueira'),
		 (select codigo from funcionario where nome = 'Lucas Silva'));
INSERT INTO locacao (codigo, data, hora, cod_filme, cod_cliente, cod_funcionario)
 VALUES (nextval('seq_loc'), '2022-05-01', '10:30',
		 (select codigo from filme where titulo = 'Um amor para sempre'),
		 (select codigo from cliente where nome = 'Emerson Nogueira'),
		 (select codigo from funcionario where nome = 'Bruna Santos'));
INSERT INTO locacao (codigo, data, hora, cod_filme, cod_cliente, cod_funcionario)
 VALUES (nextval('seq_loc'), '2022-07-16', '08:30', 
		 (select codigo from filme where titulo = 'Guerra nas Estrelas'),
		 (select codigo from cliente where nome = 'Fausto Silva'),
		 (select codigo from funcionario where nome = 'Antonio Leite'));

INSERT INTO tipo_movimento (codigo, nome) VALUES('C', 'CREDITO');
INSERT INTO tipo_movimento (codigo, nome) VALUES('D', 'DEBITO');  

-- 1 --

create view func_cargo (funcionario, cidade, telefone, cargo, departamento) as
select f.nome, c.nome, f.telefone, ca.nome, d.nome
from funcionario f, cargo ca, departamento d, cidade c
where f.cod_cargo = ca.codigo and
      f.cod_cidade = c.codigo and
      f.cod_depto = d.codigo
order by f.nome;

select * from func_cargo

-- 2 --

select funcionario, telefone from func_cargo
where cidade = 'Mogi das cruzes'

/* ou

select funcionario, telefone from func_cargo
where cidade ilike 'Mogi das cruzes'

*/

-- 3 --

create view filmes_disp (titulo, resenha, duração , diretor) as
select f.titulo, f.resenha, f.duracao, d.nome
from filme f, diretor d
where f.cod_diretor = d.codigo and
      f.situacao = 'disponível';

select * from clientes

-- 4 --

select * from filmes_disp
where diretor = 'Carmen Sandiego'

-- 5 --

create view locacoes (data_de_locacao, filme, diretor, cliente, data_nasc, funcionario) as
select l.data, fil.titulo, d.nome, c.nome, to_char (c.data_nascimento, 'DD/MM/YYYY'), fu.nome
from locacao l, filme fil, diretor d, cliente c, funcionario fu
where l.cod_cliente = c.codigo and
      l.cod_filme = fil.codigo and
      l.cod_funcionario = fu.codigo and
	  fil.cod_diretor = d.codigo
order by l.data, fil.titulo
      
select * from locacoes;
    
-- 6 --

select filme from locacoes
where data_de_locacao between '2022-01-01' and '2022-03-01'
order by filme;

-- 7 --

drop table movimentacao;
create sequence seq_mov;

begin work;

insert into locacao values(nextval('seq_loc'), '2022-05-01', '10:30', NULL,
				  (Select codigo from filme where titulo = 'Um amor para sempre'),
				  (Select codigo from cliente where nome = 'Emerson Nogueira'),
				  (Select codigo from funcionario where nome = 'Bruna Santos'));
insert into movimentacao values(nextval('seq_mov'), now(), 
							   (Select valor from filme where titulo = 'Um amor para sempre'),
							   'C');
							   

							   
rollback;
				  
insert into locacao values(nextval('seq_loc'), '2022-06-10', '07:30', NULL,
				  (Select codigo from filme where titulo = 'Guerra nas Estrelas 2'),
				  (Select codigo from cliente where nome = 'Aline Moraes'),
				  (Select codigo from funcionario where nome = 'Bruna Santos'));
insert into movimentacao values(nextval('seq_mov'), now(), 
							   (Select valor from filme where titulo = 'Guerra nas Estrelas 2'),
							   'D');

commit;
