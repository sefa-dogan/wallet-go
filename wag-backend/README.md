# README #

##Create the Book Entity##
Domain layer in the startup template is separated into two projects:

	Acme.BookStore.Domain contains your entities, domain services and other core domain objects.
	Acme.BookStore.Domain.Shared contains constants, enums or other domain related objects that can be shared with clients.
	
Define your entities in the domain layer (Acme.BookStore.Domain project) of the solution.

The main entity of the application is the Book("YOUR ENTİTY"). Create a Books("YOUR ENTİTY"s) folder (namespace) in the Acme.BookStore.Domain project and add a Book("YOUR ENTİTY") class that contain its properties(table's column)

Guid is the primary key type of the Book entity.

Example:

namespace Acme.BookStore.Books
{
    public class Book : AuditedAggregateRoot<Guid>
    {
        public string Name { get; set; }

        public BookType Type { get; set; }

        public DateTime PublishDate { get; set; }

        public float Price { get; set; }
    }
}

###BookType Enum###
The Book("YOUR ENTİTY") entity uses the BookType("YOUR ENTİTY"Type) enum. Create a ("YOUR ENTİTY"s) folder (namespace) in the Acme.BookStore.Domain.Shared project and add a ("YOUR ENTİTY"Type) inside it:

Example:

namespace Acme.BookStore.Books
{
    public enum BookType
    {
        Undefined,
        Adventure,
        Biography,
        Dystopia,
        Fantastic,
        Horror,
        Science,
        ScienceFiction,
        Poetry
    }
}

###Add the Book Entity to the DbContext###
EF Core requires that you relate the entities with your DbContext. The easiest way to do so is adding a DbSet property to the BookStoreDbContext class in the Acme.BookStore.EntityFrameworkCore project, as shown below:

public class BookStoreDbContext : AbpDbContext<BookStoreDbContext>
{
    public DbSet<Book> Books { get; set; }
    //...
}

###Map the Book Entity to a Database Table###
Navigate to the OnModelCreating method in the BookStoreDbContext class and add the mapping code for the Book entity:

Example:

namespace Acme.BookStore.EntityFrameworkCore
{
    public class BookStoreDbContext : 
        AbpDbContext<BookStoreDbContext>,
        IIdentityDbContext,
        ITenantManagementDbContext
    {
        ...

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            /* Include modules to your migration db context */

            builder.ConfigurePermissionManagement();
            ...

            /* Configure your own tables/entities inside here */

            builder.Entity<Book>(b =>
            {
                b.ToTable(BookStoreConsts.DbTablePrefix + "Books",
                    BookStoreConsts.DbSchema);
                b.ConfigureByConvention(); //auto configure for the base class props
                b.Property(x => x.Name).IsRequired().HasMaxLength(128);
            });
        }
    }
}

###Add Database Migration###
The startup solution is configured to use Entity Framework Core Code First Migrations. Since we've changed the database mapping configuration, we should create a new migration and apply changes to the database.

Open a command-line terminal in the directory of the Acme.BookStore.EntityFrameworkCore project and type the following command:

Example:

 dotnet ef migrations add Created_Book_Entity
 
If you are using Visual Studio, you may want to use the Add-Migration Created_Book_Entity -c BookStoreDbContext and Update-Database -Context BookStoreDbContext commands in the Package Manager Console (PMC).
In this case, ensure that Acme.BookStore.Web is the startup project and Acme.BookStore.EntityFrameworkCore is the Default Project in PMC.

