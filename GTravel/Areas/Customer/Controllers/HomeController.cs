using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using GTravel.Domain.ViewModels;
using GTravel.Areas.Customer.Controllers;
using GTravel.Domain.Data;

namespace GTravel.Controllers
{
    public class HomeController : CustomerController
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger, ApplicationDbContext db)
            :base(db)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            HomeIndexViewModel homeIndexVM = new HomeIndexViewModel()
            {
                Tours = _db.Tours.Where(t => t.StatusId == 2).ToList()
            };
            return View(homeIndexVM);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
