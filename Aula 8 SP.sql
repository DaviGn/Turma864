-- Stored procedure

CREATE PROCEDURE SP_RelatorioAlunos
AS
BEGIN
	select a.Nome, Cpf, CONVERT(varchar, DataNascimento, 103) DataNascimento, 
	Email, c.Nome as Cidade, u.UF
	from Alunos a
	inner join Cidades c on a.CidadeId = c.Id
	inner join UFs u on c.UFId = u.Id
	order by a.Nome
END
GO

exec SP_RelatorioAlunos
GO

CREATE PROC SP_AtualizarPrecos
@valorAcrescentar decimal (10, 2)
AS
BEGIN
	IF @valorAcrescentar > 0
	-- BEGIN
		update Cursos set Mensalidade = Mensalidade + @valorAcrescentar
	-- END
END
GO

exec SP_AtualizarPrecos 100
go
