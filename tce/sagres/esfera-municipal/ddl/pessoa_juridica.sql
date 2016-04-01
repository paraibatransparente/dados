DROP TABLE IF EXISTS pessoa_juridica;
CREATE TABLE pessoa_juridica (
    id INTEGER AUTOINCREMENT PRIMARY KEY NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    razao_social VARCHAR(200) NOT NULL,
    nome_fantasia VARCHAR(200),
    cnae_principal TEXT,
    cnaes_secundario TEXT,
    natureza_juridica TEXT,
    logradouro TEXT,
    numero TEXT,
    complemento TEXT,
    cep TEXT,
    bairro TEXT,
    cidade TEXT,
    uf TEXT,
    situacao_cadastral TEXT,
    situacao_cadastral_data
    motivo_situacao_cadastral TEXT,
    situacao_especial TEXT,
    situacao_especial_data TEXT,
    telefone TEXT,
    telefone2 TEXT,
    email TEXT,
    ente_federativo_responsavel TEXT,
    data_abertura DATE,
    capital_socio TEXT
);

