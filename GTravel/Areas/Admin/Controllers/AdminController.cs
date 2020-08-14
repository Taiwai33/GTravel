using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GTravel.Domain;
using GTravel.Domain.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GTravel.Areas.Admin.Controllers
{
    [Area(SD.Admin)]
    [Authorize(Roles ="Admin,Manager")]
    public class AdminController : Controller
    {
        protected readonly ApplicationDbContext _db;

        public AdminController(ApplicationDbContext db)
        {
            _db = db;
        }
              
        
    }
}
