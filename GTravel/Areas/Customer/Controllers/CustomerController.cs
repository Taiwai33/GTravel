using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GTravel.Domain.Data;
using Microsoft.AspNetCore.Mvc;

namespace GTravel.Areas.Customer.Controllers
{
    [Area("Customer")]
    public class CustomerController : Controller
    {
        protected readonly ApplicationDbContext _db;

        public CustomerController(ApplicationDbContext db)
        {
            _db = db;
        }
      
    }
}
