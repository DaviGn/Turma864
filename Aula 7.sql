-- View
CREATE VIEW VW_AlunosComCidades
AS
select a.Nome, Cpf, CONVERT(varchar, DataNascimento, 103) DataNascimento, 
Email, c.Nome as Cidade, u.UF
from Alunos a
inner join Cidades c on a.CidadeId = c.Id
inner join UFs u on c.UFId = u.Id
GO

-- Criando �ndice
CREATE INDEX IX_Alunos_CidadeId
ON Alunos (CidadeId)

-- Criando �ndice �nico
CREATE UNIQUE INDEX IX_Alunos_Email
ON Alunos (Email)

-- Excluindo �ndice
DROP INDEX IX_Alunos_Email
ON Alunos 

-- Exemplo de Union
select * from Alunos where CidadeId = 1
union
select * from Alunos where CidadeId = 2