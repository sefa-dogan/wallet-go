using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Dtos;

namespace WalletGo.EntitiesDto.AccountW
{
    public class AppAccountDto : AuditedEntityDto<Guid>
    {
        public string Name { get; set; }
        public double Balance { get; set; }
        public Guid WalletId { get; set; }

    }
}