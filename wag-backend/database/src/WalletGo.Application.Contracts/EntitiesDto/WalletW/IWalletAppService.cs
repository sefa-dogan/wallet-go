using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using WalletGo.EntitiesDto.WalletW;

namespace WalletGo.EntitiesDto.WalletW
{
    public interface IWalletAppService :
        ICrudAppService< //Defines CRUD methods
            WalletDto, //Used to show books
            Guid, //Primary key of the book entity
            PagedAndSortedResultRequestDto, //Used for paging/sorting
            CreateUpdateWalletDto>
    {
    }
}
