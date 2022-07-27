-- Criando a base de dados
create database Turma864

-- Mudando a conexão para o banco que criamos
use Turma864

-- Definindo o formato e data como DD/MM/YYYY
set dateformat dmy

-- Entidade
create table Alunos (
	RA varchar(10) primary key, -- texto, chave primária (PK)
	Nome varchar(150) not null, -- texto
	CPF varchar(11) not null, -- texto
	Email varchar(150) not null, -- texto
	Senha varchar(500) not null, -- texto
	DataNascimento date not null, -- data
	Curso varchar(50) not null, -- texto
	Mensalidade decimal(6, 2) not null, 
	CEP varchar(8) not null, -- texto
	Logradouro varchar(150) not null, -- texto
	Complemento varchar(50), -- texto
	Numero varchar(10) not null, -- texto
	Cidade varchar(50) not null, -- texto
	Bairro varchar(50) not null, -- texto
	UF varchar(2) not null -- texto
)

-- Inserindo um aluno
insert into Alunos (RA, Nome, CPF, Email, Senha, DataNascimento,
Curso, Mensalidade, Cidade, Bairro, UF, CEP, Logradouro, Numero)
values (
'12345678', 
'Davi Nascimento', 
'11111111111', 
'davign20@gmail.com',
'teste123456',
'29/10/97',
'upgrade.dev',
249.90,
'Springfield',
'Center',
'SP',
'01111111',
'Av. Ever Green',
'632'
)

-- Listando todos os dados dos alunos
select * from Alunos

-- Atualizando um aluno
update Alunos set Complemento = 'Casa B'
where RA = '12345678'

-- Excluindo um aluno
delete from Alunos where RA = '12345678'