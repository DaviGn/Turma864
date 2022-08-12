-- Function
CREATE FUNCTION fnc_CalculaMediaMensalidades()
RETURNS DECIMAL(10, 2)
AS
BEGIN
	RETURN (SELECT AVG(Mensalidade) FROM Cursos)
END
GO

-- Obtenha a contagem de quantos cursos são mais caros que a média do curso;
select count(*) from Cursos
where Mensalidade > (select dbo.fnc_CalculaMediaMensalidades())
GO

-- Obtenha a menor mensalidade a cima da média das mensalidades;
select min(Mensalidade) from Cursos
where Mensalidade > (select dbo.fnc_CalculaMediaMensalidades())
GO

CREATE FUNCTION fnc_QtdCursosAluno(@alunoId INT)
RETURNS INT
AS
BEGIN
	DECLARE @qtdCursos INT
	
	SELECT @qtdCursos = COUNT(*) FROM AlunosCursos
	WHERE AlunoId = @alunoId

	RETURN @qtdCursos
	--RETURN (SELECT COUNT(*) FROM AlunosCursos
	--WHERE AlunoId = @alunoId)
END
GO

DECLARE @alunoPesquisado INT
SET @alunoPesquisado = 2

select Id, Nome,
(select dbo.fnc_QtdCursosAluno(2)) as QtdCursos
from Alunos
WHERE Id = @alunoPesquisado
GO

CREATE FUNCTION fnc_ServePraNada(@initialValue INT)
RETURNS INT
AS
BEGIN
	DECLARE @contador INT
	SET @contador = 1

	DECLARE @maximo INT
	SET @maximo = 20

	DECLARE @retorno INT
	SET @retorno = 0

	WHILE @contador < @maximo
	BEGIN
		SET @retorno = @retorno + (@initialValue * @contador)
		SET @contador = @contador + 1
	END

	RETURN @retorno
END
GO

select dbo.fnc_ServePraNada(2)