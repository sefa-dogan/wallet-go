using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using WalletGo.EntitiesDto.UserInfoW;

namespace WalletGo.Entities
{
    public class UserInfoAppService :
        CrudAppService<
            UserInfo, //The Book entity
            UserInfoDto, //Used to show books
            Guid, //Primary key of the book entity
            PagedAndSortedResultRequestDto, //Used for paging/sorting
            CreateUpdateUserInfoDto>, //Used to create/update a book
        IUserInfoAppService //implement the IBookAppService
    {
        public UserInfoAppService(IRepository<UserInfo, Guid> repository)
    : base(repository)
        {

        }
       
        public async Task<Guid> getUserInfoId(Guid appUserId)
        {
            var userInfo= await Repository.GetAsync(u => u.AppUserId == appUserId);

            return userInfo.Id;
        }

    }
}
