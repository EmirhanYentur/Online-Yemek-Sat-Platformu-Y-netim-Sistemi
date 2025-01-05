
---puanlama yapan procedure

CREATE PROCEDURE PuanlamaYap
    @KullaniciID INT,
    @RestoranID INT,
    @Puan INT,
    @Yorum TEXT
AS
BEGIN
    INSERT INTO Puanlama (KullaniciID, RestoranID, Puan, Yorum)
    VALUES (@KullaniciID, @RestoranID, @Puan, @Yorum)
END

--- �deme procedure
CREATE PROCEDURE OdemeYap
    @SiparisID INT,
    @OdemeTuru VARCHAR(50),
    @OdemeDurumu VARCHAR(50)
AS
BEGIN
    UPDATE Odeme
    SET OdemeTuru = @OdemeTuru, OdemeDurumu = @OdemeDurumu
    WHERE SiparisID = @SiparisID
END

---- restoran olu�turma procedure
CREATE PROCEDURE RestoranEkleme
    @RestoranAdi VARCHAR(100),
    @Adres TEXT,
    @Telefon VARCHAR(15),
    @MutfakTuru VARCHAR(50),
    @CalismaSaatleri VARCHAR(100)
AS
BEGIN
    INSERT INTO Restoran (RestoranAdi, Adres, Telefon, MutfakTuru, CalismaSaatleri)
    VALUES
    (@RestoranAdi, @Adres, @Telefon, @MutfakTuru, @CalismaSaatleri);
END;

--- Yemek Tablosuna Yeni Veri Ekleme
CREATE PROCEDURE YemekEkleme
    @YemekAdi VARCHAR(100),
    @Aciklama TEXT,
    @Fiyat DECIMAL(10, 2),
    @RestoranID INT
AS
BEGIN
    INSERT INTO Yemek (YemekAdi, Aciklama, Fiyat, RestoranID)
    VALUES
    (@YemekAdi, @Aciklama, @Fiyat, @RestoranID);
END;

--- kullan�c� tablosuna veri ekleyen procedure
CREATE PROCEDURE Kullan�c�Ekleme
    @Isim VARCHAR(100),
    @Eposta VARCHAR(100),
    @Telefon VARCHAR(15),
    @Sifre VARCHAR(100),
    @Adres TEXT
AS
BEGIN
    INSERT INTO Kullanici (Isim, Eposta, Telefon, Sifre, Adres)
    VALUES
    (@Isim, @Eposta, @Telefon, @Sifre, @Adres);
END;


----Sipari� listeleyen procedure

CREATE PROCEDURE KullaniciSiparisleriniListele
    @KullaniciID INT
AS
BEGIN

    SET NOCOUNT ON;

    SELECT 
        S.SiparisID,
        S.SiparisZamani,
        S.TeslimZamani,
        S.Durum,
        S.ToplamFiyat,
        S.TeslimatAdresi
    FROM 
        Siparis AS S
    WHERE 
        S.KullaniciID = @KullaniciID;

    IF @@ROWCOUNT = 0
    BEGIN
        PRINT 'Bu kullan�c�ya ait herhangi bir sipari� bulunamad�.';
    END
END;
