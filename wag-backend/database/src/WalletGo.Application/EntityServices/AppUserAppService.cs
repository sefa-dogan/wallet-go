using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Emailing;
using Volo.Abp.Emailing.Templates;
using Volo.Abp.Sms;
using Volo.Abp.TextTemplating;
using WalletGo.EntitiesDto.AppUserW;
using WalletGo.EntityFrameworkCore;

namespace WalletGo.Entities
{
    public class AppUserAppService :
        CrudAppService<
            AppUser, //The Book entity
            AppUserDto, //Used to show books
            Guid, //Primary key of the book entity
            PagedAndSortedResultRequestDto, //Used for paging/sorting
            CreateUpdateAppUserDto>, //Used to create/update a book
        IAppUserAppService, ITransientDependency //implement the IBookAppService
    {
        Guid? result;
        private readonly IEmailSender _emailSender;
        private MailMessage _mailMessage;

        public AppUserAppService(IRepository<AppUser, Guid> repository, IEmailSender emailSender)
            : base(repository)
        {
            //result = (Guid?)null;
            _emailSender = emailSender;
            _mailMessage = new MailMessage("sefadoan-@hotmail.com", "sefadoan6@gmail.com", "Email subject", "This is email body...");

        }

        public async Task<bool> isRegistered(String username)
        {
            var isTrue = await Repository.AnyAsync(x => x.Username == username);
            return isTrue;
        }

        public async Task<Guid?> getUserId(String username)
        {
            try
            {
                AppUser? user = await Repository.FindAsync(x => x.Username == username);
                return user.Id;
            }
            catch (Exception exp)
            {
                return null;
            }



        }

        public async Task<bool> SendEmail()
        {

            await _emailSender.SendAsync(
                            "sefadoan-@hotmail.com",     // target email address
                            "Email subject",         // subject
                            "This is email body..."  // email body

                        );
            return true;


        }
    }
}
