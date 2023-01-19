using WalletGo.EntityFrameworkCore;
using Volo.Abp.Autofac;
using Volo.Abp.BackgroundJobs;
using Volo.Abp.Modularity;

namespace WalletGo.DbMigrator;

[DependsOn(
    typeof(AbpAutofacModule),
    typeof(WalletGoEntityFrameworkCoreModule),
    typeof(WalletGoApplicationContractsModule)
    )]
public class WalletGoDbMigratorModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        Configure<AbpBackgroundJobOptions>(options => options.IsJobExecutionEnabled = false);
    }
}
