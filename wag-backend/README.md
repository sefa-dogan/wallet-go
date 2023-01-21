# WalletGo #

## Backend ##
database/src klasörüne gidin.

### WalletGo.Application ###
EntityServices klasörüne gidin. Burada ilgili tabloya ait app service'ler yer almaktadır. Bu service'lerin içinde oluşturulan her bir endpointe HTTP metodu ile istek gönderilerek veritabanında işlem yapılır.

### WalletGo.Application.Contracts ###
EntitiesDto klasörüne gidin.
Burada her bir entity' e ait DTO(data transfer object) ve interface bulunmaktadır.

### WalletGo.EntityFrameworkCore ###
EntityFrameworkCore klasörüne gidin.
WalletGoDbContext' in içinde her bir entitye karşılık gelen ve Fluent API ile yapılandırılmış tablolar bulunmaktadır.

Migrations klasörüne gidin.
Burada oluşturulan migration dosyası ve snapshot dosyası bulunmaktadır.

### WalletGo.Domain ###
Entities klasörüne gidin. Burada veritabanında oluşacak tabloların kolon isimleri yer almaktadır.




