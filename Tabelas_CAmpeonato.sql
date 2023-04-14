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
    Saldo_Gol int,
    Ponto int,
    Vitorias int,
    
    CONSTRAINT PK_Clube PRIMARY KEY (ID),
    CONSTRAINT UN_NOME_CLUBE UNIQUE (Nome_C)
)
GO

CREATE TABLE Jogo
(
    NumJogo int ,
    Time_Casa varchar(20) NOT NULL,
    Time_Visita varchar(20) NOT NULL,
    Dt_Jogo date,
    Gol_TC int,
    Gol_TV int,

    CONSTRAINT PK_JOGO PRIMARY KEY (NumJogo),
    CONSTRAINT FK_TIME_CASA_CLUBE FOREIGN KEY (Time_Casa) REFERENCES Clube (Nome_C),
    CONSTRAINT FK_TIME_VISITA_CLUBE FOREIGN KEY (Time_Visita) REFERENCES Clube (Nome_C)
)
GO

EXEC.CriarTime 1, 'A', '20150730'
EXEC.CriarTime 2, 'B', '20150730'
EXEC.CriarTime 3, 'C', '20150730'
EXEC.CriarTime 4, 'D', '20150730'
EXEC.CriarTime 5, 'E', '20150730'
EXEC.Marcar_Jogo 1, 'B', 'D', '1511'
EXEC.Marcar_Jogo 2, 'C', 'E','1504'
EXEC.Marcar_Jogo 3, 'A', 'D','1504'
EXEC.Marcar_Jogo 4, 'B', 'A','1504'
EXEC.Marcar_Jogo 5, 'E', 'C','1504'
EXEC.Marcar_Jogo 6, 'A', 'B','1504'

EXEC.Gols_Jogo 1, 2, 2
EXEC.Gols_Jogo 2, 4, 1
EXEC.Gols_Jogo 3, 5, 3
EXEC.Gols_Jogo 4, 3, 2
EXEC.Gols_Jogo 5, 1, 3
EXEC.Gols_Jogo 6, 7, 3


EXEC.Verificar_Campeao
EXEC.Top_Cinco
EXEC.MaiorGol
EXEC.MenorGol
EXEC.Max_Gol_Jogo
EXEC.Maior_Gols_Jogo 'A'
EXEC.Maior_Gols_Jogo 'B'
EXEC.Maior_Gols_Jogo 'C'
EXEC.Maior_Gols_Jogo 'D'
EXEC.Maior_Gols_Jogo 'E'