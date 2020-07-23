using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace GTravel.Domain.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Tour> Tours{ get; set; }
        public DbSet<TourCity> TourCities{ get; set; }
        public DbSet<TourAttraction> TourAttractions { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<Attraction> Attractions { get; set; }
        public DbSet<Meal> Meals { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<Attraction>().Property(a => a.Name).IsRequired();
            builder.Entity<Attraction>().Property(a => a.Description).IsRequired();

            builder.Entity<City>().Property(c => c.Name).IsRequired();
            builder.Entity<City>().Property(c => c.State).IsRequired().HasMaxLength(5);
            builder.Entity<City>().Property(c => c.PostCode).IsRequired().HasMaxLength(8);
            builder.Entity<City>().Property(c => c.Longitude).HasColumnType("nvarchar(MAX)");
            builder.Entity<City>().Property(c => c.Latitude).HasColumnType("nvarchar(MAX)");


            builder.Entity<Tour>().Property(t => t.Name).IsRequired();
            builder.Entity<Tour>().Property(t => t.DepartureLocation).IsRequired();
            builder.Entity<Tour>().Property(t => t.BriefDescription).IsRequired().HasMaxLength(50);
            builder.Entity<Tour>().Property(t => t.FullDescription).IsRequired();
            builder.Entity<Tour>().Property(t => t.RRP).HasColumnType("decimal(7,2)");
            builder.Entity<Tour>().Property(p => p.ImageUrl).HasColumnType("nvarchar(max)").HasColumnName("Image");

            builder.Entity<TourAttraction>().HasIndex(pa => new { pa.AttractionId, pa.TourCityId }).IsUnique();










        }
    }
}
