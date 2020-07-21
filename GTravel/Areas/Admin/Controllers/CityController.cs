using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using GTravel.Domain;
using GTravel.Domain.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace GTravel.Areas.Admin.Controllers
{
    public class CityController :AdminController
    {

        public CityController(ApplicationDbContext db)
            :base(db)
        {

        }
        public IActionResult Index()
        {
            return View();
        }


        public IActionResult Upsert(int? id)
        {
            var city = new City();
            if (id != null)
            {
                city = _db.Cities.FirstOrDefault(c => c.Id == id);
            }


            return View(city);
        }


        [ValidateAntiForgeryToken]
        [HttpPost]
        public async Task<IActionResult> Upsert(int? id, [Bind("Name,State,PostCode,Longitude,Latitude")]City city)
        {
            if (ModelState.IsValid)
            {
                if (id == null)
                {
                    city.Name = ConvertToCamelCase(city.Name);
                    _db.Cities.Add(city);
                }
                else {
                    var dbCity = _db.Cities.FirstOrDefault(c => c.Id == id);
                                        
                    dbCity.State = city.State;
                    dbCity.PostCode = city.PostCode;
                    dbCity.Latitude = city.Latitude;
                    dbCity.Longitude = city.Longitude;
                    dbCity.Name = ConvertToCamelCase(city.Name);
                    
                   
                    _db.Cities.Update(dbCity);              
                
                }
                await _db.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            return View(city);

        }

        #region API CALLS

        public IActionResult GetAll()
        {
             

            return Json(new { data = _db.Cities.ToList() });    
        
        
        }

        [HttpDelete]
        public IActionResult Delete(int id)
        {
            var dbCity = _db.Cities.FirstOrDefault(a => a.Id == id);
            if (dbCity == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }
            _db.Cities.Remove(dbCity);
            _db.SaveChanges();
            return Json(new { success = true, message = "Delete Successful" });

        }
        #endregion

        public string ConvertToCamelCase(string input)
        {
            TextInfo myTI = new CultureInfo("en-US", false).TextInfo;
            return myTI.ToTitleCase(input);
        }

       
    }
}
