---sipariþ oluþturma 3 adet tabloda deðiþim yapýyor


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
            PRINT 'Kullanýcý adresi bulunamadý.';
            ROLLBACK;
            RETURN;
        END

        INSERT INTO Siparis (KullaniciID, ToplamFiyat, TeslimatAdresi)
        VALUES (@KullaniciID, @ToplamFiyat, @TeslimatAdresi);

        COMMIT;
        PRINT 'Sipariþ oluþturuldu.';
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Sipariþ oluþturma sýrasýnda sorun oluþtu.';
    END CATCH
END;




----- Telimat durumu güncellendiðinde oluþabilecek bir hata için transaction.
CREATE PROCEDURE TeslimatDurumuGuncelleTransaction
    @TeslimatID INT,
    @TeslimatDurumu VARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM Teslimat WHERE TeslimatID = @TeslimatID)
    BEGIN
        PRINT 'Hata: TeslimatID mevcut deðil.';
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
    @TeslimatDurumu = 'Baþarýsýz';


