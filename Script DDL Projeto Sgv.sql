-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2023-03-15 22:14:14 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE t_sgv_categoria_produto CASCADE CONSTRAINTS;

DROP TABLE t_sgv_chamado CASCADE CONSTRAINTS;

DROP TABLE t_sgv_classificacao_video CASCADE CONSTRAINTS;

DROP TABLE t_sgv_cliente CASCADE CONSTRAINTS;

DROP TABLE t_sgv_fornecedor CASCADE CONSTRAINTS;

DROP TABLE t_sgv_funcionario CASCADE CONSTRAINTS;

DROP TABLE t_sgv_pes_fisica CASCADE CONSTRAINTS;

DROP TABLE t_sgv_pes_juridica CASCADE CONSTRAINTS;

DROP TABLE t_sgv_produto CASCADE CONSTRAINTS;

DROP TABLE t_sgv_video_produto CASCADE CONSTRAINTS;

DROP TABLE t_sgv_visualizacao_video CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_sgv_categoria_produto (
    cd_categoria_produto NUMBER(4) NOT NULL,
    ds_categoria         VARCHAR2(50) NOT NULL,
    st_categoria         CHAR(1) NOT NULL,
    dt_inicio            DATE NOT NULL,
    dt_termino           DATE
);

COMMENT ON TABLE t_sgv_categoria_produto IS
    'Representa a classificação do produto dentro da platafroma e-commerce ';

COMMENT ON COLUMN t_sgv_categoria_produto.cd_categoria_produto IS
    'Identificador único do código da categoria';

COMMENT ON COLUMN t_sgv_categoria_produto.ds_categoria IS
    'Descrição única da categoria; Forma de armazenamento: InitCap';

COMMENT ON COLUMN t_sgv_categoria_produto.st_categoria IS
    'Status da categoria; Forma de armazenamento: Maiúsculo';

ALTER TABLE t_sgv_categoria_produto ADD CONSTRAINT pk_t_sgv_categoria_produto PRIMARY KEY ( cd_categoria_produto );

ALTER TABLE t_sgv_categoria_produto ADD CONSTRAINT un_sgv_categprod_descricao UNIQUE ( ds_categoria );

CREATE TABLE t_sgv_chamado (
    cd_cliente            NUMBER(4) NOT NULL,
    cd_chamado            NUMBER(10) NOT NULL,
    cd_produto            NUMBER(6) NOT NULL,
    cd_funcionario        NUMBER(3) NOT NULL,
    dt_chamado            DATE NOT NULL,
    dt_atendimento        DATE,
    st_chamado            CHAR(1) NOT NULL,
    dt_tempo_atendimento  DATE,
    in_satisfacao_cliente NUMBER(2),
    ds_chamado            NUMBER(1) NOT NULL,
    tx_cliente            VARCHAR2(4000) NOT NULL
);

COMMENT ON TABLE t_sgv_chamado IS
    'Representa um chamado de Dúvidas e Sugestões que podem ser abertos somente por clientes ';

COMMENT ON COLUMN t_sgv_chamado.cd_chamado IS
    'Identificador único do código do chamado ';

COMMENT ON COLUMN t_sgv_chamado.st_chamado IS
    'Status do chamado; Forma de armazenamento: InitCap';

COMMENT ON COLUMN t_sgv_chamado.in_satisfacao_cliente IS
    'Forma de armazenamento: Nota de satisfação de um cliente entre intervalo de 1 a 10 ';

COMMENT ON COLUMN t_sgv_chamado.ds_chamado IS
    'Forma de armazenamento: Correspondende ao número do tipo do chamado; exemplo: se for o Tipo 1 inserir o número 1';

COMMENT ON COLUMN t_sgv_chamado.tx_cliente IS
    'Forma de armazenamento: InitCap';

ALTER TABLE t_sgv_chamado ADD CONSTRAINT pk_t_sgv_chamado PRIMARY KEY ( cd_chamado,
                                                                        cd_cliente );

CREATE TABLE t_sgv_classificacao_video (
    cd_classificacao_video NUMBER(4) NOT NULL,
    ds_classificacao       VARCHAR2(50) NOT NULL
);

COMMENT ON TABLE t_sgv_classificacao_video IS
    'Classificação de um vídeo dentro da plataforma e-commerce';

