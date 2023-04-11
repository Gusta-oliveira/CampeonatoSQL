CREATE OR ALTER TRIGGER TRG_Pontos ON Jogo AFTER UPDATE
AS
BEGIN
    DECLARE @Gol_Casa int, @Gol_Visita int, @Time_Casa int, @Time_Visita int
    SELECT @Gol_Casa = Gol_TC, @Gol_Visita = Gol_TV, @Time_Casa = Time_Casa, @Time_Visita = Time_Visita FROM inserted
    IF(@Gol_Casa > @Gol_Visita)
        UPDATE Clube SET Ponto = 3 WHERE ID = @Time_Casa
    ELSE IF (@Gol_Casa = @Gol_Visita)
            UPDATE Clube SET Ponto = 1 WHERE ID = @Time_Casa and ID = @Time_Visita
    Else
        UPDATE Clube SET Ponto = 5 WHERE ID = @Time_Visita
END;
GO

CREATE OR ALTER TRIGGER TGR_Gol_Feito_Tomado ON Jogo AFTER UPDATE
AS
BEGIN
    DECLARE @Gol_Casa int, @Gol_Visita int, @Time_Casa int, @Time_Visita int, @id int, @NumJogo int
    SELECT @Gol_Casa = Gol_TC, @Gol_Visita = Gol_TV, @Time_Casa = Time_Casa, @Time_Visita = Time_Visita FROM inserted
    SELECT @id = ID, @NumJogo = N_Jogos FROM Clube
    IF(@NumJogo < 4)
    BEGIN
        UPDATE Clube SET Gol_Pro = Gol_Pro + @Gol_Casa, Gol_Contra = Gol_Contra + @Gol_Visita, N_Jogos = N_Jogos + 1 WHERE ID = @Time_Casa
        UPDATE Clube SET Gol_Pro = Gol_Pro + @Gol_Visita, Gol_Contra = Gol_Contra + @Gol_Casa,  N_Jogos = N_jogos + 1 WHERE ID = @Time_Visita
    END
    ELSE
        PRINT('Quantidade de 4 PARTIDAS atingida!')
            
END;
DROP TRIGGER TGR_Gol_Feito_Tomado