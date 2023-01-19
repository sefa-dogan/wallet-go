using WalletGo.Localization;
using Volo.Abp.AspNetCore.Mvc.UI.RazorPages;

namespace WalletGo.Web.Pages;

/* Inherit your PageModel classes from this class.
 */
public abstract class WalletGoPageModel : AbpPageModel
{
    protected WalletGoPageModel()
    {
        LocalizationResourceType = typeof(WalletGoResource);
    }
}
