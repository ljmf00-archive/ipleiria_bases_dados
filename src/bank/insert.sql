
INSERT INTO cliente (id, nome) VALUES (11001, 'Carlos Sousa');
INSERT INTO cliente (id, nome) VALUES (12004, 'Jorge Ferreira');
INSERT INTO cliente (id, nome) VALUES (13006, 'Miguel Carmo');
INSERT INTO cliente (id, nome) VALUES (11009, 'Pedro Mico');

INSERT INTO agencia (id, nome) VALUES (1, 'Celas');
INSERT INTO agencia (id, nome) VALUES (2, 'Calhab�');
INSERT INTO agencia (id, nome) VALUES (3, 'Rio Tinto');
INSERT INTO agencia (id, nome) VALUES (4, 'Calif�rnia');
INSERT INTO agencia (id, nome) VALUES (8, 'C�mara');

INSERT INTO tipo_conta (id, tipo, juro) VALUES (1, 'PPR', 2.5);
INSERT INTO tipo_conta (id, tipo, juro) VALUES (2, 'Ordem', 0.4);
INSERT INTO tipo_conta (id, tipo, juro) VALUES (3, 'Prazo', 2.0);
INSERT INTO tipo_conta (id, tipo, juro) VALUES (4, 'Future Kids', 1.0);
INSERT INTO tipo_conta (id, tipo, juro) VALUES (10, 'Poupan�a Habita��o', 0.4);

INSERT INTO conta (id, iban, saldo, idTipoConta, idAgencia) VALUES (1001, 'PT5000180001002020202020', 123.03, 1, 1);
INSERT INTO conta (id, iban, saldo, idTipoConta, idAgencia) VALUES (1733, 'PT5000180002003030303030', 298.00, 2, 2);
INSERT INTO conta (id, iban, saldo, idTipoConta, idAgencia) VALUES (2009, 'PT5000180001004040404040', 1148.00, 2, 1);
INSERT INTO conta (id, iban, saldo, idTipoConta, idAgencia) VALUES (2017, 'PT5000180008005050505050', 329.00, 3, 8);

INSERT INTO conta_cliente (idCliente, idConta, titular) VALUES (11001, 1001, 'S');
INSERT INTO conta_cliente (idCliente, idConta, titular) VALUES (12004, 1001, 'N');
INSERT INTO conta_cliente (idCliente, idConta, titular) VALUES (13006, 1733, 'S');
INSERT INTO conta_cliente (idCliente, idConta, titular) VALUES (11001, 1733, 'N');
INSERT INTO conta_cliente (idCliente, idConta, titular) VALUES (11009, 2009, 'S');
INSERT INTO conta_cliente (idCliente, idConta, titular) VALUES (11001, 2017, 'S');

INSERT INTO operacao (id, dataOp, idCliente, idConta) VALUES (1, TO_DATE('29-10-2017 14:00:50','dd-mm-yyyy HH24:MI:SS'), 11001);
INSERT INTO operacao (id, dataOp, idCliente, idConta) VALUES (2, TO_DATE('01-11-2017 16:10:30','dd-mm-yyyy HH24:MI:SS'), 13006);
INSERT INTO operacao (id, dataOp, idCliente, idConta) VALUES (3, TO_DATE('01-11-2017 18:15:41','dd-mm-yyyy HH24:MI:SS'), 11001);
INSERT INTO operacao (id, dataOp, idCliente, idConta) VALUES (4, TO_DATE('02-11-2017 10:11:20','dd-mm-yyyy HH24:MI:SS'), 11009);
INSERT INTO operacao (id, dataOp, idCliente, idConta) VALUES (4, TO_DATE('02-11-2017 10:15:00','dd-mm-yyyy HH24:MI:SS'), 11001);
INSERT INTO operacao (id, dataOp, idCliente, idConta) VALUES (4, TO_DATE('03-11-2017 9:30:00','dd-mm-yyyy HH24:MI:SS'), 11009);

INSERT INTO op_fecho (idOpF, razao) VALUES (1, 'A pedido do cliente');
INSERT INTO op_fecho (idOpF, razao) VALUES (5, 'A pedido do cliente');

INSERT INTO op_deplev (idOpDL, quantia) VALUES (2, 50);
INSERT INTO op_deplev (idOpDL, quantia) VALUES (3, 150);
INSERT INTO op_deplev (idOpDL, quantia) VALUES (4, -45);
INSERT INTO op_deplev (idOpDL, quantia) VALUES (5, -20);

COMMIT;
