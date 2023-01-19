using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Dtos;

namespace WalletGo.EntitiesDto.UserInfoW
{
    public class UserInfoDto : AuditedEntityDto<Guid>
    {
        public Guid AppUserId { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Tcno { get; set; }
        public string Email { get; set; }
    }
}
