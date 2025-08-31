Online Yemek Satış Platformu Yönetim Sistemi
Proje Amacı

Bu proje, online yemek sipariş platformu için bir veri tabanı tasarımı ve uygulama altyapısı sunar.
Amaç, kullanıcıların restoranlardan yemek siparişi verebilmesini, sipariş süreçlerinin ve ödeme işlemlerinin güvenli bir şekilde takip edilebilmesini sağlamaktır.

Sistem; kullanıcılar, restoranlar, yemekler, siparişler ve ödemeler gibi temel bileşenleri kapsar.

Varlıklar ve Nitelikleri
1. Kullanıcılar

Sisteme kayıtlı müşteri bilgilerini tutar.
Alanlar: KullanıcıID (PK), İsim, Eposta, Telefon, Şifre, Adres, SiparişAdet

2. Restoranlar

Platform üzerinde hizmet veren restoran bilgilerini tutar.
Alanlar: RestoranID (PK), RestoranAdi, Adres, Telefon, MutfakTuru, ÇalışmaSaatleri, Sahip

3. Kategoriler

Yemeklerin sınıflandırıldığı yapı.
Alanlar: KategoriID (PK), KategoriAdi

4. Yemekler

Restoranlara ait yemek bilgilerini tutar.
Alanlar: YemekID (PK), YemekAdi, Açıklama, Fiyat, RestoranID (FK)

5. Siparişler

Kullanıcıların verdikleri sipariş bilgilerini içerir.
Alanlar: SiparişID (PK), KullanıcıID (FK), SiparişZamanı, TeslimZamanı, Durum, ToplamFiyat, TeslimatAdresi

6. Sipariş Detayları

Her siparişte yer alan ürünlerin detaylarını içerir.
Alanlar: SiparişDetayID (PK), SiparişID (FK), YemekID (FK), YemekFiyatı, Miktar

7. Teslimatlar

Siparişlerin teslimat sürecini yönetir.
Alanlar: TeslimatID (PK), SiparişID (FK), TeslimatDurumu, KuryeAdi

8. Ödemeler

Siparişlere ait ödeme bilgilerini saklar.
Alanlar: ÖdemeID (PK), SiparişID (FK), ÖdemeTuru, ÖdemeBilgileri, ÖdemeDurumu, Tarih

9. Puanlamalar

Kullanıcıların restoranlara bıraktıkları yorum ve puanlar.
Alanlar: PuanlamaID (PK), KullanıcıID (FK), RestoranID (FK), Puan, Yorum, Tarih

10. Yemek_Kategori

Yemeklerin kategori bilgilerini tutar.
Alanlar: YemekID (FK, PK), KategoriID (FK, PK)

Kullanıcı Rolleri ve Yetkiler

Müşteri: Restoranlardan sipariş verebilir, sipariş geçmişini görüntüleyebilir, yorum ve puanlama yapabilir.

Restoran Yöneticisi: Menü yönetimi yapabilir (yemek ekleme, güncelleme, silme), gelen siparişleri takip edebilir.

Kurye: Teslimat durumlarını güncelleyebilir, kendisine atanan siparişleri görüntüleyebilir.

Sistem Yöneticisi: Tüm kullanıcıları, restoranları ve siparişleri yönetebilir, gerektiğinde siparişleri iptal veya düzenleme işlemleri yapabilir.
