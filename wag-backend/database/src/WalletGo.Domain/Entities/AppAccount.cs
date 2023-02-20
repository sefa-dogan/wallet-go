using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Domain.Entities.Auditing;

namespace WalletGo.Entities
{
    public class AppAccount : AuditedAggregateRoot<Guid>
    {
        public string Name { get; set; }
        public double Balance { get; set; }
        public Guid WalletId { get; set; }
        public Wallet Wallet { get; set; }
        public List<Transaction> Transactions { get; set; }
        public List<Template> Templates { get; set; }

    }
}
