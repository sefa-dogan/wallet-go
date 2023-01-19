using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Dtos;

namespace WalletGo.EntitiesDto.TransactionW
{
    public class TransactionDto : AuditedEntityDto<Guid>
    {
        public DateTime TransactionDate { get; set; }
        public Guid FromAccountId { get; set; }
        public Guid ToAccountId { get; set; }
        public Guid WalletId { get; set; }
        public double Amount { get; set; }
        
    }
}
