/*
create database Atividade_7;
*/

use Atividade_7;
go

create table tb_departamento (
  id_departamento int primary key identity(1,1),
  descricao_depto varchar(50) not null
  );

create table tb_funcionarios (
  id_funcionario int primary key identity(1,1),
  nome varchar(30) not null,
  cpf varchar(11) not null,
  departamento_id int,
  constraint fk_funcionario_departamento
	foreign key (departamento_id)
	references tb_departamento(id_departamento)
  );
  
create table tb_projetos (
  id_projeto int primary key identity(1,1),
  descricao_projeto varchar(50) not null
  );
  
create table tb_projeto_empregado (
  id_projeto_empregado int primary key identity(1,1),
  data_incio date,
  data_fim date,
  funcionario_id int,
    constraint fk_projeto_funcionario
    foreign key (funcionario_id) references tb_funcionarios(id_funcionario),
  projeto_id int,
    constraint fk_projeto_empregado_projetos
    foreign key (projeto_id) references tb_projetos(id_projeto)
  );


alter table tb_projeto_empregado
  add comissao decimal(12,2);
    
alter table tb_funcionarios add documento varchar(20) not null;
alter table tb_funcionarios drop column cpf;
alter table tb_funcionarios add genero varchar(15) not null;

/* alter table tb_departamentos
   rename column descricao_dpto to nome_depto;
*/
  
alter table tb_funcionarios alter column nome varchar(50) not null;
