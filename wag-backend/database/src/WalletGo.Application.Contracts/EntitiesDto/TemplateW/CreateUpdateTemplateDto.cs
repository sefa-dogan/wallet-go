using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace WalletGo.EntitiesDto.TemplateW
{
    public class CreateUpdateTemplateDto
    {
        [Required]
        public double Amount { get; set; }
        [Required]
        public Guid AccountId { get; set; }
        [Required]
        public Guid WalletId { get; set; }
    }
}
