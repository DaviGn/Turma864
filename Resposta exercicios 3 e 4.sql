use LetsCode
GO

--Lista III
--1) Liste Id, Nome, Email e Data de nascimento de todos os estudantes em ordem alfabética. 
-- Formate a data de nascimento no retorno para o formato DD/MM/YYYY (pesquisa a função CONVERT);
select Id, Nome, Email, CONVERT(varchar, DataNascimento, 103) DataNascimento 
from Alunos
order by Nome

select Id, Nome, Email, FORMAT(DataNascimento, 'dd/MM/yyyy') DataNascimento 
from Alunos
order by Nome

--2) Liste todos os estudantes que contenham o dígito 4,5 ou 6 no CPF;
select * from Alunos
where CPF like '%4%' OR CPF like '%5%' OR CPF like '%6%'

--3) Liste todos os estudantes que contenham email com a terminação "@hotmail.com" e 
--que nasceram antes do ano 2000 (pesquisa a função DATEPART);
select * from Alunos
where Email like '%@hotmail.com' AND DATEPART(YEAR, DataNascimento) < 2000

--4) Obtenha a mensalidade mais cara do curso;
select max(Mensalidade) from Cursos

select top 1 * from Cursos
order by Mensalidade desc

--5) Obtenha a média das mensalidades do curso;
select avg(Mensalidade) from Cursos

--6) Obtenha a contagem de quantos cursos são mais caros que a média do curso;
select count(*) from Cursos
where Mensalidade > (select avg(Mensalidade) from Cursos)

--7) Obtenha a menor mensalidade a cima da média das mensalidades;
select min(Mensalidade) from Cursos
where Mensalidade > (select avg(Mensalidade) from Cursos)

--8) Conte quantos alunos possuem complemento no endereço;
select count(*) from Alunos
where Complemento is not null

select count(Complemento) from Alunos

-- Lista IV
--1 ) Liste nome, cpf, data de nascimento (em formato DD/MM/YYYY), email, cidade aonde mora e 
-- a UF em ordem alfabética de nomes;
select a.Nome, Cpf, CONVERT(varchar, DataNascimento, 103) DataNascimento, 
Email, c.Nome as Cidade, u.UF
from Alunos a
inner join Cidades c on a.CidadeId = c.Id
inner join UFs u on c.UFId = u.Id
order by a.Nome

--2) Liste nome e quantos cursos cada aluno comprou em ordem alfabética ;
select a.Id, a.Nome, count(ac.CursoId) Qtd from Alunos a
left join AlunosCursos ac on a.Id = ac.AlunoId
group by a.Id, a.Nome
order by a.Nome

--3) Usando o Select anterior, exiba também o total de mensalidade que cada aluno paga. 
-- O total é a soma das mensalidades dos cursos que o aluno possui (dica: terá que fazer join com a tabela Cursos);
select a.Nome, count(ac.CursoId) Qtd, SUM(c.Mensalidade) TotalMensalidades from Alunos a
left join AlunosCursos ac on a.Id = ac.AlunoId
left join Cursos c on ac.CursoId = c.Id
group by a.Id, a.Nome
order by a.Nome

--4) Liste quantos alunos cada curso possui. Considere que pode haver cursos sem aluno!
select c.Nome, count(ac.CursoId) as QtdAlunos from Cursos c
left join AlunosCursos ac on c.Id = ac.CursoId
group by c.Id, c.Nome

--5) Exiba o top 3 cursos mais comprados.
select top 3 c.Nome, count(ac.CursoId) as QtdAlunos from Cursos c
left join AlunosCursos ac on c.Id = ac.CursoId
group by c.Id, c.Nome
order by count(ac.CursoId) desc