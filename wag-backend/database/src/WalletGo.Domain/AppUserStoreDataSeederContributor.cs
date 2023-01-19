using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Data;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Domain.Repositories;
using WalletGo.Entities;

namespace WalletGo
{
    public class AppUserStoreDataSeederContributor : IDataSeedContributor, ITransientDependency
    {
        private readonly IRepository<AppUser, Guid> _appUserRepository;

        public AppUserStoreDataSeederContributor(IRepository<AppUser, Guid> appUserRepository)
        {
            _appUserRepository = appUserRepository;
        }

        /*
                 public int TransactionId { get; set; }
        public DateTime TransactionDate { get; set; }
        public int FromAccountId { get; set; }
        public int ToAccountId { get; set; }
        public Double Amount { get; set; }
         */

        public async Task SeedAsync(DataSeedContext context)
        {
            if (await _appUserRepository.GetCountAsync() <= 0)
            {
                await _appUserRepository.InsertAsync(
                    new AppUser
                    {
                        Username = "admin",
                        Password = "admin",
                    },
                    autoSave: true
                );
            }
        }
    }
}
