--ex 1
SELECT COUNT(chefe) AS "Numero de empregados com chefe"
FROM empregado;

--ex 2
SELECT COUNT(DISTINCT chefe) AS "Numero Chefes na empresa"
FROM empregado;

--ex 3
SELECT COUNT(comissao) AS "Numero comissoes (>0)"
FROM empregado
WHERE comissao IS NOT NULL AND comissao > 0;

--ex 4
SELECT COUNT(DISTINCT numdep) AS "Numero de Dept. com Emp."
FROM empregado;

--ex 5
SELECT SUM(comissao) AS "Valor em comissoes"
FROM empregado;

--ex 6
SELECT COUNT(funcao) AS "Numero de diretores"
FROM empregado
WHERE funcao IS NOT NULL AND funcao = 'Director';

--ex 7
SELECT
	numdep AS "Numero do Departamento",
	COUNT(funcao) AS "Numero de Diretores"
FROM empregado
WHERE funcao='Director'
GROUP BY numdep;

-- ex 8
SELECT COUNT(*) AS "Numero de vendedores (30 e 20)"
FROM empregado
WHERE (numdep=30 OR numdep=20) AND funcao='Vendedor';

--ex 9
SELECT numdep AS "Numero do departamento", COUNT(numdep) AS "Numero de empregados"
FROM empregado
GROUP BY numdep
ORDER BY COUNT(numdep) DESC;

-- ex 10
SELECT funcao, COUNT(funcao) AS "Quant. Empregados"
FROM empregado
GROUP BY funcao
ORDER BY "Quant. Empregados" ASC;

-- ex 11
SELECT numemp, COUNT(numemp)
FROM empregado
GROUP BY numemp;

-- ex 12
SELECT funcao, COUNT(comissao) AS "Numero de comissoes"
FROM empregado
GROUP BY funcao
ORDER BY COUNT(comissao) DESC;

-- ex 13
SELECT numdep AS "Numero do departamento", COUNT(numdep) AS "Numero de empregados"
FROM empregado
GROUP BY numdep
HAVING COUNT(numdep) > 3
ORDER BY COUNT(numdep) DESC;

-- ex 14
SELECT
	chefe AS "Numero do Chefe",
	COUNT(numemp) AS "Numero de Empregados Chefiados"
FROM empregado
WHERE chefe IS NOT NULL
GROUP BY chefe
ORDER BY COUNT(numemp) DESC;

-- ex 15
SELECT
	chefe AS "Numero do Chefe",
	COUNT(numemp) AS "Numero Chefiados",
	MAX(salario) AS "Maior Salario Chefiados",
	MIN(salario) AS "Menor Salario Chefiados",
	TRUNC(AVG(salario),0) AS "Salario Medio Chefiados"
FROM empregado
WHERE chefe IS NOT NULL AND salario > 1000
GROUP BY chefe
ORDER BY AVG(salario) DESC;

-- ex 16
SELECT d.localizacao, COUNT(d.localizacao) AS "FUNCIONARIOS", SUM(e.salario) AS "VOLUME_SALARIO_MENSAL"
FROM empregado e
JOIN departamento d ON e.numdep = d.numdep
GROUP BY d.localizacao;

-- ex 18
SELECT MAX(e.salario) AS "MAX", MIN(e.salario) AS "MIN"
FROM empregado e
JOIN escala_salarial es ON es.minsal <= e.salario AND es.maxsal >= e.salario
JOIN departamento d ON e.numdep = d.numdep
WHERE es.escala = 4 AND (d.localizacao = 'Lisboa' OR d.localizacao = 'Santarém');

-- ex 19
SELECT funcao AS "Funcao", ROUND(AVG(salario), 0) AS "Media mensal", SUM((salario * 14) + NVL(comissao, 0)) AS "Volume Salarial Anual"
FROM empregado
GROUP BY funcao
ORDER BY funcao;

-- ex 20
SELECT SUM((salario * 14) + comissao) AS "Remuneracao Salarial Anual"
FROM empregado
WHERE funcao = 'Vendedor' AND comissao > 0;

-- ex 23
SELECT
	numdep,
	funcao,
	MAX(salario),
	MIN(salario),
	TO_CHAR(AVG(salario), '99G999D99MI')
FROM empregado
WHERE numdep = 20 OR numdep = 30
GROUP BY funcao, numdep
ORDER BY numdep DESC, funcao ASC;