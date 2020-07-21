using System.Collections.Generic;

namespace GTravel.Domain
{
    //public enum States { NSW , QLD, WA, SA, VIC, TAS, NT, ACT }
    public class City
    {
        public int Id { get; set; }
        public int PostCode { get; set; }
        public string Name { get; set; }
        public string State { get; set; }
        public float Longitude { get; set; }
        public float Latitude { get; set; }

        public ICollection<Attraction> Attractions { get; set; } = new List<Attraction>();
    }
}