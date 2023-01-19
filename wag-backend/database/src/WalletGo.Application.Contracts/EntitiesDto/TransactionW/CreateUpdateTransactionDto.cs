using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace WalletGo.EntitiesDto.TransactionW
{
    public class CreateUpdateTransactionDto
    {
        [Required]
        public DateTime TransactionDate { get; set; }
        public Guid FromAccountId { get; set; }
        [Required]
        public Guid ToAccountId { get; set; }
        [Required]
        public Guid WalletId { get; set; }
        [Required]
        public double Amount { get; set; }
    }
}
