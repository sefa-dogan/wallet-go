using AutoMapper;
using WalletGo.Entities;
using WalletGo.EntitiesDto.AccountW;
using WalletGo.EntitiesDto.AppUserW;
using WalletGo.EntitiesDto.TemplateW;
using WalletGo.EntitiesDto.TransactionW;
using WalletGo.EntitiesDto.UserInfoW;
using WalletGo.EntitiesDto.WalletW;

namespace WalletGo;

public class WalletGoApplicationAutoMapperProfile : Profile
{
    public WalletGoApplicationAutoMapperProfile()
    {
        /* You can configure your AutoMapper mapping configuration here.
         * Alternatively, you can split your mapping configurations
         * into multiple profile classes for a better organization. */
        CreateMap<AppUser, AppUserDto>();
        CreateMap<Transaction, TransactionDto>();
        CreateMap<UserInfo, UserInfoDto>();
        CreateMap<Wallet, WalletDto>();
        CreateMap<AppAccount, AppAccountDto>();
        CreateMap<Template, TemplateDto>();

        CreateMap<CreateUpdateAppUserDto, AppUser>();
        CreateMap<CreateUpdateTransactionDto, Transaction>();
        CreateMap<CreateUpdateUserInfoDto, UserInfo>();
        CreateMap<CreateUpdateWalletDto, Wallet>();
        CreateMap<CreateUpdateAppAccountDto, AppAccount>();
        CreateMap<CreateUpdateTemplateDto, Template>();
    }
}
