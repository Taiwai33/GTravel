using GTravel.Domain.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GTravel.Domain.Initialiser
{
    public class DbInitialiser : IDbInitialiser
    {
        //Dependancy Injection
        private readonly ApplicationDbContext _db;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        public DbInitialiser(UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager, ApplicationDbContext db)
        {
            _db = db;
            _userManager = userManager;
            _roleManager = roleManager;

        }

        public void Initialise()
        {
            try
            {
                if (_db.Database.GetPendingMigrations().Count() > 0)    //any pending migrations?
                {
                    _db.Database.Migrate();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            if (_db.Roles.Any(r => r.Name == "Admin")) return;

            _roleManager.CreateAsync(new IdentityRole("Admin")).GetAwaiter().GetResult();//makes sure this executes before proceceding with anything else
            _roleManager.CreateAsync(new IdentityRole("Manager")).GetAwaiter().GetResult();
            _roleManager.CreateAsync(new IdentityRole("Customer")).GetAwaiter().GetResult();

            _userManager.CreateAsync(new IdentityUser        //can also use IDENTITYUSER or applicationUser
            {
                UserName = "admin@gmail.com",
                Email = "admin@gmail.com",
                EmailConfirmed = true,
                //can set other properties, this is for the initial setup
            }, "Abc123!").GetAwaiter().GetResult();

            IdentityUser user = _db.Users.Where(u => u.Email == "admin@gmail.com").FirstOrDefault();
            _userManager.AddToRoleAsync(user, "Admin").GetAwaiter().GetResult(); //single user obj so make sure it is role not roles


        }
    }
}
