using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Dtos;

namespace WalletGo.EntitiesDto.WalletW
{
    public class WalletDto : AuditedEntityDto<Guid>
    {
        public Guid UserInfoId { get; set; }
        public string Name { get; set; }
        public double Balance { get; set; }
    }
}
