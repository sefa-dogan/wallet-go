using Microsoft.EntityFrameworkCore;
using Volo.Abp.AuditLogging.EntityFrameworkCore;
using Volo.Abp.BackgroundJobs.EntityFrameworkCore;
using Volo.Abp.Data;
using Volo.Abp.DependencyInjection;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore.Modeling;
using Volo.Abp.FeatureManagement.EntityFrameworkCore;
using Volo.Abp.Identity;
using Volo.Abp.Identity.EntityFrameworkCore;
using Volo.Abp.OpenIddict.EntityFrameworkCore;
using Volo.Abp.PermissionManagement.EntityFrameworkCore;
using Volo.Abp.SettingManagement.EntityFrameworkCore;
using Volo.Abp.TenantManagement;
using Volo.Abp.TenantManagement.EntityFrameworkCore;
using WalletGo.Entities;

namespace WalletGo.EntityFrameworkCore;

[ReplaceDbContext(typeof(IIdentityDbContext))]
[ReplaceDbContext(typeof(ITenantManagementDbContext))]
[ConnectionStringName("Default")]
public class WalletGoDbContext :
    AbpDbContext<WalletGoDbContext>,
    IIdentityDbContext,
    ITenantManagementDbContext
{
    /* Add DbSet properties for your Aggregate Roots / Entities here. */

    #region Entities from the modules

    /* Notice: We only implemented IIdentityDbContext and ITenantManagementDbContext
     * and replaced them for this DbContext. This allows you to perform JOIN
     * queries for the entities of these modules over the repositories easily. You
     * typically don't need that for other modules. But, if you need, you can
     * implement the DbContext interface of the needed module and use ReplaceDbContext
     * attribute just like IIdentityDbContext and ITenantManagementDbContext.
     *
     * More info: Replacing a DbContext of a module ensures that the related module
     * uses this DbContext on runtime. Otherwise, it will use its own DbContext class.
     */

    ////////////////////////////////////////////////////////////////////////////
    //// WalletGo Entities

    public DbSet<AppUser> AppUsers { get; set; }
    public DbSet<Transaction> Transactions { get; set; }
    public DbSet<UserInfo> UserInfoes { get; set; }
    public DbSet<Wallet> Wallets { get; set; }
    public DbSet<AppAccount> Accounts { get; set; }
    public DbSet<Template> Templates { get; set; }


    ////////////////////////////////////////////////////////////////////////////

    //Identity
    public DbSet<IdentityUser> Users { get; set; }
    public DbSet<IdentityRole> Roles { get; set; }
    public DbSet<IdentityClaimType> ClaimTypes { get; set; }
    public DbSet<OrganizationUnit> OrganizationUnits { get; set; }
    public DbSet<IdentitySecurityLog> SecurityLogs { get; set; }
    public DbSet<IdentityLinkUser> LinkUsers { get; set; }

    // Tenant Management
    public DbSet<Tenant> Tenants { get; set; }
    public DbSet<TenantConnectionString> TenantConnectionStrings { get; set; }

    #endregion

    public WalletGoDbContext(DbContextOptions<WalletGoDbContext> options)
        : base(options)
    {

    }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);

        /* Include modules to your migration db context */

        builder.ConfigurePermissionManagement();
        builder.ConfigureSettingManagement();
        builder.ConfigureBackgroundJobs();
        builder.ConfigureAuditLogging();
        builder.ConfigureIdentity();
        builder.ConfigureOpenIddict();
        builder.ConfigureFeatureManagement();
        builder.ConfigureTenantManagement();

        /* Configure your own tables/entities inside here */

        //builder.Entity<YourEntity>(b =>
        //{
        //    b.ToTable(WalletGoConsts.DbTablePrefix + "YourEntities", WalletGoConsts.DbSchema);
        //    b.ConfigureByConvention(); //auto configure for the base class props
        //    //...
        //});

        builder.Entity<AppUser>(
            a =>
            {
                a.ToTable("AppUsers", WalletGoConsts.DbSchema);
                a.Property(a => a.Username).IsRequired();
                a.Property(a => a.Password).IsRequired();
                //a.HasOne(c => c.UserInfo).WithOne(a => a.AppUser).HasForeignKey<AppUser>(a => a.UserInfoId);
                a.ConfigureByConvention();
            });

        builder.Entity<Transaction>(
            t =>
            {
                t.ToTable("Transactions", WalletGoConsts.DbSchema);
                t.Property(p => p.TransactionDate).IsRequired();
                t.Property(p => p.FromAccountId).IsRequired();
                t.Property(p => p.ToAccountId).IsRequired();
                t.Property(p => p.Amount).IsRequired();
                t.HasOne(t => t.Account)            
                .WithMany(w => w.Transactions)       
                .HasForeignKey(g => g.ToAccountId);
                t.ConfigureByConvention();
            });

        builder.Entity<UserInfo>(
            u =>
            {   
                u.ToTable("UserInfoes", WalletGoConsts.DbSchema);
                u.Property(p => p.AppUserId).IsRequired();
                u.Property(p => p.Name).IsRequired();
                u.Property(p => p.Surname).IsRequired();
                u.Property(p => p.Tcno).IsRequired();
                u.Property(p => p.Email).IsRequired();
                u.HasOne(c => c.AppUser).WithOne(u => u.UserInfo).HasForeignKey<UserInfo>(u => u.AppUserId);
                u.ConfigureByConvention();
            });
        builder.Entity<Wallet>(
            w =>
            {
                w.ToTable("Wallets", WalletGoConsts.DbSchema);
                w.Property(p => p.UserInfoId).IsRequired();
                w.Property(p => p.Name).IsRequired();
                w.Property(p => p.Balance).IsRequired();
                w.HasOne(t => t.UserInfo).WithOne(u => u.Wallet).HasForeignKey<Wallet>(w => w.UserInfoId);
                w.ConfigureByConvention();
            });

        builder.Entity<AppAccount>(
            w =>
            {
                w.ToTable("AppAccounts", WalletGoConsts.DbSchema);
                w.Property(p => p.Name).IsRequired();
                w.Property(p => p.Balance).IsRequired();
                w.Property(p => p.WalletId).IsRequired();
                w.HasOne(a=>a.Wallet).WithMany(w=>w.Accounts).HasForeignKey(f=>f.WalletId);
                w.ConfigureByConvention();
            });

        builder.Entity<Template>(
            t =>
            {
                t.ToTable("Templates", WalletGoConsts.DbSchema);
                t.Property(t=>t.Amount).IsRequired();
                t.Property(t => t.AccountId).IsRequired();
                t.Property(t=>t.WalletId).IsRequired();
                t.HasOne(t=>t.Account).WithMany(w=>w.Templates).HasForeignKey(f=>f.AccountId);
                t.ConfigureByConvention();
            }
            );

    }
}
