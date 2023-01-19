using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace WalletGo.EntitiesDto.UserInfoW
{
    public class CreateUpdateUserInfoDto
    {
        [Required]
        public Guid AppUserId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Surname { get; set; }
        [Required]
        public string Tcno { get; set; }
        [Required]
        public string Email { get; set; }
    }
}
