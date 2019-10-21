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

-- ex 8
SELECT
	e.numemp AS "NUMERO EMPREGADO",
	e.nomeemp AS "NOME EMPREGADO",
	em.numemp AS "NUMERO DO SEU CHEFE",
	em.nomeemp AS "NOME CHEFE"
FROM empregado e
	JOIN empregado em ON em.numemp = e.chefe
ORDER BY em.numemp;

-- ex 11
SELECT e.nomeemp, d.numdep, d.nomedep, d.localizacao
FROM empregado e
	RIGHT JOIN departamento d ON e.numdep = d.numdep;
	
-- ex 14
SELECT d.numdep
FROM empregado e
RIGHT JOIN departamento d ON d.numdep = e.numdep
WHERE e.numdep IS NULL;