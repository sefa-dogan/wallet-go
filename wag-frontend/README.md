# WalletGo #

## Uygulamanın Tanıtımı ##
WalletGo' da kullanıcılar hesaplarını oluşturduktan sonra, kart hesabına para yükleyebilir, başka kullanıcıya ister şablonları kullanarak ister kullanmadan para gönderebilir, tüm kart hesaplarına ait işlemleri tek bir ekranda listeleyebilir ve bu işleme tıklayarak ilgili işlem hakkında pdf dosyası oluşturup paylaşabilir.

## Frontend ##
lib/components klasörüne gidin
### Components ###

#### Splash ####
Kullanıcıya 2 saniye boyunca Splash ekranı gösterilir ve bu süre sonunda OnBoarding ekranına yönlendirilir.

#### OnBoarding ####
Kullanıcının uygyulama hakkında küçük bilgiler ile karşılandığı, 3 sayfadan oluşan ekrandır. Login ekranına ve register ekranına yönlendirir. 

#### Login ####
Kayıtlı kullanıcının hesabına giriş yapmasını sağlayan ekrandır.

#### Forgot Password ####
Kullanıcının email adresini girip kendisine sıfırlama maili gönderebildiği ekrandır.

#### Register ####
Kullanıcının veritabanına kayıt işleminin gerçekleştirildiği ekrandır. Kullanıcının doldurması gereken alanların yer aldığı form kayma özelliğine sahiptir.

#### Home ####
Hesabına giriş yapmış kullanıcının hesabı ile ilgili zöel bilgileri görüntüleyebildiği ekrandır.

#### Language ####
Kullanıcının uygulamayı kullanmak istediği dili seçebildiği ekrandır. Ancak henüz lokalizasyon işlemi yapılmamıştır bu yüzden şu an için işlevi yoktur.

#### Light ####
Kullanıcının para transferi yapabildiği ekrandır. Bu ekranda kullanıcı cüzdanını seçtikten sonra cüzdanına bağlı olan smart cardlardan bir tanesini seçerek işlemine devam edecektir. Göndermek isteidği tutarı girip son olarak göndermek istediği hesaba ait IBAN bilgisini ilgili alana girdikten sonra  “Pay” butonuna basarak transferini gerçekleştirecektir.

#### Success Payment ####
Kullanıcının para transferi işlemi eğer başarılı olursa bu ekran kullanıcıya gösterilir. Kullanıcının harcama yaptığı kartı, kartın bağlı olduğu cüzdan ismi, harcama tutarı ve transfer zamanı listelenir.

#### Notifications ####
Kullanıcının bildirimlerini görebildiği ekrandır. Tasarım gereği yapılmıştır.

#### Payment Methods ####
Kullanıcının cüzdanını, cüzdanına bağlı olan kartlarını, kartına ait bilgileri listeleyebildiği ve kartına para yükleyebildiği ekrandır. 

#### Payments ####
Kullanıcının kartlarını görebildiği ve kartlara ait işlemleri listeleyebildiği ekrandır. İşleme basıldığı takdirde detayları ile birlikte pdf dosyası oluşmaktadır.

#### Personal Details ####
Kullanıcının kendi bilgilerini listeleyebildiği ekrandır. Sağ üstte bulunan edit butonuna bastıktan sonra bilgilerini güncelleyip “Apply” butonu ile veritabanına request gönderebilir.

#### Profile ####
Kullanıcının, uygulama hesabı ile ilgili bütün bilgilere erişebildği köprü görevi gören ekrandır.

#### Scan Card ####
Kullanıcı yeni kart eklemek istediğinde bu ekrana gider ve siyah kutu ile sınırlandırılan alanda kamera açılır. Kullanıcı kartını bu alana sığdırarak taratılmasını sağlar.


