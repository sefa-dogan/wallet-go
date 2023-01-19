using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace WalletGo.EntitiesDto.UserInfoW
{
    public interface IUserInfoAppService :
        ICrudAppService< //Defines CRUD methods
            UserInfoDto, //Used to show books
            Guid, //Primary key of the book entity
            PagedAndSortedResultRequestDto, //Used for paging/sorting
            CreateUpdateUserInfoDto>
    {
    }
}
