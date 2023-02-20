using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using WalletGo.Entities;
using WalletGo.EntitiesDto.TemplateW;
using WalletGo.EntitiesDto.TransactionW;

namespace WalletGo.EntityServices
{
    public class TemplateAppService : CrudAppService<
            Template, //The Book entity
            TemplateDto, //Used to show books
            Guid, //Primary key of the book entity
            PagedAndSortedResultRequestDto, //Used for paging/sorting
            CreateUpdateTemplateDto>, //Used to create/update a book
        ITemplateAppService
    {
        public TemplateAppService(IRepository<Template, Guid> repository) : base(repository)
        {
        }

        public async Task<List<Template>> getTemplates(Guid walletId)
        {
            try
            {
            List<Template> templates = await Repository.GetListAsync(t => t.WalletId == walletId);
            return templates;

            }
            catch
            {
                return new List<Template>();
            }

        }
    }
}
