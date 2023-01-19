using System;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using WalletGo.Data;
using Volo.Abp.DependencyInjection;

namespace WalletGo.EntityFrameworkCore;

public class EntityFrameworkCoreWalletGoDbSchemaMigrator
    : IWalletGoDbSchemaMigrator, ITransientDependency
{
    private readonly IServiceProvider _serviceProvider;

    public EntityFrameworkCoreWalletGoDbSchemaMigrator(
        IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;
    }

    public async Task MigrateAsync()
    {
        /* We intentionally resolving the WalletGoDbContext
         * from IServiceProvider (instead of directly injecting it)
         * to properly get the connection string of the current tenant in the
         * current scope.
         */

        await _serviceProvider
            .GetRequiredService<WalletGoDbContext>()
            .Database
            .MigrateAsync();
    }
}
