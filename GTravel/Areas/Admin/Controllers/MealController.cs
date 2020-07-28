using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GTravel.Domain;
using GTravel.Domain.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GTravel.Areas.Admin.Controllers
{
    public class MealController : AdminController
    {
        public MealController(ApplicationDbContext db)
            :base(db)
        {

        }

        public IActionResult Details(int id)
        {
            var dbTour = _db.Tours.Include(t => t.Meal).FirstOrDefault(t => t.Id == id);
                       
            return View(dbTour);

        }

        public IActionResult Upsert(int tourId)
        {
            var dbtour = _db.Tours.Include(t => t.Meal).FirstOrDefault(t => t.Id == tourId);
            if (dbtour.Meal != null)
            {
                return View(dbtour.Meal);
            }
            else {
                Meal meal = new Meal();
                meal.TourId = tourId;
                
            return View(meal);
            }       
        
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public IActionResult Upsert(int tourId, [Bind("Breakfast,Lunch,Dinner")] Meal meal)
        {
            if (ModelState.IsValid)
            {
                var dbTour = _db.Tours.Include(t => t.Meal).FirstOrDefault(t => t.Id == tourId);

                if (dbTour.Meal == null)
                {
                    meal.TourId = tourId;
                    _db.Meals.Add(meal);

                }
                else
                {

                    var dbMeal = dbTour.Meal;
                    dbMeal.Breakfast = meal.Breakfast;
                    dbMeal.Lunch = meal.Lunch;
                    dbMeal.Dinner = meal.Dinner;
                    _db.Meals.Update(dbMeal);
                }

                _db.SaveChanges();
                return RedirectToAction("Details", new { id = tourId });

            }
            else {

                return RedirectToAction("Index","Tour");
            
            }
        
        }


        #region API CALLS

        [HttpDelete]
        public IActionResult Delete(int id)
        {
            var dbMeal = _db.Meals.FirstOrDefault(a => a.Id == id);
            if (dbMeal == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }
            _db.Meals.Remove(dbMeal);
            _db.SaveChanges();
            return Json(new { success = true, message = "Delete Successful" });
        }

        #endregion
    }
}
