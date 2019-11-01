-- ex1
-- bootstrap.sql if needed

-- ex2 a
SELECT
	numdep,
	nomedep,
	localizacao
FROM departamento
ORDER BY numdep;

-- ex2 b
SELECT
	numemp,
	nomeemp,
	funcao,
	chefe,
	dtacontratacao,
	salario,
	comissao,
	numdep
FROM empregado
ORDER BY numemp;

-- ex2 c
SELECT
	escala,
	minsal,
	maxsal
FROM escala_salarial
ORDER BY escala;

-- ex2 d
SELECT
	idhist,
	numemp,
	funcao,
	dtainicio,
	dtafim,
	numdep
FROM historico_funcao;


-- ex3
SELECT DISTINCT funcao
FROM empregado
ORDER BY funcao ASC;

-- ex4
SELECT DISTINCT numdep
FROM empregado
ORDER BY numdep DESC;

-- ex5
SELECT
	nomeemp,
	salario,
	NVL(TO_CHAR(comissao), 'Nao existe') AS "comissao"
FROM empregado
ORDER BY
	salario DESC,
	nomeemp ASC;

-- ex6
SELECT
	numemp,
	nomeemp,
	salario
FROM empregado
WHERE salario > 2000;

-- ex 7
SELECT
	UPPER(nomeemp) || 'é ' || UPPER(funcao) || ', no departamento '
		|| numdep || ', desde '
		|| TO_CHAR(dtacontratacao, 'DD "de" MONTH "de" YYYY')
		AS "Quem, Onde, Quando"
FROM empregado;

-- ex 8
SELECT
	'O ' || UPPER(nomeemp) || ' ganha ' || salario || ' mas queria ganhar '
		|| salario * 3 AS "salarios"
FROM empregado;

-- ex 9
SELECT
	nomeemp,
	salario,
	comissao
FROM empregado
WHERE comissao IS NOT NULL AND comissao > salario
ORDER BY nomeemp ASC;

-- ex 10
SELECT
	nomeemp,
	funcao
FROM empregado
WHERE funcao = 'Vendedor' OR funcao = 'Director'
ORDER BY nomeemp;

-- ex 11
SELECT
	nomeemp,
	funcao,
	numdep
FROM empregado
WHERE numdep = 10 OR numdep = 20;

-- ex 12
SELECT nomeemp
FROM empregado
WHERE UPPER(nomeemp) LIKE 'M%';

-- ex 13
SELECT nomeemp
FROM empregado
WHERE UPPER(nomeemp) LIKE '%DO';

-- ex 14
SELECT nomeemp
FROM empregado
WHERE UPPER(nomeemp) LIKE 'M%O';

-- ex 15
SELECT nomeemp
FROM empregado
WHERE UPPER(nomeemp) LIKE '%O%'
ORDER BY nomeemp ASC;

-- ex 16
SELECT nomeemp
FROM empregado
WHERE
	UPPER(nomeemp) NOT LIKE 'A%' AND UPPER(nomeemp) LIKE '%A%'
ORDER BY nomeemp;

-- ex 17
SELECT nomeemp
FROM empregado
WHERE NOT UPPER(nomeemp) LIKE '%O%';

-- ex 18
SELECT
	LOWER(nomeemp),
	comissao
FROM empregado
WHERE comissao IS NOT NULL AND comissao <> 0;

-- ex 19
SELECT
	numemp,
	nomeemp AS "NOME_EMPREGADO"
FROM empregado
WHERE chefe IS NULL;

-- ex 20
SELECT
	nomeemp,
	salario
FROM empregado
WHERE comissao IS NULL AND salario > 3000;

-- ex 21
SELECT
	nomeemp,
	TRUNC(salario*1.15, 0) AS "Salario Futuro"
FROM empregado
ORDER BY salario DESC;

-- ex 22
SELECT
	nomeemp,
	TO_CHAR(dtacontratacao, 'DD-MM-YYYY') AS "Data de Contratacao",
	ADD_MONTHS(dtacontratacao, 12) AS "Data revisao"
FROM empregado
ORDER BY nomeemp ASC;

-- ex 23
SELECT
	nomeemp,
	TO_CHAR(dtacontratacao, 'DD-MM-YYYY') AS "Data de contratacao",
	TRUNC(MONTHS_BETWEEN(SYSDATE,dtacontratacao)/12, 0) || ' anos e '
		|| TRUNC(MOD(MONTHS_BETWEEN(SYSDATE,dtacontratacao), 12), 0)
		|| ' meses de servico' AS "Tempo de Servico"
FROM empregado
ORDER BY nomeemp;

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