-- ex 20
INSERT INTO historico_funcao
VALUES (
	603,
	7499,
	'Escriturário',
	(
		SELECT dtacontratacao
		FROM empregado
		WHERE numemp=7499
	),
	(
		SELECT ADD_MONTHS(dtacontratacao, 12)
		FROM empregado
		WHERE numemp=7499
	),
	(
		SELECT numdep
		FROM departamento
		WHERE nomedep='Pesquisa'
	)
)

-- ex 21
INSERT INTO empregado
SELECT
	7777,
	'Joaquim',
	funcao,
	chefe,
	dtacontratacao,
	salario,
	comissao,
	numdep
FROM empregado
WHERE numemp=7788;

-- ex 22
UPDATE empregado
SET
	dtacontratacao=(
		SELECT ADD_MONTHS(dtacontratacao, -12)
		FROM empregado
		WHERE numemp=7788
	),
	numdep=(
		SELECT numdep
		FROM empregado
		WHERE numemp=7788
	),
	funcao=(
		SELECT funcao
		FROM empregado
		WHERE numemp=7788
	)
WHERE numemp=7777;
