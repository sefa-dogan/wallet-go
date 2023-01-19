using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Dtos;

namespace WalletGo.EntitiesDto.AppUserW
{
    public class AppUserDto : AuditedEntityDto<Guid>
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
