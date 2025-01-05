# Online-Yemek-Satış-Platformu-Yönetim-Sistemi
### Proje Ekibi

- **Emirhan YENTUR** (225260062)
- **Eyüp GÖK** (215260042)
- **Emirhan GÜNEY** (225260008)
  
Fırat Üniversitesi BMU329 Veri Tabanı Sistemleri dersi 2. Öğretim Çift 15. Grup "Online Yemek Satış Platformu İçin Yönetim Sistemi" projesidir. Online Yemek Sipariş Sistemi Projesi
Online Yemek Sipariş Sistemi Projesi

### Proje Amacı
Bu projenin amacı, restoranların ve kullanıcıların bir araya gelerek yemek siparişlerinin kolayca verilmesini ve yönetilmesini sağlayan bir online yemek sipariş platformu oluşturmaktır. Sistem, kullanıcıların restoranlardan yemek siparişi vermesine, restoranların yemeklerini ve siparişlerini yönetmesine, kuryelerin teslimat sürecini takip etmesine, sistem yöneticisinin ise platformu genel olarak yönetmesine olanak tanır.

Varlıklar ve Nitelikleri
Projede yer alacak varlıklar ve nitelikleri şunlardır:

Kullanıcılar: Sisteme kayıtlı kullanıcı bilgileri.
Restoranlar: Hizmet sunan restoranlar.
Yemekler: Restoranlarda sunulan yemekler.
Kategoriler: Yemeklerin sınıflandırılması.
Siparişler: Kullanıcıların verdiği sipariş bilgileri.
Sipariş Detayları: Siparişlerde yer alan ürün bilgileri.
Teslimatlar: Sipariş teslimat bilgileri.
Ödemeler: Sipariş ödeme bilgileri.
Puanlamalar: Kullanıcıların yorum ve puan bilgileri.
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
