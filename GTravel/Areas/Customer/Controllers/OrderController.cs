using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GTravel.Domain;
using GTravel.Domain.Data;
using Microsoft.AspNetCore.Mvc;

namespace GTravel.Areas.Customer.Controllers
{
    public class OrderController : CustomerController
    {
        public OrderController(ApplicationDbContext db)
            :base(db)
        {

        }
        public IActionResult Create(int tourId)
        {
            var tour = _db.Tours.FirstOrDefault(t => t.Id == tourId);

            if (tour != null)
            {
                Order order = new Order()
                {
                    Tour = tour,
                    Customer = new Domain.Customer()
                };

                return View(order);

            }

            return NotFound();
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public IActionResult Create(int tourId, [Bind("FirstName,LastName,StreetAddress,City,State,PostCode,Phone,Email")]Domain.Customer customer)
        {
            if (ModelState.IsValid)
            {
                customer.State = Enum.GetName(typeof(SD.States), int.Parse(customer.State));
                _db.Customers.Add(customer);
                _db.SaveChanges();

                var dbTour = _db.Tours.FirstOrDefault(t => t.Id == tourId);
                if (dbTour != null)
                {

                    Order order = new Order()
                    {
                        TourId = tourId,
                        CustomerId = customer.Id,
                        SalePrice = dbTour.RRP,
                        OrderConfirmed = false
                    };

                    _db.Orders.Add(order);
                    _db.SaveChanges();

                    return RedirectToAction("OrderConfirmation", "Order", new { orderId = order.Id });
                }
                
            }

            return RedirectToAction("Index", "Home");
        }

        public IActionResult OrderConfirmation(int orderId)
        {

            return View(orderId);
        }


    }
}
