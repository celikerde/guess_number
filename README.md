# guess_number

Bu uygulama bir sayı tahmin uygulamasıdır. Uygulama, 2 sayfadan oluşmaktadır.

1. Ana Sayfa/ Oyun Sayfası
2. Skor Sayfası

1. Ana Sayfa/ Oyun Sayfası
Uygulama açıldığında sizi ana sayfa karşılar. Sayfa açılır açılmaz 1-100 arası rastgele bir tam sayı üretilir.
Kullanıcıdan bu aralıkta bir tamsayıyı, tahmin olarak girmesi beklenir. Sayı bu aralıktaki bir tam sayı değilse "Tahmininiz 1 ile 100 arasında olmalıdır." mesajını gösteren bir pop-up mesajı kullanıcıya gösterilir.
Girilen sayının tam sayı olmadığı durumda ise "Lütfen tam sayı(1-100) giriniz!" mesajını gösteren bir pop-up mesajı kullanıcıya gösterilir.
Sayı tahmini 1-100 arası bir tam sayı ise bu sayı, üretilmiş olan sayıyla karşılaştırılır.
Tahmin, doğru sayıdan küçükse "Daha büyük bir sayı deneyin" mesajı ekranda gösterilir.
Tahmin, doğru sayıdan büyükse "Daha küçük bir sayı deneyin" mesajı ekranda gösterilir.
"Tahmin Et" butonunun altında ise girilen tahminlerin, üretilen sayıdan büyük mü küçük mü olduğu liste halinde gösterilir.
Doğru sayı tahmininde Tebrikler pop-up mesajı ile beraber 3 saniyelik bir konfeti animasyonu ekranda gösterilir.

2. Skor Sayfası
Bu sayfa kullanıcının skorlarının gösterildiği yerdir. Skorlar, doğru sayıya ulaşana kadar yapılmış tahmin sayısıdır.
Sayfa, yapılan tüm skorları küçükten büyüğe doğru sıralar. Yapılan her yeni skor, local db ile kullanıcı telefonuna kaydedilir.
Sağ köşedeki "Sil" butonu ile tüm skorlar silinir. Tüm skorların silinmesi durumunda ekranda "Herhangi bir skor yok." mesajı gösterilir.

Uygulama Visual Studio Code ile Android Virtual Device kullanılarak geliştirilmiştir. 
"Confetti ve Shared Preferences" paketleri uygulamaya eklenmiştir.
Confetti paketi doğru sayı tahmini esnasında gösterilen konfeti animasyonu içindir.
Shared Preferences ise kullanıcı skorlarını cihazın yerel veritabanında saklamak içindir.  




 
 
   
