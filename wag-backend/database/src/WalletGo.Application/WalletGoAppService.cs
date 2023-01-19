using System;
using System.Collections.Generic;
using System.Text;
using WalletGo.Localization;
using Volo.Abp.Application.Services;
using Volo.Abp.Emailing;

namespace WalletGo;

/* Inherit your application services from this class.
 */
public abstract class WalletGoAppService : ApplicationService
{
    private readonly IEmailSender _emailSender;
    protected WalletGoAppService(IEmailSender emailSender)
    {
        LocalizationResource = typeof(WalletGoResource);
        _emailSender = emailSender;
    }
}
