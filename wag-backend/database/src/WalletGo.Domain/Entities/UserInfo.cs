using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Domain.Entities.Auditing;

namespace WalletGo.Entities
{
    public class UserInfo : AuditedAggregateRoot<Guid>
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Tcno { get; set; }
        public string Email { get; set; }
        public Guid AppUserId { get; set; }
        public AppUser AppUser { get; set; }
        public Wallet Wallet { get; set; }
    }
}
