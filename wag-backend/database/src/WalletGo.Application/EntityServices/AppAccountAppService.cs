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
using WalletGo.EntitiesDto.WalletW;
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
        IAppAccountAppService, IWalletAppService
    {
        public AppAccountAppService(IRepository<AppAccount, Guid> repository, IRepository<Wallet, Guid> walletRepository)
    : base(repository)
        {
            _walletRepository = walletRepository;
        }
        IRepository<Wallet, Guid> _walletRepository;

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

                Wallet wallet = new();
                wallet = await _walletRepository.GetAsync(x => x.Id == appAccount.WalletId);
                wallet.Balance = wallet.Balance + amount;
                return true;
            }
            catch
            {
                return false;
            }
        }

        Task<WalletDto> IReadOnlyAppService<WalletDto, WalletDto, Guid, PagedAndSortedResultRequestDto>.GetAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        Task<PagedResultDto<WalletDto>> IReadOnlyAppService<WalletDto, WalletDto, Guid, PagedAndSortedResultRequestDto>.GetListAsync(PagedAndSortedResultRequestDto input)
        {
            throw new NotImplementedException();
        }

        Task<WalletDto> ICreateAppService<WalletDto, CreateUpdateWalletDto>.CreateAsync(CreateUpdateWalletDto input)
        {
            throw new NotImplementedException();
        }

        Task<WalletDto> IUpdateAppService<WalletDto, Guid, CreateUpdateWalletDto>.UpdateAsync(Guid id, CreateUpdateWalletDto input)
        {
            throw new NotImplementedException();
        }
    }
}
