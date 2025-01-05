
----sipari� olu�turuldu�unda teslimat tablosunda otomatik olarak tablo olu�turulur

CREATE TRIGGER trg_InsertTeslimat
ON Siparis
AFTER INSERT
AS
BEGIN
    INSERT INTO Teslimat (SiparisID, TeslimatDurumu, KuryeAdi)
    SELECT i.SiparisID, 'Haz�rlan�yor', NULL
    FROM inserted i;
END;



INSERT INTO Siparis (KullaniciID, SiparisZamani, TeslimatAdresi, ToplamFiyat)
VALUES (1, GETDATE(), 'Test Adresi, Test �ehir', 100.50);


SELECT * FROM Siparis

SELECT * FROM Teslimat
---- teslimat tamamland���nda sipari� tablosundaki teslim tarihi d�zenlenir
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



---- spiari� adet i�in trigger
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

---- teslimat durumu de�i�ti�inde durumun de�i�mesi

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


---- teslimat ba�ar�s�z oldu�unda spiari� adet 1 d��er

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

    IF EXISTS (SELECT 1 FROM inserted WHERE TeslimatDurumu = 'Ba�ar�s�z')
    BEGIN
        UPDATE Siparis
        SET Durum = 'Ba�ar�s�z'
        FROM Siparis s
        INNER JOIN inserted i ON s.SiparisID = i.SiparisID;

        UPDATE Kullanici
        SET SiparisAdet = SiparisAdet - 1
        FROM Kullanici k
        INNER JOIN Siparis s ON s.KullaniciID = k.KullaniciID
        INNER JOIN inserted i ON s.SiparisID = i.SiparisID;
    END
END;

