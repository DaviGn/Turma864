-- Conversão e formtação
select
*, 
convert(varchar, DataNascimento, 103) ConvertedDate,
format(DataNascimento, 'dd/MM/yyyy') FormatedDate
from 
Alunos
where 
--DataNascimento like '%2000%'
DATEPART(YEAR, DataNascimento) = 2000
order by Nome desc

select 'R$' + convert(varchar, 10)
select 'R$' + cast(10 as varchar)

select convert(varchar, getdate(), 103)

select format(getdate(), 'dd/MM/yyyy HH:mm:ss')

-- Agrupamento
select 
CidadeId, count(*) as Qtd
from Alunos
group by CidadeId
having count(*) > 1

select top 5
CidadeId, Bairro, count(*) as Qtd
from Alunos
group by CidadeId, Bairro
order by CidadeId

-- Junção de tabelas
select * from Alunos a -- Esquerda
inner join 
Cidades c -- Direita
on a.CidadeId = c.Id

select * from Alunos a -- Esquerda
left join 
Cidades c -- Direita
on a.CidadeId = c.Id

select * from Alunos a -- Esquerda
right join 
Cidades c -- Direita
on a.CidadeId = c.Id
order by a.Id

select * from Alunos a -- Esquerda
full join 
Cidades c -- Direita
on a.CidadeId = c.Id
order by a.Id

-- Junção com agrupamento
select c.Nome as Cidade, u.UF, count(*) as QtdAlunos
from 
Cidades c -- Esquerda
inner join UFs u on c.UFId = u.Id
left join 
Alunos a -- Direita
on a.CidadeId = c.Id
group by c.Id, u.UF, c.Nome
order by count(*)