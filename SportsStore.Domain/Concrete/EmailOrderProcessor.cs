using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SportsStore.Domain.Abstract;
using SportsStore.Domain.Entities;

namespace SportsStore.Domain.Concrete
{
    public class EmailOrderProcessor
    {
        public class EmailSettings
        {
            public string MailToAddress = "orders@cong.com";
            public string MailFromAddress = "SportsStore@sportsStore.com";
            public bool UseSSL = true;
            public string Username = "MySmtpUsername";
            public string Password = "MySmtpPassword";
            public string SeverName = "smtp.amalan.com";
            public string SeverPort = "587";
            public bool WriteAsFIle = true;
            public string FileLocation = @"c:\sport_store_emails";

        }
    }
}
