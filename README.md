# Online-Yemek-Satış-Platformu-Yönetim-Sistemi
### Proje Ekibi

- **Emirhan YENTUR** 
- **Eyüp GÖK** 
- **Emirhan GÜNEY** 
  
### Proje Amacı
Bu proje, yemek sipariş sistemi için veri tabanı tasarımını ve uygulamasını ele almaktadır.
Sistemin temel gayesi, kullanıcıların restoranlardan yemek siparişi vermelerini ve bu
siparişlerin takibini güvenli bir şekilde kolaylaştırmaktır. Proje, kullanıcılar, restoranlar,
yemekler, siparişler ve ödeme işlemleri gibi ana bileşenler içermektedir.


Varlıklar ve Nitelikleri
Projede yer alacak varlıklar ve nitelikleri şunlardır:

1. Kullanıcılar: Sisteme kayıt olan kullanıcı bilgilerini tutar.
2. Restoranlar: Sistem üzerinde hizmet veren restoranların bilgilerini muhafaza eder.
3. Yemekler: Restoranlar tarafından sunulan yemeklerin adı.
4. Kategoriler: Yemeklerin kategorilere göre sınıflandırıldığı yapı.
5. Siparişler: Kullanıcıların verdiği sipariş bilgilerini tutar.
6. Sipariş Detayları: Siparişlerde yer alan her bir ürünün detay bilgileri.
7. Teslimatlar: Sipariş teslimat bilgilerini kayıt altına alır.
8. Ödemeler: Siparişlerin ödeme bilgilerini saklar.
9. Puanlamalar: Kullanıcıların restoranlara yaptıkları puanlama ve yorumlar.  
10.Yemek Kategori: Restoranlar tarafından sunulan yemeklerin sınıflandırılması
   
Belirlenen varlıklar arasındaki ilişkiler:

1. Kullanıcılar:
• Alanlar: (KullanıcıID(PK) , isim, Eposta, Telefon, Şifre, Adres, SiparişAdet)
2. Restoranlar:
• Alanlar:( RestoranID(PK) , RestoranAdi, Adres, Telefon, MutfakTuru, ÇalışmaSaatleri,
Sahip)
3. Kategoriler:
• Alanlar:( KategoriID(PK) , KategoriAdi)
4. Yemekler:
• Alanlar: (YemekID(PK) , YemekAdi, Açıklama, Fiyat, RestoranID )
5. Siparişler:
• Alanlar:( SiparişID(PK) , KullanıcıID , SiparişZamanı, TeslimZamanı, Durum,
ToplamFiyat, TeslimatAdresi)
6. Sipariş Detayları:
• Alanlar: (SiparişDetayID(PK) , SiparişID , YemekID , YemekFiyatı, Miktar)
7. Teslimatlar:
• Alanlar: (TeslimatID(PK) , SiparişID , TeslimatDurumu, KuryeAdi)
8. Ödemeler:
• Alanlar:( ÖdemeID(PK) , SiparişID , ÖdemeTuru, ÖdemeBilgileri, ÖdemeDurumu,
Tarih)
9. Puanlamalar:
• Alanlar: (PuanlamaID(PK) , KullanıcıID , RestoranID , Puan, Yorum, Tarih)
10. Yemek_Kategori:
• Alanlar: (YemekID(PK) , KategoriID(PK) )
---

Kullanıcı Rolleri ve Gereksinimler Projede kullanıcı rolleri ve gereksinimler:

- Müşteri: Restoranlardan yemek siparişi verebilir, sipariş geçmişini görüntüleyebilir, restoranlara yorum yapabilir.
- Restoran Yöneticisi: Yemek ekleyebilir, güncelleyebilir, siparişleri takip edebilir.
- Kurye: Teslimat durumlarını güncelleyebilir, atanan siparişleri görüntüleyebilir.
- Sistem Yöneticisi: Tüm restoranları, kullanıcıları ve siparişleri yönetebilir, gerektiğinde siparişleri iptal edebilir veya düzenleyebilir.
- Emirhan YENTUR-Eyüp GÖK-Emirhan GÜNEY
