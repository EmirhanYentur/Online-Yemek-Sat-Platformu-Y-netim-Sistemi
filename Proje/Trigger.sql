
----sipariþ oluþturulduðunda teslimat tablosunda otomatik olarak tablo oluþturulur

CREATE TRIGGER trg_InsertTeslimat
ON Siparis
AFTER INSERT
AS
BEGIN
    INSERT INTO Teslimat (SiparisID, TeslimatDurumu, KuryeAdi)
    SELECT i.SiparisID, 'Hazýrlanýyor', NULL
    FROM inserted i;
END;



INSERT INTO Siparis (KullaniciID, SiparisZamani, TeslimatAdresi, ToplamFiyat)
VALUES (1, GETDATE(), 'Test Adresi, Test Þehir', 100.50);


SELECT * FROM Siparis

SELECT * FROM Teslimat
---- teslimat tamamlandýðýnda sipariþ tablosundaki teslim tarihi düzenlenir
CREATE TRIGGER trg_TeslimatTamamlandi
ON Teslimat
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM inserted WHERE TeslimatDurumu = 'Teslim Edildi')
    BEGIN
        UPDATE Siparis
        SET 
            Durum = 'Teslim Edildi',
            TeslimZamani = GETDATE()
        FROM Siparis S
        INNER JOIN inserted I ON S.SiparisID = I.SiparisID
        WHERE I.TeslimatDurumu = 'Teslim Edildi';
    END
END;


UPDATE Teslimat
SET TeslimatDurumu = 'Teslim Edildi'
WHERE TeslimatID = 2;



---- spiariþ adet için trigger
CREATE TRIGGER SiparisAdetArttir
ON Siparis
AFTER INSERT
AS
BEGIN
    UPDATE Kullanici
    SET SiparisAdet = SiparisAdet + 1
    FROM Kullanici
    INNER JOIN Inserted i ON Kullanici.KullaniciID = i.KullaniciID;
END;

SELECT * FROM Kullanici

INSERT INTO Siparis (KullaniciID, SiparisZamani, TeslimatAdresi, ToplamFiyat)
VALUES (1, GETDATE(), 'Deneme Adresi', 200.00);

---- teslimat durumu deðiþtiðinde durumun deðiþmesi

CREATE TRIGGER Trigger_TeslimatDurumuDegistigindeSiparisDurumunuGuncelle
ON Teslimat
AFTER UPDATE
AS
BEGIN
    IF UPDATE(TeslimatDurumu)
    BEGIN
        DECLARE @SiparisID INT;
        DECLARE @YeniDurum VARCHAR(50);

        SELECT @SiparisID = SiparisID, @YeniDurum = TeslimatDurumu
        FROM inserted;

        UPDATE Siparis
        SET Durum = @YeniDurum
        WHERE SiparisID = @SiparisID;
    END
END;


---- teslimat baþarýsýz olduðunda spiariþ adet 1 düþer

CREATE TRIGGER trg_TeslimatDurumu
ON Teslimat
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE TeslimatDurumu = 'Teslim Edildi')
    BEGIN
        UPDATE Siparis
        SET Durum = 'Teslim Edildi'
        FROM Siparis s
        INNER JOIN inserted i ON s.SiparisID = i.SiparisID;
    END

    IF EXISTS (SELECT 1 FROM inserted WHERE TeslimatDurumu = 'Baþarýsýz')
    BEGIN
        UPDATE Siparis
        SET Durum = 'Baþarýsýz'
        FROM Siparis s
        INNER JOIN inserted i ON s.SiparisID = i.SiparisID;

        UPDATE Kullanici
        SET SiparisAdet = SiparisAdet - 1
        FROM Kullanici k
        INNER JOIN Siparis s ON s.KullaniciID = k.KullaniciID
        INNER JOIN inserted i ON s.SiparisID = i.SiparisID;
    END
END;

