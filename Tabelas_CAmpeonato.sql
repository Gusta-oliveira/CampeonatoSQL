CREATE DATABASE Campeonato
GO

CREATE TABLE Clube
(
    ID int NOT NULL,
    Nome_C varchar(20) NOT NULL,
    Data_Criacao date NOT NULL,
    Apelido varchar(20),
    N_Jogos int,
    Gol_Pro int,
    Gol_Contra int,
    Ponto int,
    
    CONSTRAINT PK_Clube PRIMARY KEY (ID),
    CONSTRAINT UN_NOME_CLUBE UNIQUE (Nome_C)
)
GO

CREATE TABLE Jogo
(
    NumJogo int ,
    Time_Casa int NOT NULL,
    Time_Visita int NOT NULL,
    Dt_Jogo char(4),
    Gol_TC int,
    Gol_TV int,

    CONSTRAINT PK_JOGO PRIMARY KEY (NumJogo),
    CONSTRAINT FK_TIME_CASA_CLUBE FOREIGN KEY (Time_Casa) REFERENCES Clube (ID),
    CONSTRAINT FK_TIME_VISITA_CLUBE FOREIGN KEY (Time_Visita) REFERENCES Clube (ID)
)
GO


EXEC.CriarTime 4, 'ClubeH', '2020-07-17'
EXEC.Marcar_Jogo 3, 3, 4, '1511'
EXEC.Marcar_Jogo 4, 3, 2,'1504'
EXEC.Gols_Jogo 3, 2, 1


SELECT * From Jogo
SELECT * FROM CLUBE