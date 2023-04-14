CREATE OR ALTER TRIGGER TRG_Pontos ON Jogo AFTER UPDATE
AS
BEGIN
    DECLARE @Gol_Casa int, @Gol_Visita int, @Time_Casa varchar(20), @Time_Visita varchar(20), @Vitorias int
    SELECT @Gol_Casa = Gol_TC, @Gol_Visita = Gol_TV, @Time_Casa = Time_Casa, @Time_Visita = Time_Visita FROM inserted
    SELECT @Vitorias = Vitorias FROM Clube
    IF(@Gol_Casa > @Gol_Visita)
        UPDATE Clube SET Ponto = Ponto + 3, Vitorias = Vitorias + 1 WHERE Nome_C = @Time_Casa
    ELSE IF (@Gol_Casa = @Gol_Visita)
            UPDATE Clube SET Ponto = Ponto + 1 WHERE Nome_C = @Time_Casa and Nome_C = @Time_Visita
    Else
        UPDATE Clube SET Ponto = Ponto + 5,  Vitorias = Vitorias + 1 WHERE Nome_C = @Time_Visita
END;
GO

CREATE OR ALTER TRIGGER TRG_Gol_Feito_Tomado ON Jogo AFTER UPDATE
AS
BEGIN
    DECLARE @Gol_Casa int, @Gol_Visita int, @Time_Casa varchar(20), @Time_Visita varchar(20), @id int, @NumJogo int, @Saldo int
    SELECT @Gol_Casa = Gol_TC, @Gol_Visita = Gol_TV, @Time_Casa = Time_Casa, @Time_Visita = Time_Visita FROM inserted
    SELECT @id = ID, @NumJogo = N_Jogos FROM Clube
    IF(@NumJogo < 4)
    BEGIN
        UPDATE Clube SET Gol_Pro = Gol_Pro + @Gol_Casa, Gol_Contra = Gol_Contra + @Gol_Visita, N_Jogos = N_Jogos + 1 WHERE Nome_c = @Time_Casa
        UPDATE Clube SET Gol_Pro = Gol_Pro + @Gol_Visita, Gol_Contra = Gol_Contra + @Gol_Casa, Saldo_Gol = Gol_pro - Gol_Contra, N_Jogos = N_jogos + 1 WHERE Nome_C = @Time_Visita
        UPDATE Clube SET Saldo_Gol = Gol_pro - Gol_Contra WHERE Nome_C = @Time_Casa
        UPDATE Clube SET Saldo_Gol = Gol_pro - Gol_Contra WHERE Nome_C = @Time_Visita
    END
    ELSE
        PRINT('Quantidade de 4 PARTIDAS atingida!')    
END;
GO
