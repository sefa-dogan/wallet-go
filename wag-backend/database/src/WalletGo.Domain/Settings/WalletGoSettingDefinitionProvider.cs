using Volo.Abp.Settings;

namespace WalletGo.Settings;

public class WalletGoSettingDefinitionProvider : SettingDefinitionProvider
{
    public override void Define(ISettingDefinitionContext context)
    {
        //Define your own settings here. Example:
        //context.Add(new SettingDefinition(WalletGoSettings.MySetting1));
    }
}