COMMENT ON COLUMN t_sgv_classificacao_video.cd_classificacao_video IS
    'Identificador único do código da classificação do vídeo';

COMMENT ON COLUMN t_sgv_classificacao_video.ds_classificacao IS
    'Descrição da classificação; Forma de armazenamento: InitCap';

ALTER TABLE t_sgv_classificacao_video ADD CONSTRAINT pk_t_sgv_classificacao_video PRIMARY KEY ( cd_classificacao_video );

CREATE TABLE t_sgv_cliente (
    cd_cliente  NUMBER(4) NOT NULL,
    id_login    VARCHAR2(20) NOT NULL,
    id_senha    VARCHAR2(20) NOT NULL,
    nm_cliente  VARCHAR2(100) NOT NULL,
    qt_estrelas NUMBER(1),
    st_cliente  CHAR(1) NOT NULL,
    nr_telefone VARCHAR2(13)
);

COMMENT ON TABLE t_sgv_cliente IS
    'São as pessoas físicas ou jurídicas que já possuem login e senha de acesso á plataforma de e-commerce';

COMMENT ON COLUMN t_sgv_cliente.cd_cliente IS
    'Identificador único do código do cliente ';

COMMENT ON COLUMN t_sgv_cliente.nm_cliente IS
    'Forma de armazenamento: InitCap';

COMMENT ON COLUMN t_sgv_cliente.qt_estrelas IS
    'Forma de armazenamento: Caractere numérico de 1 a 5';

COMMENT ON COLUMN t_sgv_cliente.st_cliente IS
    'Status do cliente; Forma de armazenamento: Maiúsculo';

COMMENT ON COLUMN t_sgv_cliente.nr_telefone IS
    'Máscara: (00)00000000';

ALTER TABLE t_sgv_cliente ADD CONSTRAINT pk_t_sgv_cliente PRIMARY KEY ( cd_cliente );

CREATE TABLE t_sgv_fornecedor (
    id_fornecedor   NUMBER(4) NOT NULL,
    nm_razao_social VARCHAR2(100) NOT NULL,
    ds_endereco     VARCHAR2(100) NOT NULL,
    nr_cep          VARCHAR2(8) NOT NULL,
    nm_cidade       VARCHAR2(50) NOT NULL,
    sg_estado       CHAR(2) NOT NULL
);

COMMENT ON TABLE t_sgv_fornecedor IS
    'Representa fornecedores de produtos para a plataforma e-commerce ';

COMMENT ON COLUMN t_sgv_fornecedor.id_fornecedor IS
    'Identificador único do fornecedor ';

COMMENT ON COLUMN t_sgv_fornecedor.ds_endereco IS
    'Descrição do endereço com número do local ';

ALTER TABLE t_sgv_fornecedor ADD CONSTRAINT pk_t_sgv_fornecedor PRIMARY KEY ( id_fornecedor );

CREATE TABLE t_sgv_funcionario (
    cd_funcionario  NUMBER(3) NOT NULL,
    nm_funcionario  VARCHAR2(80) NOT NULL,
    nr_cpf          VARCHAR2(11) NOT NULL,
    dt_nascimento   DATE NOT NULL,
    nr_telefone     VARCHAR2(13) NOT NULL,
    ds_email        VARCHAR2(100) NOT NULL,
    ds_cargo        VARCHAR2(60) NOT NULL,
    nm_departamento VARCHAR2(50) NOT NULL
);

COMMENT ON TABLE t_sgv_funcionario IS
    'Representa os dados de um funcionário da empresa Melhores Compras ';

COMMENT ON COLUMN t_sgv_funcionario.cd_funcionario IS
    'Identificador único do código do funcionário ';

COMMENT ON COLUMN t_sgv_funcionario.nm_funcionario IS
    'Forma de armazenamento: InitCap';

COMMENT ON COLUMN t_sgv_funcionario.nr_cpf IS
    'Número único do CPF ';

COMMENT ON COLUMN t_sgv_funcionario.nr_telefone IS
    'Número do telefone com DDD; Máscara: (00)00000000';

COMMENT ON COLUMN t_sgv_funcionario.ds_email IS
    'Forma de armazenamento: InitCap; Máscara:  XXXXXX@XXXX.com.br
';

