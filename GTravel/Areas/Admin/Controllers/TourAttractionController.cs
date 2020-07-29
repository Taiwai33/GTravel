using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GTravel.Domain.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GTravel.Areas.Admin.Controllers
{
    public class TourAttractionController : AdminController
    {

        public TourAttractionController(ApplicationDbContext db)
            :base(db)
        {

        }
        public IActionResult Index(int id) //tourCityId
        {
            var dbTourCity = _db.TourCities.Include(tc => tc.Tour).FirstOrDefault(tc => tc.Id == id);

            if (dbTourCity != null)
            {
                return View(dbTourCity);
            
            }
            return RedirectToAction("Index", "Tour");

        }



        #region API CALLS
        public IActionResult GetAll(int id)//packageCity
        {

            return Json(new
            {
                data = _db.TourAttractions
                                .Include(pa => pa.TourCity)
                                    .ThenInclude(pc => pc.City)
                                .Include(pa => pa.Attraction)
                                .Select(pa => new
                                {
                                    pa.Id,
                                    pa.TourCityId,
                                    Attraction = pa.Attraction.Name,
                                    pa.AttractionId,
                                    pa.Attraction.Description,
                                    City = pa.TourCity.City.Name
                                })
                                .Where(pc => pc.TourCityId == id)
            });
        }

        public IActionResult Delete(int id)
        {
            var tourCityDb = _db.TourCities.FirstOrDefault(pc => pc.Id == id);
            if (tourCityDb == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }
            _db.TourCities.Remove(tourCityDb);
            _db.SaveChanges();
            return Json(new { success = true, message = "Delete Successful" });

        }

        #endregion
    }
}
