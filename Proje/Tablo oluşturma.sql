CREATE TABLE Kullanici (
    KullaniciID INT PRIMARY KEY IDENTITY(1,1),
    Isim VARCHAR(100) NOT NULL,
    Eposta VARCHAR(100) UNIQUE NOT NULL,
    Telefon VARCHAR(15),
    Sifre VARCHAR(100) NOT NULL,
    Adres TEXT,
    SiparisAdet INT DEFAULT 0 NOT NULL
);

CREATE TABLE Restoran (
    RestoranID INT PRIMARY KEY IDENTITY(1,1),
    RestoranAdi VARCHAR(100) NOT NULL,
    Adres TEXT NOT NULL,
    Telefon VARCHAR(15),
    MutfakTuru VARCHAR(50),
    CalismaSaatleri VARCHAR(100)
);

CREATE TABLE Kategori (
    KategoriID INT PRIMARY KEY IDENTITY(1,1),
    KategoriAdi VARCHAR(50) NOT NULL
);

CREATE TABLE Yemek (
    YemekID INT PRIMARY KEY IDENTITY(1,1),
    YemekAdi VARCHAR(100) NOT NULL,
    Aciklama TEXT,
    Fiyat DECIMAL(10, 2) NOT NULL,
    RestoranID INT NOT NULL,
    FOREIGN KEY (RestoranID) REFERENCES Restoran(RestoranID)
);

CREATE TABLE Siparis (
    SiparisID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciID INT NOT NULL,
    SiparisZamani DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    TeslimZamani DATETIME,
    Durum VARCHAR(50) NOT NULL CHECK (Durum IN ('Hazýrlanýyor', 'Yolda', 'Teslim Edildi', 'Baþarýsýz')) DEFAULT 'Hazýrlanýyor',
    ToplamFiyat DECIMAL(10, 2) NOT NULL,
    TeslimatAdresi TEXT NOT NULL,
    FOREIGN KEY (KullaniciID) REFERENCES Kullanici(KullaniciID)
);

CREATE TABLE SiparisDetay (
    SiparisDetayID INT PRIMARY KEY IDENTITY(1,1),
    SiparisID INT NOT NULL,
    YemekID INT NOT NULL,
    YemekFiyati DECIMAL(10, 2) NOT NULL,
    Miktar INT NOT NULL,
    FOREIGN KEY (SiparisID) REFERENCES Siparis(SiparisID),
    FOREIGN KEY (YemekID) REFERENCES Yemek(YemekID)
);

CREATE TABLE Teslimat (
    TeslimatID INT PRIMARY KEY IDENTITY(1,1),
    SiparisID INT NOT NULL,
    TeslimatDurumu VARCHAR(50) NOT NULL CHECK (TeslimatDurumu IN ('Hazýrlanýyor', 'Yolda', 'Teslim Edildi', 'Baþarýsýz')) DEFAULT 'Hazýrlanýyor',
    KuryeAdi VARCHAR(100),
    FOREIGN KEY (SiparisID) REFERENCES Siparis(SiparisID)
);

CREATE TABLE Odeme (
    OdemeID INT PRIMARY KEY IDENTITY(1,1),
    SiparisID INT NOT NULL,
    OdemeTuru VARCHAR(50) NOT NULL CHECK (OdemeTuru IN ('Nakit', 'Kredi Kartý', 'Online')) DEFAULT 'Nakit',
    OdemeBilgileri TEXT,
    OdemeDurumu VARCHAR(50) NOT NULL CHECK (OdemeDurumu IN ('Bekliyor', 'Tamamlandý')) DEFAULT 'Bekliyor',
    Tarih DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SiparisID) REFERENCES Siparis(SiparisID)
);

CREATE TABLE Puanlama (
    PuanlamaID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciID INT NOT NULL,
    RestoranID INT NOT NULL,
    Puan INT CHECK (Puan BETWEEN 1 AND 5),
    Yorum TEXT,
    Tarih DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (KullaniciID) REFERENCES Kullanici(KullaniciID),
    FOREIGN KEY (RestoranID) REFERENCES Restoran(RestoranID)
);

CREATE TABLE Yemek_Kategori (
    YemekID INT NOT NULL,
    KategoriID INT NOT NULL,
    PRIMARY KEY (YemekID, KategoriID),
    FOREIGN KEY (YemekID) REFERENCES Yemek(YemekID),
    FOREIGN KEY (KategoriID) REFERENCES Kategori(KategoriID)
);


