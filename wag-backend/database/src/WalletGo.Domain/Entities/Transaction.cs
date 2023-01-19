using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Domain.Entities.Auditing;

namespace WalletGo.Entities
{
    public class Transaction : AuditedAggregateRoot<Guid>
    {
        public DateTime TransactionDate { get; set; }
        public Guid FromAccountId { get; set; }
        public Guid ToAccountId { get; set; }
        public Guid WalletId { get; set; }
        public double Amount { get; set; }
        public AppAccount Account { get; set; }
        public Transaction Transactions { get; set; }
    }
}
