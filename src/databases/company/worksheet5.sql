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

-- ex2 (best)
SELECT nomedep
FROM departamento
WHERE numdep IN (
	SELECT DISTINCT numdep
	FROM empregado
	WHERE salario = (
		SELECT MIN(salario)
		FROM empregado
	)
);

-- ex3
SELECT nomedep
FROM departamento d
JOIN empregado e ON d.numdep = e.numdep
GROUP BY nomedep
HAVING AVG(salario) < (
	SELECT AVG(salario)
	FROM empregado
	)
);

-- ex3 (best)
SELECT nomedep
FROM departamento
WHERE numdep IN (
	SELECT numdep
	FROM empregado
	GROUP BY numdep
	HAVING AVG(salario) < (
		SELECT AVG(salario)
		FROM empregado
	)
);

-- ex4
SELECT nomedep
FROM departamento d
WHERE numdep NOT IN (
	SELECT DISTINCT numdep
	FROM empregado
);

-- ex5 (best)
SELECT COUNT(*) AS "Numero de chefes"
FROM (
	SELECT DISTINCT chefe
	FROM empregado
	WHERE chefe IS NOT NULL
);

-- ex5
SELECT COUNT(*) AS "Numero de chefes"
FROM (
	SELECT chefe
	FROM empregado
	WHERE chefe IS NOT NULL
	GROUP BY chefe
);

-- ex5
SELECT COUNT(DISTINCT chefe) AS "Numero de chefes"
FROM empregado;

-- ex7
SELECT COUNT(*) AS "Dept com mais de 3 Emp."
FROM (
	SELECT COUNT(numdep)
	FROM empregado
	GROUP BY numdep
	HAVING COUNT(numdep) > 3
);

-- ex8
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

-- ex10
SELECT
	numdep,
	"encargoar"
FROM (
	SELECT
		numdep,
		SUM(12*salario) AS "encargoar"
	FROM empregado
	GROUP BY numdep
)
WHERE "encargoar" = (
	SELECT MAX("encargoar")
	FROM (
		SELECT
			numdep,
			SUM(12*salario) AS "encargoar"
		FROM empregado
		GROUP BY numdep
	)
);

-- ex11
SELECT
	year_dtac,
	COUNT(*)
FROM (
	SELECT
		EXTRACT(YEAR FROM dtacontratacao) AS year_dtac
	FROM empregado
)
GROUP BY year_dtac;