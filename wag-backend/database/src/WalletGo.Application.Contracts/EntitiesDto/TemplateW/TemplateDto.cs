using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Dtos;

namespace WalletGo.EntitiesDto.TemplateW
{
    public class TemplateDto : AuditedEntityDto<Guid>
    {
        public double Amount { get; set; }
        public Guid AccountId { get; set; }
        public Guid WalletId { get; set; }

    }
}
