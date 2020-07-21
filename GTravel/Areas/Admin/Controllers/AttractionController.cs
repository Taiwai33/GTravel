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
    public class AttractionController : AdminController
    {
        public AttractionController(ApplicationDbContext db)
            :base(db)
        {

        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Upsert(int? id, int? cityId)
        {
            SelectListViewModel<Attraction> vmAttraction = new SelectListViewModel<Attraction>()
            {
                Entity = new Attraction(),
                SelectListItems = new SelectList(_db.Cities.OrderBy(c => c.Name), "Id", "Name")
            };

            if (cityId != null)
            {
                var dbCity = _db.Cities.Find(cityId);
                if (dbCity != null)
                {
                    vmAttraction.Entity.CityId = dbCity.Id;
                }
            }

            if (id != null)
            {
                vmAttraction.Entity = _db.Attractions.FirstOrDefault(a => a.Id == id);
            }

            return View(vmAttraction);
        }


        [ValidateAntiForgeryToken]
        [HttpPost]
        public async Task<IActionResult> Upsert(int? id, [Bind("Name,Description,CityId")] Attraction attraction)
        {
            if (ModelState.IsValid)
            {
                if (id == null)
                {
                    _db.Attractions.Add(attraction);
                }
                else
                {
                    var dbAttraction = _db.Attractions.FirstOrDefault(a => a.Id == id);

                    dbAttraction.CityId = attraction.CityId;
                    dbAttraction.Description = attraction.Description;
                    dbAttraction.Name = attraction.Name;
                   
                    _db.Attractions.Update(dbAttraction);
                }
                await _db.SaveChangesAsync();

                return RedirectToAction(nameof(Index));

            }

            return View(attraction);

        }




        #region API CALLS

        public IActionResult GetAll()
        {
            return Json(new { data = _db.Attractions
                .Include(a=>a.City)
                .Select(a=> new { 
                a.Id,a.Name, City = a.City.Name, a.City.State
                })
                .ToList() });
        
        }

        [HttpDelete]
        public IActionResult Delete(int id)
        {
            var dbAttraction = _db.Attractions.FirstOrDefault(a => a.Id == id);
            if (dbAttraction == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }
            _db.Attractions.Remove(dbAttraction);
            _db.SaveChanges();
            return Json(new { success = true, message = "Delete Successful" });

        }

        #endregion
    }
}
