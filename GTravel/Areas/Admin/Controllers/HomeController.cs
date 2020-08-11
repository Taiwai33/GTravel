using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GTravel.Domain.Data;
using GTravel.Domain.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GTravel.Areas.Admin.Controllers
{
    public class HomeController : AdminController
    {
        public HomeController(ApplicationDbContext db)
        :base(db)
        {

        }

        public IActionResult Index()
        {
            AdminHomeIndexViewModel homeVM = new AdminHomeIndexViewModel() { 
            Tours = _db.Tours.Where(t => t.StatusId == 1).Take(3).ToList(),
            Orders = _db.Orders.Include(o=>o.Tour).Include(o=>o.Customer).Where(o => o.OrderConfirmed == false).Take(3).ToList()
        }; 
            
            return View(homeVM);
        }
    }
}
