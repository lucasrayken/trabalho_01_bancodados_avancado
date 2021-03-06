CREATE TABLE CONTINENTE(
    COD_CONTINENTE INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY(COD_CONTINENTE),
    NOME_CONT VARCHAR(255) NOT NULL,
    NOME_ASSOC VARCHAR(255) NOT NULL
);
CREATE TABLE PAIS(
    COD_PAIS VARCHAR(2) NOT NULL,
    PRIMARY KEY (COD_PAIS),
    NOME_PAIS VARCHAR NOT NULL,
    COD_CONTINENTE INT,
    CONSTRAINT FK_COD_CONTINENTE FOREIGN KEY (COD_CONTINENTE)
    REFERENCES CONTINENTE(COD_CONTINENTE)
    );
CREATE TABLE LIGA(
    COD_LIGA INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (COD_LIGA),
    NOME_LIGA VARCHAR(255) NOT NULL,
    COD_PAIS VARCHAR(2),
    CONSTRAINT FK_COD_PAIS FOREIGN KEY (COD_PAIS)
    REFERENCES PAIS(COD_PAIS)
    );
CREATE TABLE TIME(
    COD_TIME VARCHAR(3) NOT NULL,
    PRIMARY KEY (COD_TIME),
    NOME_TIME VARCHAR NOT NULL,
    COD_LIGA INT,
    CONSTRAINT FK_COD_LIGA FOREIGN KEY (COD_LIGA)
    REFERENCES LIGA(COD_LIGA)
    );
CREATE TABLE TECNICO(
    COD_TECNICO INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (COD_TECNICO),
    NOME_TEC VARCHAR(255) NOT NULL,
    IDADE INT NOT NULL,
    NAC_TEC VARCHAR(255) NOT NULL,
    JOGOS_TEC INT NOT NULL,
    VIT_TEC INT NOT NULL,
    EMP_TEC INT NOT NULL,
    DER_TEC INT NOT NULL,
    APROVEITAMENTO INT NOT NULL,
    COD_TIME INT,
    CONSTRAINT FK_COD_TIME FOREIGN KEY (COD_TIME)
    REFERENCES TIME(COD_TIME),
    COD_LIGA INT,
    CONSTRAINT FK_COD_LIGA FOREIGN KEY (COD_LIGA)
    REFERENCES LIGA(COD_LIGA)
    );
CREATE TABLE JOGADOR(
    COD_JOGADOR INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY(COD_JOGADOR),
    NOME_JOG VARCHAR(255) NOT NULL,
    IDADE_JOG INT NOT NULL,
    NAC_JOG VARCHAR(255) NOT NULL,
    JOGOS_JOG INT NOT NULL,
    GOLS_JOG INT NOT NULL,
    ASSIST_JOG INT NOT NULL,
    PART_POR INT NOT NULL,
    PART_TOT INT NOT NULL,
    COD_TIME INT,
    CONSTRAINT FK_COD_TIME FOREIGN KEY (COD_TIME)
    REFERENCES TIME(COD_TIME),
    COD_LIGA INT,
	CONSTRAINT FK_COD_LIGA FOREIGN KEY (COD_LIGA)
    REFERENCES LIGA(COD_LIGA)
    );
CREATE TABLE TIPO (
    COD_TIPO INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (COD_TIPO),
    COD_JOG INT,
    CONSTRAINT FK_COD_JOG  FOREIGN KEY (COD_JOG)
    REFERENCES JOGADOR(COD_JOG),
    COD_TEC INT,
    CONSTRAINT FK_COD_TEC FOREIGN KEY (COD_TEC)
    REFERENCES TECNICO(COD_TEC)
    );