###Add Sample Seed Data###
Create a class deriving from the "IDataSeedContributor" in the ".Domain" project by copying the following code:
(This code simply uses the IRepository<Book, Guid> (the default repository) to insert two books to the database in case there weren't any books in it.)

Example:

namespace Acme.BookStore
{
    public class BookStoreDataSeederContributor
        : IDataSeedContributor, ITransientDependency
    {
        private readonly IRepository<Book, Guid> _bookRepository;

        public BookStoreDataSeederContributor(IRepository<Book, Guid> bookRepository)
        {
            _bookRepository = bookRepository;
        }

        public async Task SeedAsync(DataSeedContext context)
        {
            if (await _bookRepository.GetCountAsync() <= 0)
            {
                await _bookRepository.InsertAsync(
                    new Book
                    {
                        Name = "1984",
                        Type = BookType.Dystopia,
                        PublishDate = new DateTime(1949, 6, 8),
                        Price = 19.84f
                    },
                    autoSave: true
                );

                await _bookRepository.InsertAsync(
                    new Book
                    {
                        Name = "The Hitchhiker's Guide to the Galaxy",
                        Type = BookType.ScienceFiction,
                        PublishDate = new DateTime(1995, 9, 27),
                        Price = 42.0f
                    },
                    autoSave: true
                );
            }
        }
    }
}

###Update the Database###

Run the Acme.BookStore.DbMigrator application to update the database:

(.DbMigrator is a console application that can be run to migrate the database schema and seed the data on development and production environments.)

##Create the Application Service##

The application layer is separated into two projects:

	Acme.BookStore.Application.Contracts contains your DTOs and application service interfaces.
	Acme.BookStore.Application contains the implementations of your application services.

In this section, you will create an application service to get, create, update and delete books using the CrudAppService base class of the ABP Framework.

###BookDto###

CrudAppService base class requires to define the fundamental DTOs for the entity. Create a Books folder (namespace) in the Acme.BookStore.Application.Contracts project and add a BookDto class inside it:
(DTO: Data Transfer Object)

Example:

namespace Acme.BookStore.Books
{
    public class BookDto : AuditedEntityDto<Guid>
    {
        public string Name { get; set; }

        public BookType Type { get; set; }

        public DateTime PublishDate { get; set; }

        public float Price { get; set; }
    }
}

DTO classes are used to transfer data between the presentation layer and the application layer. See the https://docs.abp.io/en/abp/latest/Data-Transfer-Objects document for more details.
The BookDto is used to transfer the book data to the presentation layer in order to show the book information on the UI.
The BookDto is derived from the AuditedEntityDto<Guid> which has audit properties just like the Book entity defined above.


It will be needed to map the Book entities to the BookDto objects while returning books to the presentation layer. AutoMapper library can automate this conversion when you define the proper mapping. The startup template comes with AutoMapper pre-configured. So, you can just define the mapping in the BookStoreApplicationAutoMapperProfile class in the Acme.BookStore.Application project:
Example:

namespace Acme.BookStore
{
    public class BookStoreApplicationAutoMapperProfile : Profile
    {
        public BookStoreApplicationAutoMapperProfile()
        {
            CreateMap<Book, BookDto>();
        }
    }
}

###CreateUpdateBookDto###
Create a CreateUpdateBookDto class in the Books folder (namespace) of the Acme.BookStore.Application.Contracts project:
namespace Acme.BookStore.Books
{
    public class CreateUpdateBookDto
    {
        [Required]
        [StringLength(128)]
        public string Name { get; set; }

        [Required]
        public BookType Type { get; set; } = BookType.Undefined;

        [Required]
        [DataType(DataType.Date)]
        public DateTime PublishDate { get; set; } = DateTime.Now;

        [Required]
        public float Price { get; set; }
    }
}

This DTO class is used to get a book information from the user interface while creating or updating the book.
It defines data annotation attributes (like [Required]) to define validations for the properties. DTOs are automatically validated by the ABP framework.

As done to the BookDto above, we should define the mapping from the CreateUpdateBookDto object to the Book entity. BookStoreApplicationAutoMapperProfile class in the Acme.BookStore.Application will be as shown below:

Example:

namespace Acme.BookStore
{
    public class BookStoreApplicationAutoMapperProfile : Profile
    {
        public BookStoreApplicationAutoMapperProfile()
        {
            CreateMap<Book, BookDto>();
            CreateMap<CreateUpdateBookDto, Book>();
        }
    }
}

###IBookAppService###
Next step is to define an interface for the application service. Create an IBookAppService interface in the Books folder (namespace) of the Acme.BookStore.Application.Contracts project:

Example:

namespace Acme.BookStore.Books
{
    public interface IBookAppService :
        ICrudAppService< //Defines CRUD methods
            BookDto, //Used to show books
            Guid, //Primary key of the book entity
            PagedAndSortedResultRequestDto, //Used for paging/sorting
            CreateUpdateBookDto> //Used to create/update a book
    {

    }
}

Defining interfaces for the application services are not required by the framework. However, it's suggested as a best practice.

###BookAppService###
It is time to implement the IBookAppService interface. Create a new class, named BookAppService in the Books namespace (folder) of the Acme.BookStore.Application project:

Example:

namespace Acme.BookStore.Books
{
    public class BookAppService :
        CrudAppService<
            Book, //The Book entity
            BookDto, //Used to show books
            Guid, //Primary key of the book entity
            PagedAndSortedResultRequestDto, //Used for paging/sorting
            CreateUpdateBookDto>, //Used to create/update a book
        IBookAppService //implement the IBookAppService
    {
        public BookAppService(IRepository<Book, Guid> repository)
            : base(repository)
        {

        }
    }
}

BookAppService is derived from CrudAppService<...> which implements all the CRUD (create, read, update, delete) methods defined by the ICrudAppService.

BookAppService injects IRepository<Book, Guid> which is the default repository for the Book entity. ABP automatically creates default repositories for each aggregate root (or entity). See the repository document.

BookAppService uses IObjectMapper service (see) to map the Book objects to the BookDto objects and CreateUpdateBookDto objects to the Book objects. The Startup template uses the AutoMapper library as the object mapping provider. We have defined the mappings before, so it will work as expected.

##Auto API Controllers##