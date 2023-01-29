# WalletGo #
Don't forget click "Get Packages" button at pubspec.yaml file, after you pulling the project your locale / Projeyi locale çektikten sonra pubspec.yaml dosyasında "Get Packages" butonuna basmayı unutmayınız.
 
## Uygulamanın Tanıtımı ##
WalletGo' da kullanıcılar hesaplarını oluşturduktan sonra, kart hesabına para yükleyebilir, başka kullanıcıya ister şablonları kullanarak ister kullanmadan para gönderebilir, tüm kart hesaplarına ait işlemleri tek bir ekranda listeleyebilir ve bu işleme tıklayarak ilgili işlem hakkında pdf dosyası oluşturup paylaşabilir.

## Frontend ##
https://www.figma.com/file/EkAfyrz5AGTJEBMkoQBxWs/Free-UI-Template---Communal-Payments-App-(Community)?node-id=903%3A7402 adresindeki tasarım yapılmıştır.
#### Components ###
lib/components klasörüne gidin.
##### Splash ####
Kullanıcıya 2 saniye boyunca Splash ekranı gösterilir ve bu süre sonunda OnBoarding ekranına yönlendirilir.

![image](https://user-images.githubusercontent.com/56110811/213872571-7f961e06-74e1-4898-9ee7-41cf076364fa.png)

##### OnBoarding ####
Kullanıcının uygyulama hakkında küçük bilgiler ile karşılandığı, 3 sayfadan oluşan ekrandır. Login ekranına ve register ekranına yönlendirir. 

![image](https://user-images.githubusercontent.com/56110811/213872595-080dcc90-e8dc-4871-a9ce-69f47f1ea87e.png)

##### Login ####
Kayıtlı kullanıcının hesabına giriş yapmasını sağlayan ekrandır.

![image](https://user-images.githubusercontent.com/56110811/213872602-3e1681be-e794-4d99-aa87-7b976443cfbe.png)

##### Forgot Password ####
Kullanıcının email adresini girip kendisine sıfırlama maili gönderebildiği ekrandır.

##### Register ####
Kullanıcının veritabanına kayıt işleminin gerçekleştirildiği ekrandır. Kullanıcının doldurması gereken alanların yer aldığı form kayma özelliğine sahiptir.

![image](https://user-images.githubusercontent.com/56110811/213872609-54576ee3-7422-405b-836a-81d732cdd0da.png)

##### Home ####
Hesabına giriş yapmış kullanıcının hesabı ile ilgili zöel bilgileri görüntüleyebildiği ekrandır.

##### Language ####
Kullanıcının uygulamayı kullanmak istediği dili seçebildiği ekrandır. Ancak henüz lokalizasyon işlemi yapılmamıştır bu yüzden şu an için işlevi yoktur.

![image](https://user-images.githubusercontent.com/56110811/213872681-ecec7886-4436-4c75-8ea2-5d4448f213e7.png)

##### Light ####
Kullanıcının para transferi yapabildiği ekrandır. Bu ekranda kullanıcı cüzdanını seçtikten sonra cüzdanına bağlı olan smart cardlardan bir tanesini seçerek işlemine devam edecektir. Göndermek isteidği tutarı girip son olarak göndermek istediği hesaba ait IBAN bilgisini ilgili alana girdikten sonra  “Pay” butonuna basarak transferini gerçekleştirecektir.

![image](https://user-images.githubusercontent.com/56110811/213872689-99ed6c32-97ea-4211-a476-2dd5bcc9dbf5.png)

##### Success Payment ####
Kullanıcının para transferi işlemi eğer başarılı olursa bu ekran kullanıcıya gösterilir. Kullanıcının harcama yaptığı kartı, kartın bağlı olduğu cüzdan ismi, harcama tutarı ve transfer zamanı listelenir.

![image](https://user-images.githubusercontent.com/56110811/213872698-4e71439f-513f-4e6d-95ef-aa58df1ae2d1.png)

##### Notifications ####
Kullanıcının bildirimlerini görebildiği ekrandır. Tasarım gereği yapılmıştır.

![image](https://user-images.githubusercontent.com/56110811/213872706-96ed9c46-ca73-4784-aa23-dedd5bf92951.png)

##### Payment Methods ####
Kullanıcının cüzdanını, cüzdanına bağlı olan kartlarını, kartına ait bilgileri listeleyebildiği ve kartına para yükleyebildiği ekrandır. 

![image](https://user-images.githubusercontent.com/56110811/213872722-b4f6498e-6ee4-446a-be40-134460514d60.png)
![image](https://user-images.githubusercontent.com/56110811/213872727-5c352151-bebf-4276-bdf9-53178147536c.png)
![image](https://user-images.githubusercontent.com/56110811/213872729-d1f5c721-61c2-4a25-9184-9d604114b66d.png)

##### Payments ####
Kullanıcının kartlarını görebildiği ve kartlara ait işlemleri listeleyebildiği ekrandır. İşleme basıldığı takdirde detayları ile birlikte pdf dosyası oluşmaktadır.

![image](https://user-images.githubusercontent.com/56110811/213872739-55fd06c9-5182-4d0a-b383-9bd1d4598351.png)
![image](https://user-images.githubusercontent.com/56110811/213872745-4edabb5d-32b6-4067-8554-4b5c8bcf6359.png)
![image](https://user-images.githubusercontent.com/56110811/215298791-32968bee-8f0c-469a-96a1-6eae11127ea7.png)

##### Personal Details ####
Kullanıcının kendi bilgilerini listeleyebildiği ekrandır. Sağ üstte bulunan edit butonuna bastıktan sonra bilgilerini güncelleyip “Apply” butonu ile veritabanına request gönderebilir.

![image](https://user-images.githubusercontent.com/56110811/213872754-6872365a-8775-45b0-b0ea-1efda0f99f4b.png)

##### Profile ####
Kullanıcının, uygulama hesabı ile ilgili bütün bilgilere erişebildği köprü görevi gören ekrandır.

![image](https://user-images.githubusercontent.com/56110811/213872764-cc266d4c-9b6b-408b-909d-e65c86409ac5.png)

##### Scan Card ####
Kullanıcı yeni kart eklemek istediğinde bu ekrana gider ve siyah kutu ile sınırlandırılan alanda kamera açılır. Kullanıcı kartını bu alana sığdırarak taratılmasını sağlar.

![image](https://user-images.githubusercontent.com/56110811/213872773-8b9b89df-bd98-465d-9045-a5db6e5f3d6a.png)

#### Core
lib/core klasörüne gidin.
##### Constants
Uygulamada kullanılan ve çalışma zamanında değişmeyecek olan değişkenler(string, color vb.) bu klasörde yer alır.

##### Exceptions
Uygulamada istenilen durum gerçekleştiğinde fırlatılacak olan hatalar bu klasörde yer alır.

##### Route
https://pub.dev/packages/get adresinde bulunan paket ile oluşturulmuş route' ların yer aldığı klasördür.

#### Store
Uygulama içinde birden fazla component tarafından ulaşılacak metodlara/değişkenlere bu klasörde erişilir.

##### BottomAppbar
Uygulamada, en altta bulunan barda şuanki ekrana karşılık gelen iconun renk değerini siyah yapmak için gereken index değerini tutar.

##### User
Kullanıcı uygulamaya giriş yaptığı zaman kullanıcının bilgilerini getiren metodlar ve bu bilgileri saklayan değişkenler burada bulunur. Gerektiği zaman başka componentlerden buraya erişilir ve bu bilgiler alınır veya güncellenir.

#### Camera 
Uygulamaya ileride eklenecek olan kart ile tarama özelliği için oluşturulan, kamera nesnesinin bulunduğu dosyadır.

#### Client
API işlemleri için oluşturulan istemci bulunur.

#### Locator
https://pub.dev/packages/get_it adresinde bulunan paketi kullanmak için oluşturulan GetIt nesnesi ve setup metodu bulunmaktadır.

#### Toast
Kullanıcıya ekranda toast mesaj göstermek için oluşturulan Ftoast örneği bulunmaktadır.
https://pub.dev/packages/fluttertoast adresinde bulunan paket kullanılmıştır.

### Assets
Uygulama içinde kullanılan görsellerin bulunduğu klasördür.
