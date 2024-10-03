# guess_number

Bu uygulama bir sayý tahmin uygulamasýdýr. Uygulama, 2 sayfadan oluþmaktadýr.

1. Ana Sayfa/ Oyun Sayfasý
2. Skor Sayfasý

1. Ana Sayfa/ Oyun Sayfasý

Uygulama açýldýðýnda sizi ana sayfa karþýlar. Sayfa açýlýr açýlmaz 1-100 arasý rastgele bir tam sayý üretilir.
Kullanýcýdan bu aralýkta bir tamsayýyý, tahmin olarak girmesi beklenir. Sayý bu aralýktaki bir tam sayý deðilse "Tahmininiz 1 ile 100 arasýnda olmalýdýr." mesajýný gösteren bir pop-up mesajý kullanýcýya gösterilir.
Girilen sayýnýn tam sayý olmadýðý durumda ise "Lütfen tam sayý(1-100) giriniz!" mesajýný gösteren bir pop-up mesajý kullanýcýya gösterilir.
Sayý tahmini 1-100 arasý bir tam sayý ise bu sayý, üretilmiþ olan sayýyla karþýlaþtýrýlýr.
Tahmin, doðru sayýdan küçükse "Daha büyük bir sayý deneyin" mesajý ekranda gösterilir.
Tahmin, doðru sayýdan büyükse "Daha küçük bir sayý deneyin" mesajý ekranda gösterilir.
"Tahmin Et" butonunun altýnda ise girilen tahminlerin, üretilen sayýdan büyük mü küçük mü olduðu liste halinde gösterilir.
Doðru sayý tahmininde Tebrikler pop-up mesajý ile beraber 3 saniyelik bir konfeti animasyonu ekranda gösterilir.

2. Skor Sayfasý

Bu sayfa kullanýcýnýn skorlarýnýn gösterildiði yerdir. Skorlar, doðru sayýya ulaþana kadar yapýlmýþ tahmin sayýsýdýr.
Sayfa, yapýlan tüm skorlarý küçükten büyüðe doðru sýralar. Yapýlan her yeni skor, local db ile kullanýcý telefonuna kaydedilir.
Sað köþedeki "Sil" butonu ile tüm skorlar silinir. Tüm skorlarýn silinmesi durumunda ekranda "Herhangi bir skor yok." mesajý gösterilir.

Uygulama Visual Studio Code ile Android Virtual Device kullanýlarak geliþtirilmiþtir. 
"Confetti ve Shared Preferences" paketleri uygulamaya eklenmiþtir.
Confetti paketi doðru sayý tahmini esnasýnda gösterilen konfeti animasyonu içindir.
Shared Preferences ise kullanýcý skorlarýný cihazýn yerel veritabanýnda saklamak içindir.  




 
 
   
