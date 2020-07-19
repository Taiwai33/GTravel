namespace GTravel.Domain
{
    public class TourAttraction
    {
        public int Id { get; set; }
        public int TourCityId { get; set; }
        public TourCity TourCity { get; set; }
        public int AttractionId { get; set; }
        public Attraction Attraction { get; set; }
    }
}