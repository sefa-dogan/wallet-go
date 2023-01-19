using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using WalletGo.EntitiesDto.WalletW;

namespace WalletGo.Entities
{
    public class WalletAppService :
        CrudAppService<
            Wallet, //The Book entity
            WalletDto, //Used to show books
            Guid, //Primary key of the book entity
            PagedAndSortedResultRequestDto, //Used for paging/sorting
            CreateUpdateWalletDto>, //Used to create/update a book
        IWalletAppService //implement the IBookAppService
    {
        public WalletAppService(IRepository<Wallet, Guid> repository)
    : base(repository)
        {

        }

        public async Task<Guid> getUserInfoId(Guid walletId)
        {
            Wallet wallet = await Repository.GetAsync(w => w.Id == walletId);
            return wallet.UserInfoId;
        }

        public async Task<Guid> getWalletId(Guid userInfoId)
        {
            Wallet wallet = await Repository.GetAsync(w => w.UserInfoId == userInfoId);
            return wallet.Id;
        }

        public async Task<bool> updateBalance(Guid walletId, double money)
        {
            Wallet wallet = await Repository.GetAsync(w => w.Id == walletId);
            if (money < 0) 
            { 
                if (wallet.Balance >= Math.Abs(money))
                {
                    wallet.Balance = wallet.Balance + money;
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                wallet.Balance = wallet.Balance + money;
                return true;
            }
        }
    }
}