COMMENT ON COLUMN t_sgv_funcionario.ds_cargo IS
    'Forma de armazenamento: InitCap';

COMMENT ON COLUMN t_sgv_funcionario.nm_departamento IS
    'Forma de armazenamento: InitCap';

ALTER TABLE t_sgv_funcionario ADD CONSTRAINT pk_t_sgv_funcionario PRIMARY KEY ( cd_funcionario );

ALTER TABLE t_sgv_funcionario ADD CONSTRAINT un_sgv_funcionario_cpf UNIQUE ( nr_cpf );

CREATE TABLE t_sgv_pes_fisica (
    cd_cliente    NUMBER(4) NOT NULL,
    nr_cpf        VARCHAR2(11) NOT NULL,
    dt_nascimento DATE NOT NULL,
    ds_sexo       CHAR(2) NOT NULL,
    ds_genero     CHAR(2)
);

COMMENT ON TABLE t_sgv_pes_fisica IS
    'Cliente pessoa física';

COMMENT ON COLUMN t_sgv_pes_fisica.ds_sexo IS
    'Forma de armazenamento: Maiúsculo';

COMMENT ON COLUMN t_sgv_pes_fisica.ds_genero IS
    'Forma de armazenamento: Maiúsculo';

ALTER TABLE t_sgv_pes_fisica ADD CONSTRAINT pk_t_sgv_pes_fisica PRIMARY KEY ( cd_cliente );

CREATE TABLE t_sgv_pes_juridica (
    cd_cliente            NUMBER(4) NOT NULL,
    dt_fundacao           DATE,
    nr_cnpj               VARCHAR2(14),
    nr_inscricao_estadual VARCHAR2(9)
);

COMMENT ON TABLE t_sgv_pes_juridica IS
    'Cliente pessoa jurídica';

ALTER TABLE t_sgv_pes_juridica ADD CONSTRAINT pk_t_sgv_pes_juridica PRIMARY KEY ( cd_cliente );

CREATE TABLE t_sgv_produto (
    cd_produto           NUMBER(6) NOT NULL,
    cd_categoria_produto NUMBER(4) NOT NULL,
    id_fornecedor        NUMBER(4) NOT NULL,
    ds_produto           VARCHAR2(50) NOT NULL,
    ds_completa_produto  VARCHAR2(100) NOT NULL,
    cod_barras_produto   VARCHAR2(13),
    st_produto           CHAR(1) NOT NULL,
    vl_unitario          NUMBER(7, 2) NOT NULL
);

COMMENT ON TABLE t_sgv_produto IS
    'São os objetos comercializados e disponíveis na plataforma';

COMMENT ON COLUMN t_sgv_produto.cd_produto IS
    'Identificador único do código do produto';

COMMENT ON COLUMN t_sgv_produto.ds_produto IS
    'Descrição normal única do produto; Forma de armazenamento: InitCap';

COMMENT ON COLUMN t_sgv_produto.ds_completa_produto IS
    'Descrição completa do produto; Forma de armazenamento: InitCap';

COMMENT ON COLUMN t_sgv_produto.st_produto IS
    'Status do produto; Forma de armazenamento: Maiúsculo';

ALTER TABLE t_sgv_produto
    ADD CONSTRAINT ck_sgv_prod_status CHECK ( st_produto = 'A'
                                              OR st_produto = 'I' );

ALTER TABLE t_sgv_produto ADD CONSTRAINT pk_t_sgv_produto PRIMARY KEY ( cd_produto );

ALTER TABLE t_sgv_produto ADD CONSTRAINT un_sgv_prod_descricao UNIQUE ( ds_produto );

CREATE TABLE t_sgv_video_produto (
    cd_produto             NUMBER(6) NOT NULL,
    cd_video_produto       NUMBER(4) NOT NULL,
    cd_classificacao_video NUMBER(4) NOT NULL,
    dt_cadastro_video      DATE NOT NULL,
    st_video               CHAR(1) NOT NULL
);

COMMENT ON TABLE t_sgv_video_produto IS
    'São os vídeos disponibilizados pelas áreas de negócio e que devem estar associados aos produtos';

COMMENT ON COLUMN t_sgv_video_produto.cd_video_produto IS
    'Identificador único do código do vídeo do produto ';

