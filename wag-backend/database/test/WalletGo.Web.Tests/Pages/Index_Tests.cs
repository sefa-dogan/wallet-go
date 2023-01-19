using System.Threading.Tasks;
using Shouldly;
using Xunit;

namespace WalletGo.Pages;

public class Index_Tests : WalletGoWebTestBase
{
    [Fact]
    public async Task Welcome_Page()
    {
        var response = await GetResponseAsStringAsync("/");
        response.ShouldNotBeNull();
    }
}
