-- Trigger

CREATE TABLE HistoricoMensalidades (
	Id int identity(1, 1) primary key,
	CursoId int not null,
	Mensalidade decimal(6, 2) not null,
	Data datetime not null default getdate()
)
GO

ALTER TABLE HistoricoMensalidades 
	ADD CONSTRAINT FK_HistoricoMensalidades_Cursos_CursoId
	FOREIGN KEY (CursoId) REFERENCES Cursos (Id)
GO

CREATE TRIGGER trg_HistoricoMensalidadesCursos ON Cursos
FOR INSERT, UPDATE
AS
BEGIN
	INSERT INTO HistoricoMensalidades (CursoId, Mensalidade)
	select Id, Mensalidade from inserted
END
GO

--CREATE TRIGGER trg_OnUpdate_Cursos ON Cursos
--FOR UPDATE
--AS
--BEGIN
--	INSERT INTO HistoricoMensalidades (CursoId, Mensalidade)
--	VALUES ((select Id from inserted), (select Mensalidade from inserted))
--END
--GO

select * from Cursos
select * from HistoricoMensalidades

exec SP_AtualizarPrecos 10

insert into Cursos (Nome, Mensalidade)
values ('Curso Trigger', 49.90)

update Cursos set Mensalidade = 59.90
where id = 6