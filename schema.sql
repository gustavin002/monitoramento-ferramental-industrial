create database monitoramento_ferramental_industrial;
use monitoramento_ferramental_industrial;

create table tb_ferramenta(
	id int primary key auto_increment,
	nome varchar(100) not null,
	horas_uso int not null default 0,
	vida_util_maxima int not null
);

INSERT INTO tb_ferramenta (nome, horas_uso, vida_util_maxima) VALUES
('martelo', 1, 5),
('estilhete', 2, 3),
('marreta', 3, 10);