-- Kullanýcýlar
INSERT INTO Kullanici (Isim, Eposta, Telefon, Sifre, Adres)
VALUES 
('Ali Yýlmaz', 'ali@example.com', '5551234567', 'sifre123', 'Ýstanbul, Türkiye'),
('Ayþe Demir', 'ayse@example.com', '5559876543', 'sifre456', 'Ankara, Türkiye'),
('Mehmet Aslan', 'mehmet@example.com', '5552345678', 'sifre789', 'Ýzmir, Türkiye'),
('Zeynep Kaya', 'zeynep@example.com', '5553456789', 'sifre321', 'Bursa, Türkiye');

-- Restoranlar
INSERT INTO Restoran (RestoranAdi, Adres, Telefon, MutfakTuru, CalismaSaatleri)
VALUES 
('Ali''s Kebap', 'Ýstanbul, Beyoðlu', '5550001111', 'Kebap', '09:00-22:00'),
('Ayþe''nin Sofrasý', 'Ankara, Çankaya', '5552223333', 'Ev Yemekleri', '08:00-20:00'),
('Mehmet''in Mangal', 'Ýzmir, Karþýyaka', '5553334444', 'Mangal', '10:00-23:00'),
('Zeynep''in Lezzetleri', 'Bursa, Osmangazi', '5554445555', 'Türk Mutfaðý', '07:00-21:00');

-- Kategoriler
INSERT INTO Kategori (KategoriAdi)
VALUES 
('Kebap'),
('Ev Yemekleri'),
('Mangal'),
('Tatlý'),
('Pasta');

-- Yemekler
INSERT INTO Yemek (YemekAdi, Aciklama, Fiyat, RestoranID)
VALUES 
('Adana Kebap', 'Lezzetli baharatlarla hazýrlanmýþ kebap', 50.00, 1), 
('Lahmacun', 'Taze yapýlmýþ ince lahmacun', 30.00, 1),
('Kýsýr', 'Ev yapýmý kýsýr', 20.00, 2),
('Mantý', 'Ev usulü mantý', 35.00, 2),
('Köfte', 'Izgarada piþmiþ köfte', 40.00, 3),
('Saray Kebabý', 'Pide ekmeði üzerinde kebap', 60.00, 3),
('Baklava', 'Taze baklava', 25.00, 4),
('Fýrýn Tavuk', 'Fýrýnlanmýþ tavuk ve garnitür', 45.00, 4);

-- Yemek_Kategori
INSERT INTO Yemek_Kategori (YemekID, KategoriID)
VALUES 
(1, 1),  -- Adana Kebap, Kebap
(2, 1),  -- Lahmacun, Kebap
(3, 2),  -- Kýsýr, Ev Yemekleri
(4, 2),  -- Mantý, Ev Yemekleri
(5, 3),  -- Köfte, Mangal
(6, 3),  -- Saray Kebabý, Mangal
(7, 4),  -- Baklava, Tatlý
(8, 4);  -- Fýrýn Tavuk, Tatlý

-- Sipariþler
INSERT INTO Siparis (KullaniciID, Durum, ToplamFiyat, TeslimatAdresi)
VALUES 
(1, 'Hazýrlanýyor', 80.00, 'Ýstanbul, Beyoðlu'),
(2, 'Hazýrlanýyor', 70.00, 'Ankara, Çankaya'),
(3, 'Hazýrlanýyor', 100.00, 'Ýzmir, Karþýyaka'),
(4, 'Hazýrlanýyor', 80.00, 'Bursa, Osmangazi');


-- Sipariþ Detaylarý
INSERT INTO SiparisDetay (SiparisID, YemekID, YemekFiyati, Miktar)
VALUES 
(1, 1, 50.00, 1),  -- Adana Kebap
(1, 2, 30.00, 1),  -- Lahmacun
(2, 3, 20.00, 2),  -- Kýsýr
(2, 4, 35.00, 1),  -- Mantý
(3, 5, 40.00, 2),  -- Köfte
(3, 6, 60.00, 1),  -- Saray Kebabý
(4, 7, 25.00, 3),  -- Baklava
(4, 8, 45.00, 1);  -- Fýrýn Tavuk


-- Ödemeler
INSERT INTO Odeme (SiparisID, OdemeTuru, OdemeDurumu)
VALUES 
(1, 'Kredi Kartý', 'Bekliyor'),
(2, 'Nakit', 'Bekliyor'),
(3, 'Online', 'Bekliyor'),
(4, 'Kredi Kartý', 'Bekliyor');

-- Puanlamalar
INSERT INTO Puanlama (KullaniciID, RestoranID, Puan, Yorum)
VALUES 
(1, 1, 5, 'Harika bir kebap deneyimi!'),
(2, 2, 4, 'Mantý çok güzeldi, fakat kýsýr biraz fazla baharatlýydý.'),
(3, 3, 5, 'Köfte ve Saray Kebabý mükemmeldi!'),
(4, 4, 4, 'Baklava çok taze ve lezzetliydi, ancak fýrýn tavuk biraz kuru idi.');

select * from Kullanici