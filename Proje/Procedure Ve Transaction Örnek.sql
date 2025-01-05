----örnek rollback ve commit


EXEC SiparisOlustur @KullaniciID =5, @ToplamFiyat=170;
---adresi olmayan bir kullanýcý olduðu için rollback yapacak


EXEC SiparisOlustur @KullaniciID =3, @ToplamFiyat=170;
--- bilgiler eksiksiz olduðu için commit edilecek



EXEC TeslimatDurumuGuncelleTransaction 
    @TeslimatID = 9999, 
    @TeslimatDurumu = 'Baþarýsýz';
----  tabloda olmayan bir ID girildiðinde rollback edilecek




---- örnek procedure komutlarý

EXEC PuanlamaYap @KullaniciID = 5,@RestoranID = 2, @Puan = 3, @Yorum = 'Lezzetli';

-- Kullanýcý eklemek için prosedürün çalýþtýrýlmasý
EXEC KullanýcýEkleme 
    @Isim = 'selin', 
    @Eposta = 'selin@example.com', 
    @Telefon = '1234567890', 
    @Sifre = 'sifre123', 
    @Adres = 'Ýstanbul, Türkiye';


-- Yemek eklemek için prosedürün çalýþtýrýlmasý
EXEC YemekEkleme 
    @YemekAdi = 'Dolma', 
    @Aciklama = 'Limonlu ve zeytinyaðlý meze', 
    @Fiyat = 15.50, 
    @RestoranID = 1;


-- Restoran eklemek için prosedürün çalýþtýrýlmasý
EXEC RestoranEkleme 
    @RestoranAdi = 'Meze Evi', 
    @Adres = 'Fatih, Ýstanbul', 
    @Telefon = '0212-1234567', 
    @MutfakTuru = 'Türk', 
    @CalismaSaatleri = '09:00-21:00';



---Sipariþ listelemek için procedürün çalýþtýrýlmasý
EXEC KullaniciSiparisleriniListele @KullaniciID =2
