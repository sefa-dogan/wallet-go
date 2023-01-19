using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace WalletGo.EntitiesDto.AccountW
{
    public class CreateUpdateAppAccountDto
    {
        [Required]
        public string Name { get; set; }
        [Required]
        public double Balance { get; set; }
        [Required]
        public Guid WalletId { get; set; }


    }
}
