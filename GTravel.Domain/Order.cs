namespace GTravel.Domain
{
    public class Order
    {
        public int Id { get; set; }
        public decimal SalePrice { get; set; }
        public bool OrderConfirmed { get; set; }
        public int CustomerId { get; set; }
        public Customer Customer { get; set; }
        public int TourId{ get; set; }
        public Tour Tour { get; set; }

        // public ICollection<Payments> Payments { get; set; }
    }
}