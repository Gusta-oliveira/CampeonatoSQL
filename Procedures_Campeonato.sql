CREATE OR ALTER PROCEDURE CriarTime @id int, @Nome_C varchar(20), @Data_Criacao char(4)
AS
BEGIN
    INSERT INTO Clube (ID, Nome_C, Data_Criacao, N_Jogos, Gol_Pro, Gol_Contra, Ponto) values (@id, @Nome_C, @Data_Criacao, 0, 0, 0, 0)
END;
GO

CREATE OR ALTER PROCEDURE Marcar_Jogo @NumJogo int, @TC int, @TV int, @Data char(4)
AS
BEGIN
    IF(@TC = @TV)
        PRINT ('Times não podem jogar entre sí!') 
    ELSE
    INSERT INTO Jogo (NumJogo, Time_Casa, Time_Visita, Dt_Jogo, Gol_TC, Gol_TV) VALUES (@NumJogo, @TC, @TV, @Data, 0, 0)
END;
GO

CREATE OR ALTER PROCEDURE Gols_Jogo @NumJogo int, @Gol_TC int, @Gol_TV int
AS
BEGIN
    UPDATE Jogo SET Gol_TC = @Gol_TC, Gol_TV = @Gol_TV WHERE NumJogo = @NumJogo
END;
GO

CREATE OR ALTER PROCEDURE Vencedor
AS
BEGIN

END;