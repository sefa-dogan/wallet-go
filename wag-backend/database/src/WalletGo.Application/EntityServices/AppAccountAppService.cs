using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Account;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using WalletGo.Entities;
using WalletGo.EntitiesDto.AccountW;
using IAppAccountAppService = WalletGo.EntitiesDto.AccountW.IAppAccountAppService;

namespace WalletGo.EntityServices
{
    public class AppAccountAppService :
        CrudAppService<
            AppAccount, //The Book entity
            AppAccountDto, //Used to show books
            Guid, //Primary key of the book entity
            PagedAndSortedResultRequestDto, //Used for paging/sorting
            CreateUpdateAppAccountDto>, //Used to create/update a book
        IAppAccountAppService //implement the IBookAppService
    {
        public AppAccountAppService(IRepository<AppAccount, Guid> repository)
    : base(repository)
        {

        }
        public async Task<List<Guid>> getAccountsId(Guid walletId)
        {
            List<AppAccount> allAppAccounts = new List<AppAccount>();
            allAppAccounts = await Repository.GetListAsync();
            //TODO Linq yerine GetListAsync i kullan.
            List<Guid> appAccounts = (from account in allAppAccounts where account.WalletId == walletId select account.Id).ToList();
            return appAccounts;
        }

        public async Task<Guid> getWalletId(Guid accountId)
        {
            AppAccount appAccount = await Repository.GetAsync(x => x.Id == accountId);
            return appAccount.WalletId;
        }

        public async Task<string> updateName(Guid appAccountId,string name)
        {
            AppAccount appAccount = await Repository.GetAsync(x => x.Id == appAccountId);
            appAccount.Name = name;
            return appAccount.Name;
        }
        public async Task<bool> updateBalance(Guid appAccountId, double amount)
        {
            try
            {
                AppAccount appAccount=new();
                appAccount = await Repository.FindAsync(appAccountId);
                appAccount.Balance = appAccount.Balance + amount;
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}
