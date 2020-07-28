using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GTravel.Domain;
using GTravel.Domain.Data;
using GTravel.Domain.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace GTravel.Areas.Admin.Controllers
{
    public class TourCityController : AdminController
    {
        public TourCityController(ApplicationDbContext db)
            :base(db)
        {

        }
        public IActionResult Index(int tourId)
        {
            var dbTour = _db.Tours.FirstOrDefault(t=> t.Id == tourId);
            if (dbTour != null)
            {
                return View(dbTour);
            }

            return RedirectToAction("Index", "Tour");
        }



        public IActionResult Create(int tourId)
        {
            if (tourId != 0)
            {
                TourCity tourCity = new TourCity() { TourId = tourId };
                return View(tourCity);
            }

            return View(nameof(Index) , new { tourId = tourId});        
        }


        [ValidateAntiForgeryToken]
        [HttpPost]
        public IActionResult Create(int tourId, [Bind("CityId")] TourCity tourCity)
        {
            if (ModelState.IsValid)
            {
                tourCity.TourId = tourId;
                _db.TourCities.Add(tourCity);
                _db.SaveChanges();

                return RedirectToAction("Index", new { tourId });

            }
            else { 
            
                TourCity d = new TourCity() { TourId = tourId };

            }

            return View();
        }

        #region API CALLS

        public IActionResult GetAll(int tourId)
        {
            return Json(new
            {
                data = _db.TourCities
            .Include(tc => tc.City)
            .Select(tc => new
            {
                City = tc.City.Name,
                tc.City.State, tc.TourId, tc.Id
            })
            .Where(tc=>tc.TourId == tourId)
            .ToList()
            });
        
        
        }
        
        #endregion

    }
}
