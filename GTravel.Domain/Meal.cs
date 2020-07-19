namespace GTravel.Domain
{
    public class Meal
    {
        public int Id { get; set; }
        public int Breakfast { get; set; }
        public int Lunch { get; set; }
        public int Dinner { get; set; }
       
        
        public int TourId { get; set; }
        public Tour Tour { get; set; }
    }
}