using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Domain.Entities.Auditing;

namespace WalletGo.Entities
{
    public class Template : AuditedAggregateRoot<Guid>
    {
        public double Amount { get; set; }
        public Guid AccountId { get; set; }
        public Guid WalletId { get; set; }
        public AppAccount Account { get; set; }
    }
}
