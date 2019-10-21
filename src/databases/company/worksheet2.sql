-- ex3
SELECT DISTINCT funcao
FROM empregado
ORDER BY funcao ASC;

-- ex4
SELECT
	nomeemp,
	salario,
	NVL(TO_CHAR(comissao), 'Nao existe') AS "comissao"
FROM empregado
ORDER BY
	salario DESC,
	nomeemp ASC;

-- ex 8
SELECT 'O ' || UPPER(nomeemp) || ' ganha ' || salario || ' mas queria ganhar ' || salario * 3 AS "salarios"
FROM empregado;

-- ex 9
SELECT
	nomeemp,
	salario,
	comissao
FROM empregado
WHERE comissao IS NOT NULL AND comissao > salario
ORDER BY nomeemp ASC;

-- ex 15
SELECT nomeemp
FROM empregado
WHERE UPPER(nomeemp) LIKE '%O%'
ORDER BY nomeemp ASC;
	
-- ex 17

SELECT nomeemp
FROM empregado
WHERE NOT UPPER(nomeemp) LIKE '%O%';

-- ex 20
SELECT
	nomeemp,
	salario
FROM empregado
WHERE comissao IS NULL AND salario > 3000;

-- ex 22
SELECT
	nomeemp,
	TO_CHAR(dtacontratacao, 'DD-MM-YYYY') AS "Data de Contratacao",
	ADD_MONTHS(dtacontratacao, 12) AS "Data revisao"
FROM empregado
ORDER BY nomeemp ASC;

-- ex 24
SELECT
	nomeemp,
	(salario * 14) + NVL(comissao, 0) AS "REMUNERACAO ANUAL"
FROM empregado
ORDER BY nomeemp ASC;

-- ex 25
SELECT
	nomeemp,
	CASE
		WHEN salario < 1500 THEN 'Menor que 1500'
		WHEN salario > 1500 THEN TO_CHAR(salario)
		ELSE 'Valor Exato'
	END AS "SAL"
FROM empregado
ORDER BY nomeemp;