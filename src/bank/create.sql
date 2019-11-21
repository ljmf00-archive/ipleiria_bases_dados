CREATE TABLE tipo_conta(
   id        NUMBER(3),
   tipo      VARCHAR2(30) NOT NULL,
   juro      NUMBER(4,2)  NOT NULL,
   CONSTRAINT pk_tipoConta_id PRIMARY KEY(id),
   CONSTRAINT uq_tipoConta_tipo UNIQUE(tipo)
);

CREATE TABLE agencia(
   id        NUMBER(3),
   nome      VARCHAR2(50) NOT NULL,
   CONSTRAINT pk_agencia_id PRIMARY KEY(id),
   CONSTRAINT uq_agencia_nome UNIQUE(nome)
);

CREATE TABLE conta(
   id          NUMBER(7),
   iban        CHAR(24),
   saldo       NUMBER(10,2) NOT NULL,
   idTipoConta NUMBER(3) NOT NULL,
   idAgencia   NUMBER(3) NOT NULL,
   CONSTRAINT pk_conta_id PRIMARY KEY(id),
   CONSTRAINT uq_conta_iban UNIQUE(iban),
   CONSTRAINT fk_conta_idTipoConta FOREIGN KEY(idTipoConta) REFERENCES tipo_Conta(id),
   CONSTRAINT fk_conta_idAgencia FOREIGN KEY(idAgencia) REFERENCES agencia(id),
   CONSTRAINT ck_conta_iban CHECK (REGEXP_LIKE(iban,'(PT)[0-9]{22}'))
);

CREATE TABLE cliente(
   id        NUMBER(7),
   nome      VARCHAR2(50) NOT NULL,
   CONSTRAINT pk_cliente_id  PRIMARY KEY(id)
);

CREATE TABLE conta_cliente(
   idCliente    NUMBER(7),
   idConta      NUMBER(7),
   titular      CHAR(1) NOT NULL,
   CONSTRAINT pk_contaCliente PRIMARY KEY(idCliente,idConta),
   CONSTRAINT fk_contaCliente_idCliente FOREIGN KEY(idCliente) REFERENCES cliente(id),
   CONSTRAINT fk_contaCliente_idConta FOREIGN KEY(idConta) REFERENCES conta(id),
   CONSTRAINT ck_contaCliente_titular CHECK(titular IN ('S','N'))
);

--

CREATE TABLE operacao(
   id             NUMBER(7),
   dataOp         DATE NOT NULL,
   idCliente      NUMBER(7),
   idConta        NUMBER(7),
   CONSTRAINT pk_operacao PRIMARY KEY(id),
   CONSTRAINT fk_operacao_idCliente FOREIGN KEY(idCliente) REFERENCES cliente(id),
   CONSTRAINT fk_operacao_idConta FOREIGN KEY(idConta) REFERENCES conta(id)
);

CREATE TABLE op_fecho(
   idOpF      NUMBER(7),
   razao      VARCHAR2(50) NOT NULL,
   CONSTRAINT pk_op_fecho PRIMARY KEY(idOpF),
   CONSTRAINT fk_op_fecho_idOpF FOREIGN KEY(idOpF) REFERENCES operacao(id)
);

CREATE TABLE op_deplev(
   idOpDL     NUMBER(7),
   quantia    INTEGER NOT NULL,
   CONSTRAINT pk_op_deplev PRIMARY KEY(idOpDL),
   CONSTRAINT fk_op_deplev_idOpDL FOREIGN KEY(idOpDL) REFERENCES operacao(id)
   CONSTRAINT ck_op_deplev_quantia CHECK(quantia >= -200 AND 5 < 2000)
);

CREATE TABLE op_abertura(
   idOpA     NUMBER(7),
   estado    VARCHAR2(2) NOT NULL,
   CONSTRAINT pk_op_abertura PRIMARY KEY(idOpA),
   CONSTRAINT fk_op_abertura_idOpA FOREIGN KEY(idOpA) REFERENCES operacao(id),
   CONSTRAINT ck_op_abertura_estado CHECK(estado IN ('OK','MI','UV'))
)

CREATE TABLE empregado(
   idEmp            NUMBER(7),
   nome             VARCHAR2(50) NOT NULL,
   data_contratacao DATE NOT NULL,
   telefone         NUMBER(9),
   CONSTRAINT pk_empregado PRIMARY KEY(id)
)

CREATE TABLE empregado_gestor(
   idEmp           NUMBER(7),
   email           VARCHAR2(50) NOT NULL,
   CONSTRAINT pk_empregado_gestor PRIMARY KEY(idEmp),
   CONSTRAINT fk_empregado_gestor FOREIGN KEY(idEmp) REFERENCES empregado(idEmp)
)
