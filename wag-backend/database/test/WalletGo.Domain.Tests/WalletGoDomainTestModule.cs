using WalletGo.EntityFrameworkCore;
using Volo.Abp.Modularity;

namespace WalletGo;

[DependsOn(
    typeof(WalletGoEntityFrameworkCoreTestModule)
    )]
public class WalletGoDomainTestModule : AbpModule
{

}