COMMENT ON COLUMN t_sgv_video_produto.st_video IS
    'Status do vídeo; Forma de armazenamento: Maiúsculo';

ALTER TABLE t_sgv_video_produto ADD CONSTRAINT pk_t_sgv_video_produto PRIMARY KEY ( cd_produto,
                                                                                    cd_video_produto );

CREATE TABLE t_sgv_visualizacao_video (
    cd_visualizacao_video NUMBER(4) NOT NULL,
    cd_video_produto      NUMBER(4) NOT NULL,
    cd_produto            NUMBER(6) NOT NULL,
    cd_cliente            NUMBER(4) NOT NULL,
    dt_visita_internauta  DATE NOT NULL,
    dt_visualizacao_video TIMESTAMP NOT NULL
);

COMMENT ON TABLE t_sgv_visualizacao_video IS
    'Representa uma visualização de um vídeo do produto feita por um usúario logado (cliente) ou anônimo';

ALTER TABLE t_sgv_visualizacao_video
    ADD CONSTRAINT pk_t_sgv_visualizacao_video PRIMARY KEY ( cd_video_produto,
                                                             cd_produto,
                                                             cd_visualizacao_video );                                                            

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT fk_sgv_chamado_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES t_sgv_cliente ( cd_cliente );

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT fk_sgv_chamado_func FOREIGN KEY ( cd_funcionario )
        REFERENCES t_sgv_funcionario ( cd_funcionario );

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT fk_sgv_chamado_prod FOREIGN KEY ( cd_produto )
        REFERENCES t_sgv_produto ( cd_produto );

ALTER TABLE t_sgv_pes_fisica
    ADD CONSTRAINT fk_sgv_pes_fisica_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES t_sgv_cliente ( cd_cliente );

ALTER TABLE t_sgv_pes_juridica
    ADD CONSTRAINT fk_sgv_pes_juridica_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES t_sgv_cliente ( cd_cliente );

ALTER TABLE t_sgv_produto
    ADD CONSTRAINT fk_sgv_prod_cateprod FOREIGN KEY ( cd_categoria_produto )
        REFERENCES t_sgv_categoria_produto ( cd_categoria_produto );

ALTER TABLE t_sgv_produto
    ADD CONSTRAINT fk_sgv_prod_forne FOREIGN KEY ( id_fornecedor )
        REFERENCES t_sgv_fornecedor ( id_fornecedor );

ALTER TABLE t_sgv_video_produto
    ADD CONSTRAINT fk_sgv_videoprod_classivideo FOREIGN KEY ( cd_classificacao_video )
        REFERENCES t_sgv_classificacao_video ( cd_classificacao_video );

ALTER TABLE t_sgv_video_produto
    ADD CONSTRAINT fk_sgv_videoprod_prod FOREIGN KEY ( cd_produto )
        REFERENCES t_sgv_produto ( cd_produto );

ALTER TABLE t_sgv_visualizacao_video
    ADD CONSTRAINT fk_sgv_visuvid_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES t_sgv_cliente ( cd_cliente );

ALTER TABLE t_sgv_visualizacao_video
    ADD CONSTRAINT fk_sgv_visuvid_videoprod FOREIGN KEY ( cd_produto,
                                                          cd_video_produto )
        REFERENCES t_sgv_video_produto ( cd_produto,
                                         cd_video_produto );
                                         
-- SEQUÊNCIAS

CREATE SEQUENCE Sequencia_codigo_produto
Start with 1
Increment by 1
minvalue 1
maxvalue 99999
nocache
nocycle;

CREATE SEQUENCE Sequencia_codigo_chamado
Start with 1
Increment by 1
minvalue 1
maxvalue 999999
nocache
nocycle;

CREATE SEQUENCE Sequencia_codigo_categoria_produto
Start with 1
Increment by 1
minvalue 1
maxvalue 999
nocache
nocycle;

-- COMANDO EXCLUIR SEQUÊNCIAS

DROP SEQUENCE Sequencia_codigo_produto;
DROP SEQUENCE Sequencia_codigo_chamado;
DROP SEQUENCE Sequencia_codigo_categoria_produto; 




--  ERROR: No Discriminator Column found in Arc Arc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc Arc_1 - constraint trigger for Arc cannot be generated



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             26
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
