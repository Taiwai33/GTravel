using System.Collections.Generic;

namespace GTravel.Domain
{
    public class TourCity
    {
        public int Id { get; set; }
        public int PackageId { get; set; }
        public Tour Tour{ get; set; }
        public int CityId { get; set; }
        public City City { get; set; }
        public ICollection<TourAttraction> TourAttractions { get; set; } = new List<TourAttraction>();
    }
}