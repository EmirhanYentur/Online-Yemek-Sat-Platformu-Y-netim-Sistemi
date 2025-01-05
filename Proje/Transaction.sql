---sipari� olu�turma 3 adet tabloda de�i�im yap�yor


CREATE PROCEDURE SiparisOlustur
    @KullaniciID INT,           
    @ToplamFiyat DECIMAL(10, 2)
AS
BEGIN
    BEGIN TRANSACTION; 

    BEGIN TRY
        DECLARE @TeslimatAdresi VARCHAR(MAX);

        SELECT @TeslimatAdresi = Adres
        FROM Kullanici
        WHERE KullaniciID = @KullaniciID;

        IF @TeslimatAdresi IS NULL
        BEGIN
            PRINT 'Kullan�c� adresi bulunamad�.';
            ROLLBACK;
            RETURN;
        END

        INSERT INTO Siparis (KullaniciID, ToplamFiyat, TeslimatAdresi)
        VALUES (@KullaniciID, @ToplamFiyat, @TeslimatAdresi);

        COMMIT;
        PRINT 'Sipari� olu�turuldu.';
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Sipari� olu�turma s�ras�nda sorun olu�tu.';
    END CATCH
END;




----- Telimat durumu g�ncellendi�inde olu�abilecek bir hata i�in transaction.
CREATE PROCEDURE TeslimatDurumuGuncelleTransaction
    @TeslimatID INT,
    @TeslimatDurumu VARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM Teslimat WHERE TeslimatID = @TeslimatID)
    BEGIN
        PRINT 'Hata: TeslimatID mevcut de�il.';
        ROLLBACK TRANSACTION;
        RETURN;
    END

    BEGIN TRY
        UPDATE Teslimat
        SET TeslimatDurumu = @TeslimatDurumu
        WHERE TeslimatID = @TeslimatID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        PRINT 'Hata: ' + ERROR_MESSAGE();
        ROLLBACK TRANSACTION;
    END CATCH
END;



select * from Teslimat
select * from Kullanici
select * from Siparis


EXEC SiparisOlustur @KullaniciID = 3, @ToplamFiyat =140;


EXEC TeslimatDurumuGuncelleTransaction 
    @TeslimatID = 9999, 
    @TeslimatDurumu = 'Ba�ar�s�z';


