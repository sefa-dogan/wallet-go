using System.Threading.Tasks;

namespace WalletGo.Data;

public interface IWalletGoDbSchemaMigrator
{
    Task MigrateAsync();
}
