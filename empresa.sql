-- iniciar tabelas
DROP TABLE historico_funcao;
DROP TABLE empregado;
DROP TABLE departamento;
DROP TABLE escala_salarial;

CREATE TABLE departamento(
	numdep      INTEGER PRIMARY KEY,
	nomedep     VARCHAR2(20),
	localizacao VARCHAR2(20)
);

CREATE TABLE empregado(
	numemp         INTEGER PRIMARY KEY,
	nomeemp        VARCHAR2(20),
	funcao         VARCHAR2(20),
	chefe          INTEGER REFERENCES empregado(numemp),
	dtaContratacao DATE,
	salario        INTEGER,
	comissao       INTEGER,
	numdep         INTEGER REFERENCES departamento(numdep)
);

CREATE TABLE escala_salarial(
	escala INTEGER PRIMARY KEY,
	minsal NUMBER(5),
	maxsal NUMBER(5)
);

CREATE TABLE historico_funcao (
	IDhist    INTEGER PRIMARY KEY, 
	numemp    INTEGER REFERENCES empregado(numemp),
	funcao    VARCHAR2(20),
	dtaInicio DATE,
	dtaFim    DATE,
	numdep    INTEGER REFERENCES departamento(numdep)
);

INSERT INTO departamento (numdep,nomedep,localizacao) VALUES (10,'Contabilidade','Lisboa');
INSERT INTO departamento (numdep,nomedep,localizacao) VALUES (20,'Pesquisa','Leiria');
INSERT INTO departamento (numdep,nomedep,localizacao) VALUES (30,'Vendas','Santarém');
INSERT INTO departamento (numdep,nomedep,localizacao) VALUES (40,'Operações','Coimbra');

INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7839,'Frederico','Presidente',NULL,TO_DATE('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7566,'João','Director',7839,TO_DATE('02-04-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7782,'Carlos','Director',7839,TO_DATE('09-06-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7698,'Bernardo','Director',7839,TO_DATE('01-05-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7788,'Sebastião','Analista',7566,TO_DATE('19-04-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7844,'Tiago','Vendedor',7698,TO_DATE('08-09-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7900,'Jaime','Escriturário',7698,TO_DATE('03-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7902,'Fernando','Analista',7566,TO_DATE('03-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7369,'Silva','Escriturário',7902,TO_DATE('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7499,'Alexandre','Vendedor',7698,TO_DATE('20-02-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7521,'Armando','Vendedor',7698,TO_DATE('22-02-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7654,'Marco','Vendedor',7698,TO_DATE('28-09-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7876,'António','Escriturário',7788,TO_DATE('23-05-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7934,'Mário','Escriturário',7782,TO_DATE('23-01-1982','dd-mm-yyyy'),1300,NULL,10);

INSERT INTO escala_salarial (escala,minsal,maxsal) VALUES (1,700,1200);
INSERT INTO escala_salarial (escala,minsal,maxsal) VALUES (2,1201,1400);
INSERT INTO escala_salarial (escala,minsal,maxsal) VALUES (3,1401,2000);
INSERT INTO escala_salarial (escala,minsal,maxsal) VALUES (4,2001,3000);
INSERT INTO escala_salarial (escala,minsal,maxsal) VALUES (5,3001,9999);

INSERT INTO historico_funcao (IDhist, numemp, funcao, dtaInicio, dtaFim, numdep)
VALUES (254,7934, 'Escriturário', TO_DATE('23-01-1982','dd-mm-yyyy'), TO_DATE('23-05-1987','dd-mm-yyyy'), 20);
INSERT INTO historico_funcao (IDhist, numemp, funcao, dtaInicio, dtaFim, numdep)
VALUES (123, 7566, 'Director', TO_DATE('02-04-1981','dd-mm-yyyy'), TO_DATE('22-06-1981','dd-mm-yyyy'), 10);
INSERT INTO historico_funcao (IDhist, numemp, funcao, dtaInicio, dtaFim, numdep)
VALUES (124, 7782, 'Vendedor', TO_DATE('09-06-1981','dd-mm-yyyy'), TO_DATE('19-10-1982','dd-mm-yyyy'), 30);
INSERT INTO historico_funcao (IDhist, numemp, funcao, dtaInicio, dtaFim, numdep)
VALUES (315, 7839, 'Vendedor', TO_DATE('17-11-1981','dd-mm-yyyy'), TO_DATE('02-04-1989','dd-mm-yyyy'), 40);
INSERT INTO historico_funcao (IDhist, numemp, funcao, dtaInicio, dtaFim, numdep)
VALUES (601, 7839, 'Director', TO_DATE('03-04-1989','dd-mm-yyyy'), TO_DATE('17-01-1996','dd-mm-yyyy'), 30);
INSERT INTO historico_funcao (IDhist, numemp, funcao, dtaInicio, dtaFim, numdep)
VALUES (602, 7698, 'Escriturário', TO_DATE('01-05-1981','dd-mm-yyyy'), TO_DATE('17-01-1996','dd-mm-yyyy'), 40);
INSERT INTO historico_funcao (IDhist, numemp, funcao, dtaInicio, dtaFim, numdep)
VALUES (586, 7788, 'Vendedor', TO_DATE('19-04-1987','dd-mm-yyyy'),TO_DATE('02-11-1992','dd-mm-yyyy'), 30);

COMMIT;

-- fichas

-- ficha 1

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

-- ficha 2

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

-- ficha 4

--ex 1
SELECT COUNT(chefe) AS "Numero de empregados com chefe"
FROM empregado
WHERE chefe IS NOT NULL;

--ex 2
SELECT COUNT(DISTINCT chefe) AS "Numero Chefes na empresa"
FROM empregado
WHERE chefe IS NOT NULL;

--ex 3
SELECT COUNT(comissao) AS "Numero comissoes (>0)"
FROM empregado
WHERE comissao IS NOT NULL AND comissao > 0;

--ex 4
SELECT COUNT(DISTINCT numdep) AS "Numero de Dept. com Emp."
FROM empregado
WHERE numdep IS NOT NULL;

--ex 6
SELECT COUNT(funcao) AS "Numero de diretores"
FROM empregado
WHERE funcao IS NOT NULL AND funcao = 'Director';

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

-- ex 13
SELECT numdep AS "Numero do departamento", COUNT(numdep) AS "Numero de empregados"
FROM empregado
GROUP BY numdep
HAVING COUNT(numdep) > 3
ORDER BY COUNT(numdep) DESC;

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

-- ficha 5

-- ex1
SELECT nomeemp, numdep, salario
FROM empregado
WHERE salario > (SELECT AVG(salario) FROM empregado);

-- ex2
SELECT nomedep
FROM departamento d
JOIN empregado e ON d.numdep = e.numdep
WHERE e.salario = (
	SELECT MIN(salario)
	FROM empregado
);

-- ex3
SELECT nomedep
FROM departamento d
JOIN empregado e ON d.numdep = e.numdep
GROUP BY nomedep
HAVING AVG(salario) < (
	SELECT AVG(salario)
	FROM empregado
);

-- ex4
SELECT nomedep
FROM departamento d
WHERE numdep NOT IN (
	SELECT numdep
	FROM empregado
	GROUP BY numdep
);

-- ex5
SELECT COUNT(*) AS "Numero de chefes"
FROM (
	SELECT chefe
	FROM empregado
	WHERE chefe IS NOT NULL
	GROUP BY chefe
);

-- ex7
SELECT COUNT(*) AS "Dept com mais de 3 Emp."
FROM (
	SELECT COUNT(numdep)
	FROM empregado
	GROUP BY numdep
	HAVING COUNT(numdep) > 3
);

-- ex 8
SELECT
	e.nomeemp,
	e.numdep,
	e.salario
FROM empregado e
JOIN (
	SELECT
		AVG(salario) AS "avg_salario",
		numdep
	FROM empregado
	GROUP BY numdep
) s
ON e.numdep = s.numdep
WHERE e.salario > s."avg_salario"
ORDER BY
	e.numdep ASC,
	e.salario DESC;

-- ex10 FIXME: Wrong query
SELECT
	numdep,
	MAX("encargoar")
FROM (
	SELECT
		numdep,
		SUM(12*salario) AS "encargoar"
	FROM empregado
	GROUP BY numdep
)
GROUP BY numdep;