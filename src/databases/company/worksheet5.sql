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