using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using GTravel.Domain.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GTravel.Areas.Admin.Controllers
{
    [Authorize(Roles ="Admin")]
    public class EmployeeController : AdminController
    {
        public EmployeeController(ApplicationDbContext db)
            :base(db)
        {

        }
        public IActionResult Index()
        {
            var claimsIdentity = (ClaimsIdentity)this.User.Identity;
            var claims = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);
            var allButCurrentEmployees = _db.Employees.Where(u => u.Id != claims.Value).ToList();

            return View(allButCurrentEmployees);
        }
    }
}
