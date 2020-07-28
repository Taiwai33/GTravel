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
        public IActionResult Index(int id)
        {
            var dbTour = _db.Tours.FirstOrDefault(t=> t.Id == id);
            if (dbTour != null)
            {
                return View(dbTour);
            }

            return RedirectToAction("Index", "Tour");
        }



        public IActionResult Create(int tourId)
        {
            var dbTour = _db.Tours.FirstOrDefault(t => t.Id == tourId);
           
            if (dbTour != null)
            {

                SelectListViewModel<TourCity> vmTourCity = new SelectListViewModel<TourCity>()
                {
                    Entity = new TourCity() {Tour = dbTour},
                    SelectListItems = new SelectList(_db.Cities.OrderBy(c => c.Name), "Id", "Name")
                };
                return View(vmTourCity);
            }

            return RedirectToAction("Index","TourCity", new { tourId});        
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

                return RedirectToAction("Index","TourCity", new { id = tourId });

            }
            else { 
            
                TourCity city = new TourCity() { TourId = tourId };
                return View(city);
            }

        }


        public IActionResult Update(int id)
        {
            var dbTourCity = _db.TourCities.Include(tc => tc.Tour).FirstOrDefault(tc=> tc.Id == id);

            if (dbTourCity != null)
            {
                SelectListViewModel<TourCity> vmTourCity = new SelectListViewModel<TourCity>()
                {
                    Entity = dbTourCity,
                    SelectListItems = new SelectList(_db.Cities.OrderBy(c => c.Name), "Id", "Name")
                };
                return View(vmTourCity);
            }
            return RedirectToAction("Index","TourCity", new { tourId = dbTourCity.TourId});

        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public IActionResult Update(int tourCityId,[Bind("CityId")]TourCity tourCity)
        {
            if (ModelState.IsValid)
            {
                var dbTourCity = _db.TourCities.FirstOrDefault(tc => tc.Id == tourCityId);
                if (dbTourCity == null)
                {
                    return NotFound();
                }
                dbTourCity.CityId = tourCity.CityId;
                _db.TourCities.Update(dbTourCity);
                _db.SaveChanges();         
                return RedirectToAction(nameof(Index), new { id = dbTourCity.TourId});

            }
            else
            {
                var dbTourCity = _db.TourCities.FirstOrDefault(tc => tc.Id == tourCityId);

                SelectListViewModel<TourCity> vmTourCity = new SelectListViewModel<TourCity>()
                {
                    Entity = dbTourCity,
                    SelectListItems = new SelectList(_db.Cities.OrderBy(c => c.Name), "Id", "Name")
                };
                return View(vmTourCity);
            }
        }





        #region API CALLS

        public IActionResult GetAll(int id)
        {
            return Json(new
            {
                data = _db.TourCities
            .Include(tc => tc.City)
            .Select(tc => new
            {
                City = tc.City.Name,
                tc.City.State, tc.TourId,TourCityId = tc.Id
            })
            .Where(tc=>tc.TourId == id)
            .ToList()
            });
        
        
        }

        [HttpDelete]
        public IActionResult Delete(int id)
        {
            var dbTourCity = _db.TourCities.FirstOrDefault(a => a.Id == id);
            if (dbTourCity == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }
            _db.TourCities.Remove(dbTourCity);
            _db.SaveChanges();
            return Json(new { success = true, message = "Delete Successful" });

        }
        #endregion

    }
}
