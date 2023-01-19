using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Services;
using Volo.Abp.Application.Dtos;

namespace WalletGo.EntitiesDto.AccountW
{
    public interface IAppAccountAppService  :
        ICrudAppService< //Defines CRUD methods
            AppAccountDto, //Used to show books
            Guid, //Primary key of the book entity
            PagedAndSortedResultRequestDto, //Used for paging/sorting
            CreateUpdateAppAccountDto>
    {
    }
}
