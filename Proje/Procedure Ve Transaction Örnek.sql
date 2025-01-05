----�rnek rollback ve commit


EXEC SiparisOlustur @KullaniciID =5, @ToplamFiyat=170;
---adresi olmayan bir kullan�c� oldu�u i�in rollback yapacak


EXEC SiparisOlustur @KullaniciID =3, @ToplamFiyat=170;
--- bilgiler eksiksiz oldu�u i�in commit edilecek



EXEC TeslimatDurumuGuncelleTransaction 
    @TeslimatID = 9999, 
    @TeslimatDurumu = 'Ba�ar�s�z';
----  tabloda olmayan bir ID girildi�inde rollback edilecek




---- �rnek procedure komutlar�

EXEC PuanlamaYap @KullaniciID = 5,@RestoranID = 2, @Puan = 3, @Yorum = 'Lezzetli';

-- Kullan�c� eklemek i�in prosed�r�n �al��t�r�lmas�
EXEC Kullan�c�Ekleme 
    @Isim = 'selin', 
    @Eposta = 'selin@example.com', 
    @Telefon = '1234567890', 
    @Sifre = 'sifre123', 
    @Adres = '�stanbul, T�rkiye';


-- Yemek eklemek i�in prosed�r�n �al��t�r�lmas�
EXEC YemekEkleme 
    @YemekAdi = 'Dolma', 
    @Aciklama = 'Limonlu ve zeytinya�l� meze', 
    @Fiyat = 15.50, 
    @RestoranID = 1;


-- Restoran eklemek i�in prosed�r�n �al��t�r�lmas�
EXEC RestoranEkleme 
    @RestoranAdi = 'Meze Evi', 
    @Adres = 'Fatih, �stanbul', 
    @Telefon = '0212-1234567', 
    @MutfakTuru = 'T�rk', 
    @CalismaSaatleri = '09:00-21:00';



---Sipari� listelemek i�in proced�r�n �al��t�r�lmas�
EXEC KullaniciSiparisleriniListele @KullaniciID =2
