using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GTravel.Domain.Data;
using Microsoft.AspNetCore.Mvc;

namespace GTravel.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminController : Controller
    {
        protected readonly ApplicationDbContext _db;

        public AdminController(ApplicationDbContext db)
        {
            _db = db;
        }
        
    }
}
