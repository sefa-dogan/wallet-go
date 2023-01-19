using Volo.Abp.Modularity;

namespace WalletGo;

[DependsOn(
    typeof(WalletGoApplicationModule),
    typeof(WalletGoDomainTestModule)
    )]
public class WalletGoApplicationTestModule : AbpModule
{

}
