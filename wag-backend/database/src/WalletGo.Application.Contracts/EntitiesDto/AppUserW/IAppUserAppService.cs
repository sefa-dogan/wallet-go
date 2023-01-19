using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace WalletGo.EntitiesDto.AppUserW
{
    public interface IAppUserAppService :
        ICrudAppService< //Defines CRUD methods
            AppUserDto, //Used to show books
            Guid, //Primary key of the book entity
            PagedAndSortedResultRequestDto, //Used for paging/sorting
            CreateUpdateAppUserDto>
    {
    }
}
