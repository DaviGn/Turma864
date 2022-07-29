use Turma864

-- Adicionando novas colunas à tabela Alunos
alter table Alunos add Nota decimal(3, 1) not null default 0
alter table Alunos add DataHoraCriacao datetime not null default getdate()

-- Alterando colunas da tabela Alunos
alter table Alunos alter column Mensalidade decimal(6, 2)

-- Excluindo uma coluna da tabela Alunos
alter table Alunos drop column Mensalidade

create table Cidades (
	Id int identity(1, 1),
	Nome varchar(50) not null,
	UF varchar(2) not null,
	primary key(Id)
)

insert into Cidades
values ('Santo André', 'SP'),
('São Paulo', 'SP')

-- Relacionando tabelas 1-N
-- Criar a coluna CidadeId
alter table Alunos add CidadeId int

-- Atualizar os registros, cada um para uma cidade
update Alunos set CidadeId = 1
where RA = '12345678'
update Alunos set CidadeId = 2
where RA = '22245678'

-- Alterar a coluna CidadeId para obrigatória
alter table Alunos alter column CidadeId int not null

-- FK de Cidades em Alunos
alter table Alunos add constraint FK_Alunos_Cidades_CidadeId
foreign key (CidadeId) references Cidades(Id)

-- Excluindo as colunas Cidade e UF
alter table Alunos drop column Cidade
alter table Alunos drop column UF

-- Relacionando tabelas N-N
create table Cursos (
	Id int identity(1, 1) primary key,
	Nome varchar(50) not null,
	Mensalidade decimal (6, 2) not null,
	-- primary key(Id) posso utilizar desta forma também
)

insert into Cursos (Nome, Mensalidade)
values ('upgrade.dev', 99.90),
('upgrade.dev', 99.90),
('upgrade.dev', 99.90),
('upgrade.dev', 99.90)

-- Tabela associativa
create table AlunosCursos (
	AlunoRA varchar(10), -- FK para Alunos
	CursoId int, -- FK para Cursos
	primary key(AlunoRA, CursoId) -- Chave primária composta
)

-- FK AlunosCursos para Alunos
alter table AlunosCursos add constraint FK_AlunosCursos_Alunos_AlunoRA
foreign key (AlunoRA) references Alunos (RA)

-- FK AlunosCursos para Cursos
alter table AlunosCursos add constraint FK_AlunosCursos_Cursos_CursoId
foreign key (CursoId) references Cursos (Id)

insert into AlunosCursos
values (
(select RA from Alunos
 where Email = 'bvernalha@gmail.com'
), 3)

update AlunosCursos set CursoId = 4
where AlunoRA = (
	select RA from Alunos
	where Email = 'davign20@gmail.com'
) and CursoId = 2