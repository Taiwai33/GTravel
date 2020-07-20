using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GTravel.Domain.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GTravel.Areas.Admin.Controllers
{
    public class TourController : AdminController
    {
        public TourController(ApplicationDbContext db)
            :base(db)
        {

        }

        public IActionResult Index()
        {
            return View();
        }







        #region API CALLS


        public IActionResult GetAll()
        {
            return Json(new
            {
                data = _db.Tours
                .Include(t => t.Meal)
                .Include(t => t.TourCities)
                    .ThenInclude(tc=>tc.City)
                .Select(t=>new { 
                t.Id,t.Name,t.DepartureLocation, Cities = t.TourCities.Count
                })

            });
        
        }


        #endregion
    }
}
