using System;
using System.Collections.Generic;
using System.Text;

namespace GTravel.Domain
{
    public class Tour
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int TourDurationDays { get; set; }
        public string DepartureLocation { get; set; }
        public string BriefDescription { get; set; }
        public string FullDescription { get; set; }
        public int AccommodationNumberOfNights { get; set; }
        public decimal RRP { get; set; }
        public string ImageUrl { get; set; }
        public int MaxCapacity { get; set; }
        public int StatusId { get; set; }
        public SD.TourStatus Status{ get => (SD.TourStatus)StatusId; }
        public Meal Meal { get; set; }
        public ICollection<TourCity> TourCities { get; set; } = new List<TourCity>();

    }
}
