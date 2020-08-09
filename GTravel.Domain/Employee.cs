using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;

namespace GTravel.Domain
{
   public class Employee: IdentityUser
    {
        public string FirstName { get; set; }    //required
        public string LastName { get; set; }    //required
        public string StreetAddress { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostCode { get; set; }
        public DateTime DOB { get; set; }
    }
}
