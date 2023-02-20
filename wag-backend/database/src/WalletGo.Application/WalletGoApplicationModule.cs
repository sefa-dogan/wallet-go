using Volo.Abp.Account;
using Volo.Abp.AutoMapper;
using Volo.Abp.FeatureManagement;
using Volo.Abp.Identity;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement;
using Volo.Abp.SettingManagement;
using Volo.Abp.TenantManagement;
using Volo.Abp.Sms;
using Volo.Abp.Emailing;
using Volo.Abp.MailKit;
using MailKit.Security;

namespace WalletGo;

[DependsOn(
    typeof(WalletGoDomainModule),
    typeof(AbpAccountApplicationModule),
    typeof(WalletGoApplicationContractsModule),
    typeof(AbpIdentityApplicationModule),
    typeof(AbpPermissionManagementApplicationModule),
    typeof(AbpTenantManagementApplicationModule),
    typeof(AbpFeatureManagementApplicationModule),
    typeof(AbpSettingManagementApplicationModule)
    )]
[DependsOn(typeof(AbpSmsModule))]
    [DependsOn(typeof(AbpEmailingModule))]
    [DependsOn(typeof(AbpMailKitModule))]
    public class WalletGoApplicationModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        Configure<AbpAutoMapperOptions>(options =>
        {
            options.AddMaps<WalletGoApplicationModule>();
        });

        Configure<AbpMailKitOptions>(options =>
        {
            options.SecureSocketOption = SecureSocketOptions.None;
        });
    }
}
