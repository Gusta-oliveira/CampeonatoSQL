CREATE OR ALTER PROCEDURE CriarTime @id int, @Nome_C varchar(20), @Data_Criacao char(4)
AS
BEGIN
    INSERT INTO Clube (ID, Nome_C, Data_Criacao, N_Jogos, Gol_Pro, Gol_Contra, Saldo_Gol , Ponto, Vitorias) values (@id, @Nome_C, @Data_Criacao, 0, 0, 0, 0, 0, 0)
END;
GO

CREATE OR ALTER PROCEDURE Marcar_Jogo @NumJogo int, @TC varchar(20), @TV varchar(20), @Data date
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

CREATE OR ALTER PROCEDURE Verificar_Campeao 
AS
BEGIN
    DECLARE @Pontuacao INT, @Vitorias INT, @Saldo_Gols INT

    SELECT @Pontuacao = MAX(Ponto) FROM Clube
    SELECT @Vitorias = MAX(Vitorias) FROM Clube WHERE Ponto = @Pontuacao
    SELECT @Saldo_Gols = MAX(Saldo_Gol) FROM Clube WHERE Vitorias = @Vitorias AND Ponto = @Pontuacao
    SELECT TOP 1 Nome_C, N_Jogos, Gol_Pro, Gol_Contra, Saldo_Gol, Ponto, Vitorias FROM Clube WHERE Ponto = @Pontuacao AND Vitorias = @Vitorias AND Saldo_Gol = @Saldo_Gols
END;
GO

CREATE OR ALTER PROCEDURE Top_Cinco
AS
BEGIN
    SELECT TOP 5 Nome_C, Ponto FROM Clube ORDER BY Ponto DESC
END;
GO

CREATE OR ALTER PROCEDURE MaiorGol
AS
BEGIN
    SELECT TOP 1 Nome_C, Gol_Pro FROM Clube ORDER BY Gol_Pro DESC
END;
GO 

CREATE OR ALTER PROCEDURE MenorGol
AS
BEGIN
    SELECT TOP 1 Nome_C, Gol_Contra FROM Clube ORDER BY Gol_Contra DESC
END;
GO

CREATE OR ALTER PROCEDURE Max_Gol_Jogo
AS
BEGIN
     SELECT TOP 1 Time_Casa, Time_Visita, Gol_TC + Gol_TV AS Goals FROM Jogo ORDER BY Goals DESC
END;
GO

CREATE OR ALTER PROCEDURE Maior_Gols_Jogo @Nome_C varchar(20)
AS
BEGIN
    SELECT Gol_TC FROM Jogo WHERE Time_Casa = @Nome_C UNION SELECT Gol_TV FROM Jogo WHERE Time_Visita = @Nome_C ORDER BY Gol_TC DESC
END;