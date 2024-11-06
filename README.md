# Online-Yemek-Satış-Platformu-Yönetim-Sistemi
### Proje Ekibi

- **Emirhan YENTUR** (225260062)
- **Eyüp GÖK** (215260042)
- **Emirhan GÜNEY** (225260008)
  
Fırat Üniversitesi BMU329 Veri Tabanı Sistemleri dersi 2. Öğretim Çift 15. Grup "Online Yemek Satış Platformu İçin Yönetim Sistemi" projesidir. Online Yemek Sipariş Sistemi Projesi
Online Yemek Sipariş Sistemi Projesi

###Proje Amacı
Bu projenin amacı, restoranların ve kullanıcıların bir araya gelerek yemek siparişlerinin kolayca verilmesini ve yönetilmesini sağlayan bir online yemek sipariş platformu oluşturmaktır. Sistem, kullanıcıların restoranlardan yemek siparişi vermesine, restoranların yemeklerini ve siparişlerini yönetmesine, kuryelerin teslimat sürecini takip etmesine, sistem yöneticisinin ise platformu genel olarak yönetmesine olanak tanır.

Varlıklar ve Nitelikleri
Projede yer alacak varlıklar ve nitelikleri şunlardır:

- Kullanıcılar: (KullanıcıID, İsim, E-posta, Adres, Telefon, Şifre) - Sistemdeki kullanıcıları temsil eder.
- Restoranlar: (RestoranID, RestoranAdı, Adres, Telefon, KategoriID) - Sipariş verilebilecek restoranları ifade eder.
- Yemekler: (YemekID, YemekAdı, Açıklama, Fiyat, RestoranID, KategoriID) - Restoranların sunduğu yemekleri içerir.
- Siparişler: (SiparişID, KullanıcıID, SiparişZamanı, ToplamFiyat, Durum) - Kullanıcıların verdiği siparişleri temsil eder.
- Sipariş Detayları: (SiparişDetayID, SiparişID, YemekID, Miktar, YemekFiyatı) - Siparişlerdeki yemek detaylarını gösterir.
- Ödeme Bilgileri: (ÖdemeID, SiparişID, ÖdemeTürü, ÖdemeDurumu, Tarih) - Sipariş ödemeleriyle ilgili bilgileri içerir.
- Yorumlar ve Puanlar: (YorumID, KullanıcıID, RestoranID, Puan, YorumMetni, Tarih) - Kullanıcıların restoranlara yaptığı yorumları ve puanlamaları içerir.
- Kategoriler: (KategoriID, KategoriAdı) - Restoran ve yemeklerin kategorilerini belirtir.
- Teslimat: (TeslimatID, SiparişID, KuryeAdı, TeslimatDurumu, TahminiSüre) - Sipariş teslimat süreçlerini içerir.

---
Varlıklar Arasındaki İlişkiler ve Sayısal Kısıtlamalar
Belirlenen varlıklar arasında ilişkiler ve sayısal kısıtlamalar:

- Kullanıcı - Sipariş: Bir kullanıcı birden fazla sipariş verebilir, ancak her sipariş yalnızca bir kullanıcıya aittir. (1:N)
- Sipariş - Sipariş Detayları: Bir sipariş birden fazla yemek içerebilir, her detay bir siparişe aittir. (1:N)
- Restoran - Yemek: Bir restoran birden fazla yemek sunabilir, her yemek yalnızca bir restorana aittir. (1:N)
- Kullanıcı - Yorum: Bir kullanıcı birden fazla yorum yapabilir, her yorum yalnızca bir kullanıcıya aittir. (1:N)
- Yemek - Kategori: Bir yemek bir kategoriye aittir, bir kategori birden fazla yemeği içerir. (N:1)
- Sipariş - Ödeme Bilgileri: Her sipariş bir ödeme bilgisiyle ilişkilidir. (1:1)
- Sipariş - Teslimat: Her sipariş bir teslimat kaydıyla ilişkilidir. (1:1)

---

Kullanıcı Rolleri ve Gereksinimler Projede kullanıcı rolleri ve gereksinimler:

-Müşteri: Restoranlardan yemek siparişi verebilir, sipariş geçmişini görüntüleyebilir, restoranlara yorum yapabilir.
- Restoran Yöneticisi: Yemek ekleyebilir, güncelleyebilir, siparişleri takip edebilir.
- Kurye: Teslimat durumlarını güncelleyebilir, atanan siparişleri görüntüleyebilir.
- Sistem Yöneticisi: Tüm restoranları, kullanıcıları ve siparişleri yönetebilir, gerektiğinde siparişleri iptal edebilir veya düzenleyebilir.
- Emirhan YENTUR-Eyüp GÖK-Emirhan GÜNEY
