using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using GTravel.Domain;
using GTravel.Domain.Data;
using GTravel.Domain.ViewModels;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace GTravel.Areas.Admin.Controllers
{
    public class TourController : AdminController
    {
        private readonly IWebHostEnvironment _hostEnvironment;

        public TourController(ApplicationDbContext db, IWebHostEnvironment hostEnvironment)
            :base(db)
        {
            _hostEnvironment = hostEnvironment;
        }

        public IActionResult Index()
        {

            return View();
        }


        public IActionResult Create()
        {
            SelectListViewModel<Tour> tourVm = new SelectListViewModel<Tour>()
            {
                Entity = new Tour(),
                SelectListItems = new SelectList(_db.Cities.OrderBy(c => c.Name).ToList(), "Name", "Name")
            };

            return View(tourVm);
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public IActionResult Create([Bind("Name, TourDurationDays,DepartureLocation,BriefDescription,FullDescription,AccommodationNumberOfNights,MaxCapacity,RRP")] Tour tour)
        {
            if (ModelState.IsValid)
            {              
                tour.ImageUrl = GetImageUrl();
                tour.StatusId = 1;
                _db.Tours.Add(tour);
                _db.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            else {

                SelectListViewModel<Tour> tourVmForRedirect = new SelectListViewModel<Tour>()
                {
                    Entity = new Tour(),
                    SelectListItems = new SelectList(_db.Cities.OrderBy(c => c.Name).ToList(), "Name", "Name")
                };

                return View(tourVmForRedirect);
            }        
        }

        public IActionResult Update(int id)
        {
            if (id == 0)
            { 
                return RedirectToAction(nameof(Index));
            }
            var dbTour = _db.Tours.FirstOrDefault(t => t.Id == id);

            SelectListViewModel<Tour> tourVm = new SelectListViewModel<Tour>()
            {
                Entity = dbTour,
                SelectListItems = new SelectList(_db.Cities.OrderBy(c => c.Name).ToList(), "Name", "Name")
            };

            return View(tourVm);
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public IActionResult Update(int id,[Bind("Name, TourDurationDays,DepartureLocation,BriefDescription,FullDescription,AccommodationNumberOfNights,MaxCapacity,RRP")] Tour tour)
        {
            if (ModelState.IsValid)
            {
                var dbTour = _db.Tours.Find(id);
                if (dbTour == null)
                {
                    return NotFound();
                }
                else {
                    dbTour.Name = tour.Name;
                    dbTour.TourDurationDays = tour.TourDurationDays;
                    dbTour.DepartureLocation = tour.DepartureLocation;
                    dbTour.BriefDescription = tour.BriefDescription;
                    dbTour.FullDescription = tour.FullDescription;
                    dbTour.AccommodationNumberOfNights = tour.AccommodationNumberOfNights;
                    dbTour.MaxCapacity = tour.MaxCapacity;
                    dbTour.RRP = tour.RRP;
                    dbTour.ImageUrl = GetImageUrl(dbTour.ImageUrl);

                    _db.Tours.Update(dbTour);
                    _db.SaveChanges();
                    return RedirectToAction(nameof(Index));

                }
            }
            else {
                var dbTour = _db.Tours.FirstOrDefault(t => t.Id == id);

                SelectListViewModel<Tour> tourVmForRedirect = new SelectListViewModel<Tour>()
                {
                    Entity = dbTour,
                    SelectListItems = new SelectList(_db.Cities.OrderBy(c => c.Name).ToList(), "Name", "Name")
                };


                return View(tourVmForRedirect);
            }
        }


        public IActionResult Details(int id)
        {
            var dbTour = _db.Tours
                .Include(t=>t.Meal)
                .Include(t=>t.TourCities)
                    .ThenInclude(tc=>tc.City)
                .Include(t => t.TourCities)
                    .ThenInclude(tc=>tc.TourAttractions)
                        .ThenInclude(tca=>tca.Attraction)
                .FirstOrDefault(t => t.Id == id);
           
            return View(dbTour);
        }




        #region API CALLS

        public IActionResult GetAll()
        {
            
            return Json(new
            {
                data = _db.Tours
                .Include(t => t.TourCities)
                .Select(t => new {
                    t.Id, t.Name,t.MaxCapacity,t.Status
                })
                .ToList()
            });


        }


        [HttpDelete]
        public IActionResult Delete(int id)
        {
            var dbTour = _db.Tours.FirstOrDefault(p => p.Id == id);
            string webRootPath = _hostEnvironment.WebRootPath;
            DeleteImageUrl(webRootPath, dbTour.ImageUrl);
            
            if (dbTour == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }
            _db.Tours.Remove(dbTour);
            _db.SaveChanges();
            return Json(new { success = true, message = "Delete Successful" });

        }

        [HttpPost]
        public IActionResult Publish(int id)
        {
            var dbTour = _db.Tours.FirstOrDefault(p => p.Id == id);
            if (dbTour == null)
            {
                return Json(new { success = false, message = "Error while publishing, please try again" });
            }

            dbTour.StatusId = 2;
            _db.Tours.Update(dbTour);
            _db.SaveChanges();

            return Json(new { success = true, message = "Publish Successful!" });

        }

        #endregion

        public string GetImageUrl(string imageUrl = "")
        {
            string webRootPath = _hostEnvironment.WebRootPath;
            var files = HttpContext.Request.Form.Files;

            if (files.Count == 0 && imageUrl != "")
            {
                return imageUrl;

            }            
            string fileName = Guid.NewGuid().ToString();
            var uploads = Path.Combine(webRootPath, @"images");
            var extension = Path.GetExtension(files[0].FileName);
            DeleteImageUrl(webRootPath, imageUrl);
            

            using (var fileStreams = new FileStream(Path.Combine(uploads, fileName + extension), FileMode.Create))
            {
                files[0].CopyTo(fileStreams);
            }
            string updatedImageUrl = @"\images\" + fileName + extension;


            return updatedImageUrl;
        }

        public void DeleteImageUrl(string webRootPath,string imageUrl)
        {
            imageUrl = Path.Combine(webRootPath, imageUrl.TrimStart('\\'));
            if (System.IO.File.Exists(imageUrl))
            {
                System.IO.File.Delete(imageUrl);
            }

        }
    }
}
