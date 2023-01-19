using Volo.Abp.Ui.Branding;
using Volo.Abp.DependencyInjection;

namespace WalletGo.Web;

[Dependency(ReplaceServices = true)]
public class WalletGoBrandingProvider : DefaultBrandingProvider
{
    public override string AppName => "WalletGo";
}
