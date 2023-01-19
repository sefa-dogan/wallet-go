using System.Threading.Tasks;
using Volo.Abp.DependencyInjection;

namespace WalletGo.Data;

/* This is used if database provider does't define
 * IWalletGoDbSchemaMigrator implementation.
 */
public class NullWalletGoDbSchemaMigrator : IWalletGoDbSchemaMigrator, ITransientDependency
{
    public Task MigrateAsync()
    {
        return Task.CompletedTask;
    }
}
