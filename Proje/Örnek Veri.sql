-- Kullan�c�lar
INSERT INTO Kullanici (Isim, Eposta, Telefon, Sifre, Adres)
VALUES 
('Ali Y�lmaz', 'ali@example.com', '5551234567', 'sifre123', '�stanbul, T�rkiye'),
('Ay�e Demir', 'ayse@example.com', '5559876543', 'sifre456', 'Ankara, T�rkiye'),
('Mehmet Aslan', 'mehmet@example.com', '5552345678', 'sifre789', '�zmir, T�rkiye'),
('Zeynep Kaya', 'zeynep@example.com', '5553456789', 'sifre321', 'Bursa, T�rkiye');

-- Restoranlar
INSERT INTO Restoran (RestoranAdi, Adres, Telefon, MutfakTuru, CalismaSaatleri)
VALUES 
('Ali''s Kebap', '�stanbul, Beyo�lu', '5550001111', 'Kebap', '09:00-22:00'),
('Ay�e''nin Sofras�', 'Ankara, �ankaya', '5552223333', 'Ev Yemekleri', '08:00-20:00'),
('Mehmet''in Mangal', '�zmir, Kar��yaka', '5553334444', 'Mangal', '10:00-23:00'),
('Zeynep''in Lezzetleri', 'Bursa, Osmangazi', '5554445555', 'T�rk Mutfa��', '07:00-21:00');

-- Kategoriler
INSERT INTO Kategori (KategoriAdi)
VALUES 
('Kebap'),
('Ev Yemekleri'),
('Mangal'),
('Tatl�'),
('Pasta');

-- Yemekler
INSERT INTO Yemek (YemekAdi, Aciklama, Fiyat, RestoranID)
VALUES 
('Adana Kebap', 'Lezzetli baharatlarla haz�rlanm�� kebap', 50.00, 1), 
('Lahmacun', 'Taze yap�lm�� ince lahmacun', 30.00, 1),
('K�s�r', 'Ev yap�m� k�s�r', 20.00, 2),
('Mant�', 'Ev usul� mant�', 35.00, 2),
('K�fte', 'Izgarada pi�mi� k�fte', 40.00, 3),
('Saray Kebab�', 'Pide ekme�i �zerinde kebap', 60.00, 3),
('Baklava', 'Taze baklava', 25.00, 4),
('F�r�n Tavuk', 'F�r�nlanm�� tavuk ve garnit�r', 45.00, 4);

-- Yemek_Kategori
INSERT INTO Yemek_Kategori (YemekID, KategoriID)
VALUES 
(1, 1),  -- Adana Kebap, Kebap
(2, 1),  -- Lahmacun, Kebap
(3, 2),  -- K�s�r, Ev Yemekleri
(4, 2),  -- Mant�, Ev Yemekleri
(5, 3),  -- K�fte, Mangal
(6, 3),  -- Saray Kebab�, Mangal
(7, 4),  -- Baklava, Tatl�
(8, 4);  -- F�r�n Tavuk, Tatl�

-- Sipari�ler
INSERT INTO Siparis (KullaniciID, Durum, ToplamFiyat, TeslimatAdresi)
VALUES 
(1, 'Haz�rlan�yor', 80.00, '�stanbul, Beyo�lu'),
(2, 'Haz�rlan�yor', 70.00, 'Ankara, �ankaya'),
(3, 'Haz�rlan�yor', 100.00, '�zmir, Kar��yaka'),
(4, 'Haz�rlan�yor', 80.00, 'Bursa, Osmangazi');


-- Sipari� Detaylar�
INSERT INTO SiparisDetay (SiparisID, YemekID, YemekFiyati, Miktar)
VALUES 
(1, 1, 50.00, 1),  -- Adana Kebap
(1, 2, 30.00, 1),  -- Lahmacun
(2, 3, 20.00, 2),  -- K�s�r
(2, 4, 35.00, 1),  -- Mant�
(3, 5, 40.00, 2),  -- K�fte
(3, 6, 60.00, 1),  -- Saray Kebab�
(4, 7, 25.00, 3),  -- Baklava
(4, 8, 45.00, 1);  -- F�r�n Tavuk


-- �demeler
INSERT INTO Odeme (SiparisID, OdemeTuru, OdemeDurumu)
VALUES 
(1, 'Kredi Kart�', 'Bekliyor'),
(2, 'Nakit', 'Bekliyor'),
(3, 'Online', 'Bekliyor'),
(4, 'Kredi Kart�', 'Bekliyor');

-- Puanlamalar
INSERT INTO Puanlama (KullaniciID, RestoranID, Puan, Yorum)
VALUES 
(1, 1, 5, 'Harika bir kebap deneyimi!'),
(2, 2, 4, 'Mant� �ok g�zeldi, fakat k�s�r biraz fazla baharatl�yd�.'),
(3, 3, 5, 'K�fte ve Saray Kebab� m�kemmeldi!'),
(4, 4, 4, 'Baklava �ok taze ve lezzetliydi, ancak f�r�n tavuk biraz kuru idi.');

select * from Kullanici