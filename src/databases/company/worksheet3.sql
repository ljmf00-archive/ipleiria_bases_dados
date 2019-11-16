-- ex1
SELECT
	e.nomeemp,
	e.numdep,
	d.nomedep,
	d.localizacao
FROM empregado e
JOIN departamento d ON e.numdep = d.numdep;

-- ex2
SELECT
	e.nomeemp AS "NOME_EMP",
	e.salario,
	d.nomedep,
	d.localizacao
FROM empregado e
JOIN departamento d ON e.numdep = d.numdep
WHERE e.salario > 1500
ORDER BY e.nomeemp ASC;
	
-- ex3
SELECT
	e.nomeemp AS "NOME",
	h.funcao,
	TO_CHAR(h.dtainicio, 'DD-Mon-YYYY') AS "DATAINICIO",
	TO_CHAR(h.dtafim, 'DD-MON-YYYY') AS "DATAFIM",
	d.nomedep AS "DEPARTAMENTO"
FROM empregado e
	JOIN historico_funcao h ON e.numemp = h.numemp
	JOIN departamento d ON h.numdep = d.numdep
ORDER BY
	e.nomeemp ASC,
	h.dtafim DESC;

-- ex4
SELECT
	e.nomeemp AS "NOME_EMP",
	e.funcao,
	e.salario,
	es.escala
FROM empregado e
JOIN escala_salarial es ON es.minsal <= e.salario AND es.maxsal >= e.salario
ORDER BY e.salario DESC;

-- ex5
SELECT
	e.nomeemp AS "NOME_EMP",
	es.escala
FROM empregado e
JOIN escala_salarial es ON es.minsal <= e.salario AND es.maxsal >= e.salario
WHERE escala = 3;

-- ex6
SELECT
	e.nomeemp,
	e.funcao,
	e.salario,
	es.escala,
	d.nomedep
FROM empregado e
JOIN escala_salarial es ON es.minsal <= e.salario AND es.maxsal >= e.salario
JOIN departamento d ON d.numdep = e.numdep
WHERE e.funcao <> 'Analista'
ORDER BY e.salario DESC, e.nomeemp DESC;

-- ex 7
SELECT
	e.nomeemp,
	e.funcao,
	(e.salario * 14 + NVL(e.comissao, 0)) AS "Remuneracao Anual",
	es.escala,
	d.nomedep
FROM empregado e
JOIN escala_salarial es ON es.minsal <= e.salario AND es.maxsal >= e.salario
JOIN departamento d ON d.numdep = e.numdep
WHERE e.funcao = 'Escriturário' OR (e.salario * 12) >= 36000
ORDER BY "Remuneracao Anual" DESC;

-- ex 8
SELECT
	e.numemp AS "NUMERO EMPREGADO",
	e.nomeemp AS "NOME EMPREGADO",
	em.numemp AS "NUMERO DO SEU CHEFE",
	em.nomeemp AS "NOME CHEFE"
FROM empregado e
	JOIN empregado em ON em.numemp = e.chefe
ORDER BY em.numemp, e.nomeemp;

-- ex 9
SELECT
	e.numemp AS "NUM_FUNC",
	e.nomeemp AS "NOME_FUNC",
	TO_CHAR(e.dtacontratacao, 'YYYY.MM.DD') AS "DATA_FUNC",
	em.numemp AS "NUM_CHEFE",
	em.nomeemp AS "NOME_CHEFE",
	TO_CHAR(em.dtacontratacao, 'YYYY.MM.DD') AS "DATA_CHEFE"
FROM empregado e
JOIN empregado em ON em.numemp = e.chefe
WHERE MONTHS_BETWEEN(em.dtacontratacao, e.dtacontratacao) > 0
ORDER BY e.nomeemp;

-- ex 10
SELECT
	e.numemp AS "NUM_FUNC",
	e.nomeemp AS "NOME_FUNC",
	TO_CHAR(e.dtacontratacao, 'YYYY.MM.DD') AS "DATA_FUNC",
	em.numemp AS "NUM_CHEFE",
	em.nomeemp AS "NOME_CHEFE",
	TO_CHAR(em.dtacontratacao, 'YYYY.MM.DD') AS "DATA_CHEFE"
FROM empregado e
LEFT JOIN empregado em ON em.numemp = e.chefe
WHERE MONTHS_BETWEEN(em.dtacontratacao, e.dtacontratacao) > 0
	OR e.funcao = 'Presidente'
ORDER BY e.nomeemp;

-- ex 11
SELECT
	e.nomeemp,
	d.numdep,
	d.nomedep,
	d.localizacao
FROM empregado e
RIGHT JOIN departamento d ON e.numdep = d.numdep;

-- ex 12
SELECT
	e.nomeemp AS "NOME_EMP",
	EXTRACT(YEAR FROM e.dtacontratacao) AS "ANO_EMP",
	em.nomeemp AS "NOME_CHEFE",
	EXTRACT(YEAR FROM em.dtacontratacao) AS "ANO_CHEFE"
FROM empregado e
JOIN empregado em ON em.numemp = e.chefe
WHERE EXTRACT(YEAR FROM e.dtacontratacao) = EXTRACT(YEAR FROM em.dtacontratacao)
ORDER BY "NOME_EMP";

-- ex 13
SELECT DISTINCT d.localizacao
FROM departamento d
JOIN empregado e ON d.numdep = e.numdep
WHERE e.funcao = 'Director';

-- ex 14
SELECT d.numdep
FROM empregado e
RIGHT JOIN departamento d ON d.numdep = e.numdep
WHERE e.numdep IS NULL;

-- ex 15
SELECT 'COM chefe: ' || COUNT(chefe) AS "#empregados"
FROM empregado
UNION
	SELECT 'SEM chefe: ' || COUNT(*)
	FROM empregado
WHERE chefe IS NULL;

-- ex 19
SELECT
	hf.numemp,
	hf.funcao,
	'Exerceu durante ' || TRUNC(MONTHS_BETWEEN(hf.dtafim, hf.dtainicio),0) || ' meses' AS "Duracao",
	d.nomedep
FROM historico_funcao hf
FULL OUTER JOIN empregado e ON e.numemp = hf.numemp
JOIN departamento d ON d.numdep = hf.numdep
UNION
SELECT
	e.numemp,
	e.funcao,
	'A exercer ha ' || TRUNC(MONTHS_BETWEEN(SYSDATE, e.dtacontratacao),0) || ' meses' AS "Duracao",
	d.nomedep
FROM empregado e
JOIN departamento d ON d.numdep = e.numdep
ORDER BY numemp, funcao;