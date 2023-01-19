using WalletGo.Localization;
using Volo.Abp.AspNetCore.Mvc;

namespace WalletGo.Controllers;

/* Inherit your controllers from this class.
 */
public abstract class WalletGoController : AbpControllerBase
{
    protected WalletGoController()
    {
        LocalizationResource = typeof(WalletGoResource);
    }
}
