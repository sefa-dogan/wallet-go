using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using WalletGo.EntitiesDto.TransactionW;

namespace WalletGo.Entities
{
    public class TransactionAppService :
        CrudAppService<
            Transaction, //The Book entity
            TransactionDto, //Used to show books
            Guid, //Primary key of the book entity
            PagedAndSortedResultRequestDto, //Used for paging/sorting
            CreateUpdateTransactionDto>, //Used to create/update a book
        ITransactionAppService //implement the IBookAppService
    {
        public TransactionAppService(IRepository<Transaction, Guid> repository)
    : base(repository)
        {

        }

        public async Task<List<Transaction>> getAllTransactions(Guid appAccountId)
        {
            List<Transaction> allTransactions  =await Repository.GetListAsync(x=>x.FromAccountId == appAccountId|| x.ToAccountId == appAccountId);
            allTransactions = allTransactions.OrderByDescending(x=>x.TransactionDate).Reverse().ToList();
            return allTransactions;
        }

        public async Task<List<Transaction>?> getLastPayments(Guid walletId)
        {

            List<Transaction> allTransactions = await Repository.GetListAsync(x => x.WalletId == walletId);
            if (0 < allTransactions.Count)
            {
                allTransactions = allTransactions.OrderByDescending(x => x.TransactionDate).ToList();
                List<Transaction> lastTransactions;
                if (allTransactions.Count > 10)
                {
                    lastTransactions = allTransactions.GetRange(0, 10);
                    return lastTransactions;
                }
                else
                {
                    lastTransactions = allTransactions;
                    return lastTransactions;
                }
            }
            else
            {
                List<Transaction> empty = new List<Transaction>();

                return empty;
            }
            

        }
    }
}
