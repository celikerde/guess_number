# guess_number

Bu uygulama bir say� tahmin uygulamas�d�r. Uygulama, 2 sayfadan olu�maktad�r.

1. Ana Sayfa/ Oyun Sayfas�
2. Skor Sayfas�

1. Ana Sayfa/ Oyun Sayfas�

Uygulama a��ld���nda sizi ana sayfa kar��lar. Sayfa a��l�r a��lmaz 1-100 aras� rastgele bir tam say� �retilir.
Kullan�c�dan bu aral�kta bir tamsay�y�, tahmin olarak girmesi beklenir. Say� bu aral�ktaki bir tam say� de�ilse "Tahmininiz 1 ile 100 aras�nda olmal�d�r." mesaj�n� g�steren bir pop-up mesaj� kullan�c�ya g�sterilir.
Girilen say�n�n tam say� olmad��� durumda ise "L�tfen tam say�(1-100) giriniz!" mesaj�n� g�steren bir pop-up mesaj� kullan�c�ya g�sterilir.
Say� tahmini 1-100 aras� bir tam say� ise bu say�, �retilmi� olan say�yla kar��la�t�r�l�r.
Tahmin, do�ru say�dan k���kse "Daha b�y�k bir say� deneyin" mesaj� ekranda g�sterilir.
Tahmin, do�ru say�dan b�y�kse "Daha k���k bir say� deneyin" mesaj� ekranda g�sterilir.
"Tahmin Et" butonunun alt�nda ise girilen tahminlerin, �retilen say�dan b�y�k m� k���k m� oldu�u liste halinde g�sterilir.
Do�ru say� tahmininde Tebrikler pop-up mesaj� ile beraber 3 saniyelik bir konfeti animasyonu ekranda g�sterilir.

2. Skor Sayfas�

Bu sayfa kullan�c�n�n skorlar�n�n g�sterildi�i yerdir. Skorlar, do�ru say�ya ula�ana kadar yap�lm�� tahmin say�s�d�r.
Sayfa, yap�lan t�m skorlar� k���kten b�y��e do�ru s�ralar. Yap�lan her yeni skor, local db ile kullan�c� telefonuna kaydedilir.
Sa� k��edeki "Sil" butonu ile t�m skorlar silinir. T�m skorlar�n silinmesi durumunda ekranda "Herhangi bir skor yok." mesaj� g�sterilir.

Uygulama Visual Studio Code ile Android Virtual Device kullan�larak geli�tirilmi�tir. 
"Confetti ve Shared Preferences" paketleri uygulamaya eklenmi�tir.
Confetti paketi do�ru say� tahmini esnas�nda g�sterilen konfeti animasyonu i�indir.
Shared Preferences ise kullan�c� skorlar�n� cihaz�n yerel veritaban�nda saklamak i�indir.  




 
 
   
