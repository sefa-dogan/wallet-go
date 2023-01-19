using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Domain.Entities.Auditing;

namespace WalletGo.Entities
{
    public class AppUser : AuditedAggregateRoot<Guid>
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public UserInfo UserInfo { get; set; }
    }
}
