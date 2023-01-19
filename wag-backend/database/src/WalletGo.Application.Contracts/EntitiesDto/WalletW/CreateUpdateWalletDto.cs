using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace WalletGo.EntitiesDto.WalletW
{
    public class CreateUpdateWalletDto
    {
        [Required]
        public Guid UserInfoId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public double Balance { get; set; }

    }
}
