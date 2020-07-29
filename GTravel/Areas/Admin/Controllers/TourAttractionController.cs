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

        public IActionResult Create(int tourCityId)
        {
            var dbTourCity = _db.TourCities.Include(tc => tc.Tour).FirstOrDefault(tc => tc.Id == tourCityId);
            var attractionsAssociatedToCurrentTourCity = _db.Attractions.Where(a => a.CityId == dbTourCity.CityId).ToList();
            var dbAttractions = _db.Attractions
                .Where(a => a.TourAttractions.Count() > 0 && a.CityId == dbTourCity.CityId).ToList();

            if (dbTourCity != null)
            {
                SelectListViewModel<TourAttraction> vmTourAttraction = new SelectListViewModel<TourAttraction>()
                {
                    Entity = new TourAttraction() { TourCity = dbTourCity },
                    SelectListItems = new SelectList (attractionsAssociatedToCurrentTourCity.Except(dbAttractions),"Id","Name")
                };
                
                return View(vmTourAttraction);
            }
            else {

                return RedirectToAction("Index","TourAttraction", new { id = tourCityId});
            }
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public IActionResult Create(int tourCityId, [Bind("AttractionId")]TourAttraction tourAttraction)
        {
            if (ModelState.IsValid)
            {
                tourAttraction.TourCityId = tourCityId;
                _db.TourAttractions.Add(tourAttraction);
                _db.SaveChanges();
                return RedirectToAction("Index", "TourAttraction", new { id = tourCityId });
            }
            else {

                return RedirectToAction("Index", "Tour");

            }
        }



        #region API CALLS
        public IActionResult GetAll(int id)//tourCityId
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
            var tourAttraction = _db.TourAttractions.FirstOrDefault(pc => pc.Id == id);
            if (tourAttraction == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }
            _db.TourAttractions.Remove(tourAttraction);
            _db.SaveChanges();
            return Json(new { success = true, message = "Delete Successful" });

        }

        #endregion
    }
}
