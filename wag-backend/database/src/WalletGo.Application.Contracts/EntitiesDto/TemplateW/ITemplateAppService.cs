using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using WalletGo.EntitiesDto.TransactionW;

namespace WalletGo.EntitiesDto.TemplateW
{
    public interface ITemplateAppService : ICrudAppService< //Defines CRUD methods
            TemplateDto, //Used to show templates
            Guid, //Primary key of the template entity
            PagedAndSortedResultRequestDto, //Used for paging/sorting
            CreateUpdateTemplateDto>
    {
    }
}
