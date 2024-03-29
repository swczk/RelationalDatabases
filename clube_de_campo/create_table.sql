CREATE TABLE tb_tipo_titulo (
  cod_tipo_titulo NUMBER(6,0) NOT NULL,
  desc_tipo_titulo VARCHAR2(25) NOT NULL,
  ind_situacao CHAR(1) DEFAULT 'A',
  val_mensalidade NUMBER(9,2) NOT NULL
);

CREATE TABLE tb_local (
  cod_local NUMBER(6,0) NOT NULL,
  desc_local VARCHAR2(60) NOT NULL,
  ind_situacao CHAR(1) DEFAULT 'A',
  val_locacao NUMBER(9,2) NOT NULL
);

CREATE TABLE tb_estado (
  cod_estado CHAR(2) NOT NULL,
  desc_estado VARCHAR2(35) NOT NULL
);

CREATE TABLE tb_cidade (
  cod_cidade NUMBER(6,0) NOT NULL,
  desc_cidade VARCHAR2(45) NOT NULL,
  cod_estado CHAR(2) NOT NULL
);

CREATE TABLE tb_socio (
  cod_socio NUMBER(6,0) NOT NULL,
  nome VARCHAR2(40) NOT NULL,
  cod_tipo_titulo NUMBER(6,0) NOT NULL,
  cod_cidade NUMBER(6,0) NOT NULL,
  endereco VARCHAR2(35) NOT NULL,
  bairro VARCHAR2(25) NOT NULL,
  cpf VARCHAR2(14),
  identidade VARCHAR2(15),
  dt_nascimento DATE,
  celular VARCHAR2(19),
  e_mail VARCHAR2(120),
  dt_cadastro DATE,
  ind_situacao CHAR(1) DEFAULT 'A',
  cep VARCHAR2(10)
);

CREATE TABLE tb_local_socio (
  cod_local_socio NUMBER(9,0) NOT NULL,
  cod_local NUMBER(9,0) NOT NULL,
  cod_socio NUMBER(9,0) NOT NULL,
  dt_reserva DATE NOT NULL,
  val_reserva NUMBER(9,2) NOT NULL,
  desc_observacao VARCHAR2(200),
  ind_situacao CHAR(1) DEFAULT 'A'
);

CREATE TABLE tb_medico (
  cod_medico NUMBER(6,0) NOT NULL,
  nome VARCHAR2(45) NOT NULL,
  endereco VARCHAR2(40) NOT NULL,
  e_mail VARCHAR2(150) NOT NULL,
  celular VARCHAR2(19) NOT NULL,
  cod_cidade NUMBER(6,0) NOT NULL
);

CREATE TABLE tb_conta_receber (
  cod_conta_receber NUMBER(6,0) NOT NULL,
  cod_socio NUMBER(6,0) NOT NULL,
  cod_local_socio NUMBER(6,0),
  dt_emissao DATE NOT NULL,
  dt_vencimento DATE NOT NULL,
  dt_pagamento DATE,
  val_original NUMBER(9,2) NOT NULL,
  val_titulo NUMBER(9,2) NOT NULL,
  ind_situacao CHAR(1) DEFAULT 'A'
);

CREATE TABLE tb_mensalidade (
  cod_mensalidade NUMBER(6,0) NOT NULL,
  cod_socio NUMBER(6,0) NOT NULL,
  dt_emissao DATE NOT NULL,
  dt_vencimento DATE NOT NULL,
  dt_pagamento DATE,
  val_original NUMBER(9,2) NOT NULL,
  val_titulo NUMBER(9,0) NOT NULL,
  ind_situacao CHAR(1) DEFAULT 'A'
);

CREATE TABLE tb_caixa (
  cod_caixa NUMBER(9,0) NOT NULL,
  cod_mensalidade NUMBER(9,0),
  cod_conta_receber NUMBER(9,0),
  cod_local_socio NUMBER(9,0),
  cod_socio NUMBER(9,0) NOT NULL,
  dt_caixa DATE NOT NULL,
  val_caixa NUMBER(9,2) NOT NULL,
  desc_observacao VARCHAR2(100)
);

CREATE TABLE tb_convidado (
  cod_convidado NUMBER(9,0) NOT NULL,
  nome VARCHAR2(40) NOT NULL,
  endereco VARCHAR2(35) NOT NULL,
  celular VARCHAR2(19),
  e_mail VARCHAR2(120),
  dt_convidado DATE NOT NULL,
  qt_dias NUMBER(9,0) NOT NULL,
  cod_socio NUMBER(9,0) NOT NULL
);

CREATE TABLE tb_dependente (
  cod_dependente NUMBER(9,0) NOT NULL,
  cod_socio NUMBER(9,0) NOT NULL,
  nome VARCHAR2(40) NOT NULL,
  celular VARCHAR2(19),
  e_mail VARCHAR2(120),
  dt_nascimento DATE NOT NULL,
  sexo CHAR(1) DEFAULT 'M',
  grau_dependencia VARCHAR2(10) DEFAULT 'FILHO',
  ind_situacao CHAR(1) DEFAULT 'A'
);

CREATE TABLE tb_entrada_saida (
  cod_entrada_saida NUMBER(9,0) NOT NULL,
  cod_socio NUMBER(9,0),
  cod_dependente NUMBER(9,0),
  cod_convidado NUMBER(9,0),
  dt_entrada_saida DATE NOT NULL,
  desc_local VARCHAR2(15),
  ind_tipo CHAR(1) DEFAULT 'E'
);

CREATE TABLE tb_exame_medico (
  cod_exame_medico NUMBER(9,0) NOT NULL,
  cod_socio NUMBER(9,0),
  cod_dependente NUMBER(9,0),
  cod_convidado NUMBER(9,0),
  cod_medico NUMBER(9,0) NOT NULL,
  dt_exame DATE NOT NULL,
  dias_validade NUMBER(9,0) NOT NULL,
  ind_situacao CHAR(1) DEFAULT 'A',
  desc_observacao VARCHAR2(300)
);